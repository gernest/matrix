/// Color can convert itself to alpha-premultiplied 16-bits per channel RGBA.
/// The conversion may be lossy.
pub const Color = struct.{
    rgb: Value,
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
    convert: fn (c: ModelType) Color,
};

/// RGBA represents a traditional 32-bit alpha-premultiplied color, having 8
/// bits for each of red, green, blue and alpha.
///
/// An alpha-premultiplied color component C has been scaled by alpha (A), so
/// has valid values 0 <= C <= A.
pub const RGBA = struct.{
    r: u8,
    g: u8,
    b: u8,
    a: u8,

    fn toColor(c: RGBA) Value {
        var r: u32 = c.r;
        r |= r << 8;
        var g: u32 = c.g;
        g |= g << 8;
        var b: u32 = c.b;
        b |= b << 8;
        var a: u32 = c.a;
        a |= a << 8;
        return Value.{
            .r = r,
            .g = g,
            .b = b,
            .a = a,
        };
    }
};

/// RGBA64 represents a 64-bit alpha-premultiplied color, having 16 bits for
/// each of red, green, blue and alpha.
/// An alpha-premultiplied color component C has been scaled by alpha (A), so
/// has valid values 0 <= C <= A.
pub const RGBA64 = struct.{
    r: u16,
    g: u16,
    b: u16,
    a: u16,

    fn toColor(c: RGBA64) Value {
        return Value.{
            .r = c.r,
            .g = c.g,
            .b = c.b,
            .a = c.a,
        };
    }
};

/// NRGBA represents a non-alpha-premultiplied 32-bit color.
pub const NBRGBA = struct.{
    r: u8,
    g: u8,
    b: u8,
    a: u8,

    fn toColor(c: NBRGBA) Value {
        var r: u32 = c.r;
        var g: u32 = c.g;
        var b: u32 = c.b;
        var a: u32 = c.a;
        r |= r << 8;
        r *= a;
        r /= 0xff;
        g |= g << 8;
        g *= a;
        g /= 0xff;
        b |= b << 8;
        b *= a;
        b /= 0xff;
        a |= a << 8;
        return Value.{
            .r = r,
            .g = g,
            .b = b,
            .a = a,
        };
    }
};

pub const NBRGBA64 = struct.{
    r: u16,
    g: u16,
    b: u16,
    a: u16,

    fn toColor(c: NBRGBA64) Value {
        var r: u32 = c.r;
        var g: u32 = c.g;
        var b: u32 = c.b;
        var a: u32 = c.a;
        r |= r << 8;
        r *= a;
        r /= 0xffff;
        g |= g << 8;
        g *= a;
        g /= 0xffff;
        b |= b << 8;
        b *= a;
        b /= 0xffff;
        return Value.{
            .r = r,
            .g = g,
            .b = b,
            .a = a,
        };
    }
};

/// Alpha represents an 8-bit alpha color.
pub const Alpha = struct.{
    a: u8,

    fn toColor(c: Alpha) Value {
        var a: u32 = c.a;
        a |= a << 8;
        return Value.{
            .r = a,
            .g = a,
            .b = a,
            .a = a,
        };
    }
};

pub const Alpha16 = struct.{
    a: u16,

    fn toColor(c: Alpha16) Value {
        var a: u32 = c.a;
        a |= a << 8;
        return Value.{
            .r = a,
            .g = a,
            .b = a,
            .a = a,
        };
    }
};

/// Gray represents an 8-bit grayscale color.
pub const Gray = struct.{
    y: u8,

    fn toColor(c: Gray) Value {
        var y: u32 = c.y;
        y |= y << 8;
        return Value.{
            .r = y,
            .g = y,
            .b = y,
            .a = 0xffff,
        };
    }
};

pub const Gray16 = struct.{
    y: u16,

    fn toColor(c: Gray16) Value {
        var y: u32 = c.y;
        return Value.{
            .r = y,
            .g = y,
            .b = y,
            .a = 0xffff,
        };
    }
};

pub const ModelType = union.{
    rgba: RGBA,
    rgba64: RGBA64,
    nrgba: NRGBA,
    nrgba64: nrgba64,
    alpha: Alpha,
    alpha16: Alpha16,
    gray: Gray,
    gray16: Gray16,
    color: Color,

    pub fn rgbaModel(m: ModelType) Color {
        return switch (m) {
            ModelType.rgba => |c| c.toColor(),
            ModelType.color => |c| {
                return Color.{
                    .rgb = Value.{
                        .r = c.rgb.r >> 8,
                        .g = c.rgb.g >> 8,
                        .b = c.rgb.b >> 8,
                        .a = c.rgb.a >> 8,
                    },
                };
            },
            else => unreachanle,
        };
    }
};

pub const Black = Gray.{ .y = 0 };
pub const White = Gray.{ .y = 0xffff };
pub const Transparent = Alpha.{ .a = 0 };
pub const Opaque = Alpha16.{ .a = 0xffff };

/// sqDiff returns the squared-difference of x and y, shifted by 2 so that
/// adding four of those won't overflow a uint32.
///
/// x and y are both assumed to be in the range [0, 0xffff].
fn sqDiff(x: u32, y: u32) u32 {
    // The canonical code of this function looks as follows:
    //
    //    var d uint32
    //    if x > y {
    //        d = x - y
    //    } else {
    //        d = y - x
    //    }
    //    return (d * d) >> 2
    //
    // Language spec guarantees the following properties of unsigned integer
    // values operations with respect to overflow/wrap around:
    //
    // > For unsigned integer values, the operations +, -, *, and << are
    // > computed modulo 2n, where n is the bit width of the unsigned
    // > integer's type. Loosely speaking, these unsigned integer operations
    // > discard high bits upon overflow, and programs may rely on ``wrap
    // > around''.
    //
    // Considering these properties and the fact that this function is
    // called in the hot paths (x,y loops), it is reduced to the below code
    const d = x - y;
    return (d * d) >> 2;
}
