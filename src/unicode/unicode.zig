pub const max_rune = 0x10ffff;
pub const replacement_char = 0xfffd;
pub const max_ascii = 0x7f;
pub const max_latin1 = 0xff;

pub const Range16 = struct.{
    lo: u16,
    hi: u16,
    stride: u16,
};

pub const Range32 = struct.{
    lo: u32,
    hi: u32,
    stride: u32,
};
