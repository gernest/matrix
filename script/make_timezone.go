package main

import (
	"errors"
	"flag"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"sort"
	"strings"
	"text/template"
)

func init() {
	log.SetFlags(log.Llongfile)
}
func main() {
	flag.Parse()
	args := flag.Args()
	var dir string
	if len(args) > 0 {
		dir = args[0]
	} else {
		d, err := os.Getwd()
		if err != nil {
			log.Fatal(err)
		}
		dir = d
	}
	var names []string
	var locations []*Location

	err := filepath.Walk(dir, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		if info.IsDir() {
			return nil
		}
		name, err := filepath.Rel(dir, path)
		if err != nil {
			return err
		}
		names = append(names, name)

		b, err := ioutil.ReadFile(filepath.Join(path, info.Name()))
		if err != nil {
			log.Println("here")
			return err
		}
		l, err := LoadLocationFromTZData(name, b)
		if err != nil {
			return err
		}
		locations = append(locations, l)
		return nil
	})
	if err != nil {
		log.Fatal(err)
	}

	sort.Strings(names)
	tpl, err := template.New("tpl").Funcs(template.FuncMap{
		"enumName": func(name string) string {
			name = strings.Replace(name, string(filepath.Separator), "_", -1)
			name = strings.Replace(name, "-", "_", -1)
			name = strings.Replace(name, "+", "_plus_", -1)
			return name
		},
	}).Parse(zigTemplate)
	if err != nil {
		log.Fatal(err)
	}
	err = tpl.Execute(os.Stdout, map[string]interface{}{
		"names":     names,
		"locations": locations,
		"total":     len(names),
	})
	if err != nil {
		log.Fatal(err)
	}
}

const zigTemplate = `
const std=@import("std);
const FixedBufferAllocator=std.heap.FixedBufferAllocator;
pub const Location=struct{
  name:[]const u8,
  zone:[]zone,
  tz:zoneTrans,
};

const zone=struct{
name:[]const u8,
offset:isize,
is_dst:bool,
};
const zoneTrans=struct{
when: i64,
index:usize,
is_std:bool,
is_utc:bool,
};

const zone_name_list=[][]const u8{
{{range .names -}}
"{{.}}",
{{- end}}
};
pub const TimeZone=enum(usize){
  {{range .names -}}
  {{.|enumName}},
  {{end}}
};
{{range .locations}}
{{.Name}}
{{end}}
`

type Location struct {
	Name string
	zone []zone
	tx   []zoneTrans

	// Most lookups will be for the current time.
	// To avoid the binary search through tx, keep a
	// static one-element cache that gives the correct
	// zone for the time when the Location was created.
	// if cacheStart <= t < cacheEnd,
	// lookup can return cacheZone.
	// The units for cacheStart and cacheEnd are seconds
	// since January 1, 1970 UTC, to match the argument
	// to lookup.
	cacheStart int64
	cacheEnd   int64
	cacheZone  *zone
}

// A zone represents a single time zone such as CEST or CET.
type zone struct {
	name   string // abbreviated name, "CET"
	offset int    // seconds east of UTC
	isDST  bool   // is this zone Daylight Savings Time?
}

// A zoneTrans represents a single time zone transition.
type zoneTrans struct {
	when         int64 // transition time, in seconds since 1970 GMT
	index        uint8 // the index of the zone that goes into effect at that time
	isstd, isutc bool  // ignored - no idea what these mean
}

// alpha and omega are the beginning and end of time for zone
// transitions.
const (
	alpha = -1 << 63  // math.MinInt64
	omega = 1<<63 - 1 // math.MaxInt64
)

// maxFileSize is the max permitted size of files read by readFile.
// As reference, the zoneinfo.zip distributed by Go is ~350 KB,
// so 10MB is overkill.
const maxFileSize = 10 << 20

type fileSizeError string

func (f fileSizeError) Error() string {
	return "time: file " + string(f) + " is too large"
}

// Copies of io.Seek* constants to avoid importing "io":
const (
	seekStart   = 0
	seekCurrent = 1
	seekEnd     = 2
)

// Simple I/O interface to binary blob of data.
type dataIO struct {
	p     []byte
	error bool
}

func (d *dataIO) read(n int) []byte {
	if len(d.p) < n {
		d.p = nil
		d.error = true
		return nil
	}
	p := d.p[0:n]
	d.p = d.p[n:]
	return p
}

func (d *dataIO) big4() (n uint32, ok bool) {
	p := d.read(4)
	if len(p) < 4 {
		d.error = true
		return 0, false
	}
	return uint32(p[3]) | uint32(p[2])<<8 | uint32(p[1])<<16 | uint32(p[0])<<24, true
}

func (d *dataIO) byte() (n byte, ok bool) {
	p := d.read(1)
	if len(p) < 1 {
		d.error = true
		return 0, false
	}
	return p[0], true
}

// Make a string by stopping at the first NUL
func byteString(p []byte) string {
	for i := 0; i < len(p); i++ {
		if p[i] == 0 {
			return string(p[0:i])
		}
	}
	return string(p)
}

var badData = errors.New("malformed time zone information")

// LoadLocationFromTZData returns a Location with the given name
// initialized from the IANA Time Zone database-formatted data.
// The data should be in the format of a standard IANA time zone file
// (for example, the content of /etc/localtime on Unix systems).
func LoadLocationFromTZData(name string, data []byte) (*Location, error) {
	d := dataIO{data, false}

	// 4-byte magic "TZif"
	if magic := d.read(4); string(magic) != "TZif" {
		return nil, badData
	}

	// 1-byte version, then 15 bytes of padding
	var p []byte
	if p = d.read(16); len(p) != 16 || p[0] != 0 && p[0] != '2' && p[0] != '3' {
		return nil, badData
	}

	// six big-endian 32-bit integers:
	//	number of UTC/local indicators
	//	number of standard/wall indicators
	//	number of leap seconds
	//	number of transition times
	//	number of local time zones
	//	number of characters of time zone abbrev strings
	const (
		NUTCLocal = iota
		NStdWall
		NLeap
		NTime
		NZone
		NChar
	)
	var n [6]int
	for i := 0; i < 6; i++ {
		nn, ok := d.big4()
		if !ok {
			return nil, badData
		}
		n[i] = int(nn)
	}

	// Transition times.
	txtimes := dataIO{d.read(n[NTime] * 4), false}

	// Time zone indices for transition times.
	txzones := d.read(n[NTime])

	// Zone info structures
	zonedata := dataIO{d.read(n[NZone] * 6), false}

	// Time zone abbreviations.
	abbrev := d.read(n[NChar])

	// Leap-second time pairs
	d.read(n[NLeap] * 8)

	// Whether tx times associated with local time types
	// are specified as standard time or wall time.
	isstd := d.read(n[NStdWall])

	// Whether tx times associated with local time types
	// are specified as UTC or local time.
	isutc := d.read(n[NUTCLocal])

	if d.error { // ran out of data
		return nil, badData
	}

	// If version == 2 or 3, the entire file repeats, this time using
	// 8-byte ints for txtimes and leap seconds.
	// We won't need those until 2106.

	// Now we can build up a useful data structure.
	// First the zone information.
	//	utcoff[4] isdst[1] nameindex[1]
	zone := make([]zone, n[NZone])
	for i := range zone {
		var ok bool
		var n uint32
		if n, ok = zonedata.big4(); !ok {
			return nil, badData
		}
		zone[i].offset = int(int32(n))
		var b byte
		if b, ok = zonedata.byte(); !ok {
			return nil, badData
		}
		zone[i].isDST = b != 0
		if b, ok = zonedata.byte(); !ok || int(b) >= len(abbrev) {
			return nil, badData
		}
		zone[i].name = byteString(abbrev[b:])
	}

	// Now the transition time info.
	tx := make([]zoneTrans, n[NTime])
	for i := range tx {
		var ok bool
		var n uint32
		if n, ok = txtimes.big4(); !ok {
			return nil, badData
		}
		tx[i].when = int64(int32(n))
		if int(txzones[i]) >= len(zone) {
			return nil, badData
		}
		tx[i].index = txzones[i]
		if i < len(isstd) {
			tx[i].isstd = isstd[i] != 0
		}
		if i < len(isutc) {
			tx[i].isutc = isutc[i] != 0
		}
	}

	if len(tx) == 0 {
		// Build fake transition to cover all time.
		// This happens in fixed locations like "Etc/GMT0".
		tx = append(tx, zoneTrans{when: alpha, index: 0})
	}

	// Committed to succeed.
	l := &Location{zone: zone, tx: tx, Name: name}

	// Fill in the cache with information about right now,
	// since that will be the most common lookup.
	// sec, _, _ := time.Now()
	// for i := range tx {
	// 	if tx[i].when <= sec && (i+1 == len(tx) || sec < tx[i+1].when) {
	// 		l.cacheStart = tx[i].when
	// 		l.cacheEnd = omega
	// 		if i+1 < len(tx) {
	// 			l.cacheEnd = tx[i+1].when
	// 		}
	// 		l.cacheZone = &l.zone[tx[i].index]
	// 	}
	// }

	return l, nil
}

// There are 500+ zoneinfo files. Rather than distribute them all
// individually, we ship them in an uncompressed zip file.
// Used this way, the zip file format serves as a commonly readable
// container for the individual small files. We choose zip over tar
// because zip files have a contiguous table of contents, making
// individual file lookups faster, and because the per-file overhead
// in a zip file is considerably less than tar's 512 bytes.

// get4 returns the little-endian 32-bit value in b.
func get4(b []byte) int {
	if len(b) < 4 {
		return 0
	}
	return int(b[0]) | int(b[1])<<8 | int(b[2])<<16 | int(b[3])<<24
}

// get2 returns the little-endian 16-bit value in b.
func get2(b []byte) int {
	if len(b) < 2 {
		return 0
	}
	return int(b[0]) | int(b[1])<<8
}
