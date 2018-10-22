/// Color can convert itself to alpha-premultiplied 16-bits per channel RGBA.
/// The conversion may be lossy.
pub const Color = struct.{
    rgb: fn () Value,
};

/// Value is the alpha-premultiplied red, green, blue and alpha values
/// for the color. Each value ranges within [0, 0xffff], but is represented
/// by a uint32 so that multiplying by a blend factor up to 0xffff will not
/// overflow.
///
/// An alpha-premultiplied color component c has been scaled by alpha (a),
/// so has valid values 0 <= c <= a.
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
