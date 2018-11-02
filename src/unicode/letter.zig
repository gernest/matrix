const base = @import("base.zig");
const warn = @import("std").debug.warn;

pub fn is16(ranges: []const base.Range16, r: u16) bool {
    if (ranges.len <= base.linear_max or r <= base.linear_max) {
        for (ranges) |*range| {
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
        const m: usize = lo + ((hi - lo) / 2);
        const range = &ranges[m];
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

pub fn is32(ranges: []base.Range32, r: u32) bool {
    if (ranges.len <= base.linear_max or r <= base.max_latin1) {
        for (ranges) |*range| {
            if (r <= range.lo) {
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
        const m: usize = lo + (hi - lo) / 2;
        const range = &ranges[m];
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

pub fn is(range_tab: *base.RangeTable, r: u32) bool {
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

pub fn isExcludingLatin(range_tab: *const base.RangeTable, r: u32) bool {
    const off = range_tab.latin_offset;
    const r16_len = range_tab.r16.len;
    if (r16_len > off and r < @intCast(u32, range_tab.r16[r16_len - 1].hi)) {
        return is16(range_tab.r16[off..], @intCast(u16, r));
    }
    if (range_tab.r32.len > 0 and r >= range_tab.r32[0].lo) {
        return is32(range_tab.r32, r);
    }
    return false;
}
