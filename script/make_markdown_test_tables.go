package main

import (
	"encoding/json"
	"log"
	"net/http"
	"os"
	"sort"
	"text/template"
)

const src = "https://spec.commonmark.org/0.28/spec.json"

func main() {
	res, err := http.Get(src)
	if err != nil {
		log.Fatal(err)
	}
	defer res.Body.Close()
	var o []testCase
	err = json.NewDecoder(res.Body).Decode(&o)
	if err != nil {
		log.Fatal(err)
	}
	sort.Slice(o, func(i, j int) bool {
		return o[i].Example < o[j].Example
	})
	s := `
pub const TestCase=struct.{
  start_line:u32,
  end_line:u32,
  example:u32,
  sec:[]const u8,
  html:[]const u8,
  markdown:[]const u8,
};

pub const all_cases=[]TestCase.{
 <<range .>>
TestCase.{
  .start_line=<<.StartLine>>,.end_line=<<.EndLine>>,.example=<<.Example>>,.sec=<<.Section|printf "%q">>,
  .html=<<.HTML|printf "%q">>,
  .markdown=<<.Markdowm|printf "%q">>,
},
 <<end>>
};`
	t, err := template.New("tpl").Delims("<<", ">>").Parse(s)
	if err != nil {
		log.Fatal(err)
	}
	err = t.Execute(os.Stdout, o)
	if err != nil {
		log.Fatal(err)
	}
}

type testCase struct {
	StartLine int64  `json:"start_line"`
	EndLine   int64  `json:"end_line"`
	Section   string `json:"section"`
	HTML      string `json:"Html"`
	Markdowm  string `json:"markdown"`
	Example   int64  `json:"example"`
}
