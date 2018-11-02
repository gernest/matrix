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

    for (upper_test) |r, i| {
        if (!isUpper(r)) {
            try t.terrorf("\nexpected to be {} to be uppter i={}\n", r, i);
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
