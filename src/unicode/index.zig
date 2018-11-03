const base = @import("base.zig");
const letter = @import("letter.zig");
const tables = @import("tables.zig");

/// isUpper reports whether the rune is an upper case letter.
pub fn isUpper(rune: u32) bool {
    if (rune <= base.max_latin1) {
        const p = tables.properties[@intCast(usize, rune)];
        return (p & base.pLmask) == base.pLu;
    }
    return letter.isExcludingLatin(tables.Upper, rune);
}

// isLower reports whether the rune is a lower case letter.
pub fn isLower(rune: u32) bool {
    if (rune <= base.max_latin1) {
        const p = tables.properties[@intCast(usize, rune)];
        return (p & base.pLmask) == base.pLl;
    }
    return letter.isExcludingLatin(tables.Lower, rune);
}

// IsTitle reports whether the rune is a title case letter.
pub fn isTitle(rune: u32) bool {
    if (rune <= base.max_latin1) {
        return false;
    }
    return letter.isExcludingLatin(tables.Title, rune);
}

const toResult = struct.{
    mapped: u32,
    found_mapping: bool,
};

fn to_case(_case: base.Case, rune: u32, case_range: []base.CaseRange) toResult {
    if (_case.rune() < 0 or base.Case.Max.rune() <= _case.rune()) {
        return toResult.{
            .mapped = base.replacement_char,
            .found_mapping = false,
        };
    }
    var lo: usize = 0;
    var hi = case_range.len;
    while (lo < hi) {
        const m = lo + (hi - lo) / 2;
        const cr = case_range[m];
        if (cr.lo <= rune and rune <= cr.hi) {
            const delta = cr.delta[_case.rune()];
            if (delta > @intCast(i32, base.max_rune)) {
                // In an Upper-Lower sequence, which always starts with
                // an UpperCase letter, the real deltas always look like:
                //{0, 1, 0}    UpperCase (Lower is next)
                //{-1, 0, -1}  LowerCase (Upper, Title are previous)
                // The characters at even offsets from the beginning of the
                // sequence are upper case; the ones at odd offsets are lower.
                // The correct mapping can be done by clearing or setting the low
                // bit in the sequence offset.
                // The constants UpperCase and TitleCase are even while LowerCase
                // is odd so we take the low bit from _case.
                var i: u32 = 1;
                return toResult.{
                    .mapped = cr.lo + ((rune - cr.lo) & ~i | _case.rune() & 1),
                    .found_mapping = true,
                };
            }
            return toResult.{
                .mapped = @intCast(u32, @intCast(i32, rune) + delta),
                .found_mapping = true,
            };
        }
        if (rune < cr.lo) {
            hi = m;
        } else {
            lo = m + 1;
        }
    }
    return toResult.{
        .mapped = rune,
        .found_mapping = false,
    };
}

// to maps the rune to the specified case: UpperCase, LowerCase, or TitleCase.
pub fn to(case: base.Case, rune: u32) u32 {
    const v = to_case(case, rune, tables.CaseRanges);
    return v.mapped;
}

pub fn toUpper(rune: u32) u32 {
    if (rune <= base.max_ascii) {
        if ('a' <= rune and rune <= 'z') {
            return rune - ('a' - 'A');
        }
        return rune;
    }
    return to(base.Case.Upper, rune);
}

pub fn toLower(rune: u32) u32 {
    if (rune <= base.max_ascii) {
        if ('A' <= rune and rune <= 'Z') {
            return rune + ('a' - 'A');
        }
        return rune;
    }
    return to(base.Case.Lower, rune);
}

pub fn toTitle(rune: u32) u32 {
    if (rune <= base.max_ascii) {
        if ('a' <= rune and rune <= 'z') {
            return rune - ('a' - 'A');
        }
        return rune;
    }
    return to(base.Case.Title, rune);
}
