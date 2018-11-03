const base = @import("base.zig");
const letter = @import("letter.zig");
const tables = @import("tables.zig");
const unicode = @import("index.zig");
const t = @import("../testing/index.zig");
const warn = @import("std").debug.warn;

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
test "isUpper" {
    for (upper_test) |r, i| {
        if (!unicode.isUpper(r)) {
            try t.terrorf("\nexpected {} to be upper i={}\n", r, i);
        }
    }
    for (notupperTest) |r, i| {
        if (unicode.isUpper(r)) {
            try t.terrorf("\nexpected {} not to be upper i={}\n", r, i);
        }
    }
    for (notletterTest) |r, i| {
        if (unicode.isUpper(r)) {
            try t.terrorf("\nexpected {} not to be upper i={}\n", r, i);
        }
    }
}

const caseT = struct.{
    case: base.Case,
    in: u32,
    out: u32,
    fn init(case: base.Case, in: u32, out: u32) caseT {
        return caseT.{ .case = case, .in = in, .out = out };
    }
};

const case_test = []caseT.{

    // ASCII (special-cased so test carefully)
    caseT.init(base.Case.Upper, '\n', '\n'),
    caseT.init(base.Case.Upper, 'a', 'A'),
    caseT.init(base.Case.Upper, 'A', 'A'),
    caseT.init(base.Case.Upper, '7', '7'),
    caseT.init(base.Case.Lower, '\n', '\n'),
    caseT.init(base.Case.Lower, 'a', 'a'),
    caseT.init(base.Case.Lower, 'A', 'a'),
    caseT.init(base.Case.Lower, '7', '7'),
    caseT.init(base.Case.Title, '\n', '\n'),
    caseT.init(base.Case.Title, 'a', 'A'),
    caseT.init(base.Case.Title, 'A', 'A'),
    caseT.init(base.Case.Title, '7', '7'),
    // Latin-1: easy to read the tests!
    caseT.init(base.Case.Upper, 0x80, 0x80),
    // caseT.init(base.Case.Upper, 'Å', 'Å'),
    // caseT.init(base.Case.Upper, 'å', 'Å'),
    caseT.init(base.Case.Lower, 0x80, 0x80),
    // caseT.init(base.Case.Lower, 'Å', 'å'),
    // caseT.init(base.Case.Lower, 'å', 'å'),
    caseT.init(base.Case.Title, 0x80, 0x80),
    // caseT.init(base.Case.Title, 'Å', 'Å'),
    // caseT.init(base.Case.Title, 'å', 'Å'),

    // 0131;LATIN SMALL LETTER DOTLESS I;Ll;0;L;;;;;N;;;0049;;0049
    caseT.init(base.Case.Upper, 0x0131, 'I'),
    caseT.init(base.Case.Lower, 0x0131, 0x0131),
    caseT.init(base.Case.Title, 0x0131, 'I'),

    // 0133;LATIN SMALL LIGATURE IJ;Ll;0;L;<compat> 0069 006A;;;;N;LATIN SMALL LETTER I J;;0132;;0132
    caseT.init(base.Case.Upper, 0x0133, 0x0132),
    caseT.init(base.Case.Lower, 0x0133, 0x0133),
    caseT.init(base.Case.Title, 0x0133, 0x0132),

    // 212A;KELVIN SIGN;Lu;0;L;004B;;;;N;DEGREES KELVIN;;;006B;
    caseT.init(base.Case.Upper, 0x212A, 0x212A),
    caseT.init(base.Case.Lower, 0x212A, 'k'),
    caseT.init(base.Case.Title, 0x212A, 0x212A),

    // From an UpperLower sequence
    // A640;CYRILLIC CAPITAL LETTER ZEMLYA;Lu;0;L;;;;;N;;;;A641;
    caseT.init(base.Case.Upper, 0xA640, 0xA640),
    caseT.init(base.Case.Lower, 0xA640, 0xA641),
    caseT.init(base.Case.Title, 0xA640, 0xA640),
    // A641;CYRILLIC SMALL LETTER ZEMLYA;Ll;0;L;;;;;N;;;A640;;A640
    caseT.init(base.Case.Upper, 0xA641, 0xA640),
    caseT.init(base.Case.Lower, 0xA641, 0xA641),
    caseT.init(base.Case.Title, 0xA641, 0xA640),
    // A64E;CYRILLIC CAPITAL LETTER NEUTRAL YER;Lu;0;L;;;;;N;;;;A64F;
    caseT.init(base.Case.Upper, 0xA64E, 0xA64E),
    caseT.init(base.Case.Lower, 0xA64E, 0xA64F),
    caseT.init(base.Case.Title, 0xA64E, 0xA64E),
    // A65F;CYRILLIC SMALL LETTER YN;Ll;0;L;;;;;N;;;A65E;;A65E
    caseT.init(base.Case.Upper, 0xA65F, 0xA65E),
    caseT.init(base.Case.Lower, 0xA65F, 0xA65F),
    caseT.init(base.Case.Title, 0xA65F, 0xA65E),

    // From another UpperLower sequence
    // 0139;LATIN CAPITAL LETTER L WITH ACUTE;Lu;0;L;004C 0301;;;;N;LATIN CAPITAL LETTER L ACUTE;;;013A;
    caseT.init(base.Case.Upper, 0x0139, 0x0139),
    caseT.init(base.Case.Lower, 0x0139, 0x013A),
    caseT.init(base.Case.Title, 0x0139, 0x0139),
    // 013F;LATIN CAPITAL LETTER L WITH MIDDLE DOT;Lu;0;L;<compat> 004C 00B7;;;;N;;;;0140;
    caseT.init(base.Case.Upper, 0x013f, 0x013f),
    caseT.init(base.Case.Lower, 0x013f, 0x0140),
    caseT.init(base.Case.Title, 0x013f, 0x013f),
    // 0148;LATIN SMALL LETTER N WITH CARON;Ll;0;L;006E 030C;;;;N;LATIN SMALL LETTER N HACEK;;0147;;0147
    caseT.init(base.Case.Upper, 0x0148, 0x0147),
    caseT.init(base.Case.Lower, 0x0148, 0x0148),
    caseT.init(base.Case.Title, 0x0148, 0x0147),

    // base.Case.Lower lower than base.Case.Upper.
    // AB78;CHEROKEE SMALL LETTER GE;Ll;0;L;;;;;N;;;13A8;;13A8
    caseT.init(base.Case.Upper, 0xab78, 0x13a8),
    caseT.init(base.Case.Lower, 0xab78, 0xab78),
    caseT.init(base.Case.Title, 0xab78, 0x13a8),
    caseT.init(base.Case.Upper, 0x13a8, 0x13a8),
    caseT.init(base.Case.Lower, 0x13a8, 0xab78),
    caseT.init(base.Case.Title, 0x13a8, 0x13a8),

    // Last block in the 5.1.0 table
    // 10400;DESERET CAPITAL LETTER LONG I;Lu;0;L;;;;;N;;;;10428;
    caseT.init(base.Case.Upper, 0x10400, 0x10400),
    caseT.init(base.Case.Lower, 0x10400, 0x10428),
    caseT.init(base.Case.Title, 0x10400, 0x10400),
    // 10427;DESERET CAPITAL LETTER EW;Lu;0;L;;;;;N;;;;1044F;
    caseT.init(base.Case.Upper, 0x10427, 0x10427),
    caseT.init(base.Case.Lower, 0x10427, 0x1044F),
    caseT.init(base.Case.Title, 0x10427, 0x10427),
    // 10428;DESERET SMALL LETTER LONG I;Ll;0;L;;;;;N;;;10400;;10400
    caseT.init(base.Case.Upper, 0x10428, 0x10400),
    caseT.init(base.Case.Lower, 0x10428, 0x10428),
    caseT.init(base.Case.Title, 0x10428, 0x10400),
    // 1044F;DESERET SMALL LETTER EW;Ll;0;L;;;;;N;;;10427;;10427
    caseT.init(base.Case.Upper, 0x1044F, 0x10427),
    caseT.init(base.Case.Lower, 0x1044F, 0x1044F),
    caseT.init(base.Case.Title, 0x1044F, 0x10427),

    // First one not in the 5.1.0 table
    // 10450;SHAVIAN LETTER PEEP;Lo;0;L;;;;;N;;;;;
    caseT.init(base.Case.Upper, 0x10450, 0x10450),
    caseT.init(base.Case.Lower, 0x10450, 0x10450),
    caseT.init(base.Case.Title, 0x10450, 0x10450),

    // Non-letters with case.
    caseT.init(base.Case.Lower, 0x2161, 0x2171),
    caseT.init(base.Case.Upper, 0x0345, 0x0399),
};

test "toUpper" {
    for (case_test) |c, idx| {
        switch (c.case) {
            base.Case.Upper => {
                const r = unicode.toUpper(c.in);
                if (r != c.out) {
                    try t.terrorf("expected {} got {}\n", c.out, r);
                }
            },
            else => {},
        }
    }
}

test "toLower" {
    for (case_test) |c, idx| {
        switch (c.case) {
            base.Case.Lower => {
                const r = unicode.toLower(c.in);
                if (r != c.out) {
                    try t.terrorf("expected {} got {}\n", c.out, r);
                }
            },
            else => {},
        }
    }
}

test "toLower" {
    for (case_test) |c, idx| {
        switch (c.case) {
            base.Case.Title => {
                const r = unicode.toTitle(c.in);
                if (r != c.out) {
                    try t.terrorf("expected {} got {}\n", c.out, r);
                }
            },
            else => {},
        }
    }
}

test "to" {
    for (case_test) |c| {
        const r = unicode.to(c.case, c.in);
        if (r != c.out) {
            try t.terrorf("expected {} got {}\n", c.out, r);
        }
    }
}