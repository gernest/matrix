const base = @import("base.zig");
const letter = @import("letter.zig");
const tables = @import("tables.zig");
const t = @import("../testing/index.zig");
const warn = @import("std").debug.warn;

/// isUpper reports whether the rune is an upper case letter.
pub fn isUpper(rune: u32) bool {
    if (rune <= base.max_latin1) {
        const p = tables.properties[@intCast(usize, rune)];
        return (p & base.pLmask) == base.pLu;
    }
    return letter.isExcludingLatin(tables.Upper, rune);
}

const notletterTest = []u32.{
    0x20,
    0x35,
    0x375,
    0x619,
    0x700,
    0x1885,
    0xfffe,
    0x1ffff,
    0x10ffff,
};

test "isUpper" {
    const upper_test = []u32.{
        0x41,
        0xc0,
        0xd8,
        0x100,
        0x139,
        0x14a,
        0x178,
        0x181,
        0x376,
        0x3cf,
        0x13bd,
        0x1f2a,
        0x2102,
        0x2c00,
        0x2c10,
        0x2c20,
        0xa650,
        0xa722,
        0xff3a,
        0x10400,
        0x1d400,
        0x1d7ca,
    };
    const notupperTest = []u32.{
        0x40,
        0x5b,
        0x61,
        0x185,
        0x1b0,
        0x377,
        0x387,
        0x2150,
        0xab7d,
        0xffff,
        0x10000,
    };
    for (upper_test) |r, i| {
        if (!isUpper(r)) {
            try t.terrorf("\nexpected {} to be upper i={}\n", r, i);
        }
    }
    for (notupperTest) |r, i| {
        if (isUpper(r)) {
            try t.terrorf("\nexpected {} not to be upper i={}\n", r, i);
        }
    }
    for (notletterTest) |r, i| {
        if (isUpper(r)) {
            try t.terrorf("\nexpected {} not to be upper i={}\n", r, i);
        }
    }
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
