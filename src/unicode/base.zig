pub const max_rune: u32 = 0x10ffff;
pub const replacement_char = 0xfffd;
pub const max_ascii: u32 = 0x7f;
pub const max_latin1: u32 = 0xff;

pub const pC: u8 = 1;
pub const pP: u8 = 2;
pub const pN: u8 = 4;
pub const pS: u8 = 8;
pub const pZ: u8 = 16;
pub const pLu: u8 = 32;
pub const pLl: u8 = 64;
pub const pp: u8 = 128;
pub const pg: u8 = 144;
pub const pLo: u8 = 96;
pub const pLmask: u8 = 96;

/// If the Delta field of a CaseRange is UpperLower, it means
/// this CaseRange represents a sequence of the form (say)
/// Upper Lower Upper Lower.
pub const upper_lower: u32 = max_rune + 1;

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

    pub fn init(lo: u32, hi: u32, delta: []const u32) CaseRange {
        return CaseRange.{ .lo = lo, .hi = hi, .delta = delta };
    }
};

const linear_max: usize = 18;
