pub const Color = struct.{
    rgb: fn () Value,
};

pub const Value = struct.{
    r: u32,
    g: u32,
    b: u32,
    a: u32,
};

/// Model can convert any Color to one from its own color model. The conversion
/// may be lossy.
pub const Model = struct.{
    convert: fn (c: Color) Color,
};
