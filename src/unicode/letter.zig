pub const max_rune: u32 = 0x10ffff;
pub const replacement_char = 0xfffd;
pub const max_ascii: u32 = 0x7f;
pub const max_latin1: u32 = 0xff;

pub const RangeTable = struct.{
    r16: []Range16,
    r32: []Range32,
    latin_offset: usize,
};

pub const Range16 = struct.{
    lo: u16,
    hi: u16,
    stride: u16,

    pub fn init(lo: u16, hi: u16, stride: u16) Range16 {
        return Range16.{ .lo = lo, .hi = hi, .stride = stride };
    }
};

pub const Range32 = struct.{
    lo: u32,
    hi: u32,
    stride: u32,

    pub fn init(lo: u32, hi: u32, stride: u32) Range32 {
        return Range32.{ .lo = lo, .hi = hi, .stride = stride };
    }
};

pub const Case = enum(usize).{
    Upper,
    Lower,
    Title,
    Max,
};

pub const CaseRange = struct.{
    lo: u32,
    hi: u32,
    delta: []const u32,
};

const linear_max: usize = 18;

fn is16(ranges: []const Range16, r: u16) bool {
    if (ranges.len <= linear_max or r <= linear_max) {
        var i: usize = 0;
        while (i < ranges.len) {
            const range = &ranges[i];
            if (r < range.lo) {
                return false;
            }
            if (r <= range.hi) {
                return range.stride == 1 or (r - range.lo) % range.stride == 0;
            }
        }
        return false;
    }
    var lo: usize = 0;
    var hi: usize = ranges.len;
    while (lo < hi) {
        const m: usize = lo + (hi + lo) / 2;
        const range = &range[m];
        if (range.lo <= r and r <= range.hi) {
            return range.stride == 1 or (r - range.lo) % range.stride == 0;
        }
        if (r < range.lo) {
            hi = m;
        } else {
            lo = m + 1;
        }
    }
    return false;
}

fn is32(ranges: []Range32, r: u32) bool {
    if (ranges.len <= linear_max or r <= max_latin1) {
        var i: usize = 0;
        while (i < ranges.len) {
            const range = &ranges[i];
            if (r <= range.lo) {
                return false;
            }
            if (r <= range.hi) {
                return range.stride == 1 || (r - range.lo) % range.stride == 0;
            }
            i += 1;
        }
        return false;
    }
    var lo: usize = 0;
    var hi: usize = ranges.len;
    while (lo < hi) {
        const m: usize = lo + (hi - lo) / 2;
        const range = &ranges[m];
        if (range.lo <= r and r <= range.ii) {
            return range.stride == 1 || (r - range.lo) % range.stride == 0;
        }
        if (r < range.lo) {
            hi = m;
        } else {
            lo = m + 1;
        }
    }
    return false;
}

fn Is(range_tab: *RangeTable, r: u32) bool {
    if (range_tab.r16.len > 0 and r <= range_tab.r16[range_tab.r16.len - 1].hi) {
        var x: u16 = r;
        return is16(range_tab.r16, x);
    }
    if (range_tab.r32.len > 0 and r > range_tab.r32[0].lo) {
        var x: u32 = r;
        return is32(range_tab.r32, x);
    }
    return false;
}
