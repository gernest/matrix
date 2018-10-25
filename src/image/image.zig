const color = @import("./color/index.zig");

/// A Point is an X, Y coordinate pair. The axes increase right and down.
pub const Point = struct.{
    x: isize,
    y: isize,

    pub fn init(x: isize, y: isize) Point {
        return Point.{ .x = x, .y = y };
    }

    pub fn add(p: Point, q: Point) Point {
        return Point.{ .x = p.x + q.x, .y = p.y + q.y };
    }

    pub fn sub(p: Point, q: Point) Point {
        return Point.{ .x = p.x - q.x, .y = p.y - q.y };
    }

    pub fn mul(p: Point, q: Point) Point {
        return Point.{ .x = p.x * q.x, .y = p.y * q.y };
    }

    pub fn div(p: Point, q: Point) Point {
        return Point.{ .x = @divExact(p.x, q.x), .y = @divExact(p.y, q.y) };
    }

    pub fn in(p: Point, r: Rectangle) bool {
        return r.min.x <= p.x and p.x < r.max.x and r.min.y <= p.y and p.y < r.max.y;
    }

    pub fn mod(p: Point, r: Rectangle) Point {
        const w = r.dx();
        const h = r.dy();
        const point = p.sub(r.min);
        var x = @mod(point.x, w);
        if (x < 0) {
            x += w;
        }
        var y = @mod(point.y, h);
        if (y < 0) {
            y += h;
        }
        const np = Point.init(x, y);
        return np.add(r.min);
    }

    pub fn eq(p: Point, q: Point) bool {
        return p.x == q.x and p.y == q.y;
    }
};

pub const Rectangle = struct.{
    min: Point,
    max: Point,

    pub fn init(x0: isize, y0: isize, x1: isize, y1: isize) Rectangle {
        var r = Rectangle.{
            .min = Point.{
                .x = x0,
                .y = y0,
            },
            .max = Point.{
                .x = x1,
                .y = y1,
            },
        };
        if (x0 > x1) {
            const x = x0;
            r.min.x = x1;
            r.max.x = x;
        }
        if (y0 > y1) {
            const y = y0;
            r.min.y = y1;
            r.max.y = y;
        }
        return r;
    }

    /// dx returns r's width.
    pub fn dx(r: Rectangle) isize {
        return r.max.x - r.min.x;
    }

    pub fn zero() Rectangle {
        return Rectangle.{
            .min = Point.{
                .x = 0,
                .y = 0,
            },
            .max = Point.{
                .x = 0,
                .y = 0,
            },
        };
    }

    /// dy returns r's height.
    pub fn dy(r: Rectangle) isize {
        return r.max.y - r.min.y;
    }

    /// size returns r's width and height.
    pub fn size(r: Rectangle) Point {
        return Point.{ .x = r.dx(), .y = r.dy() };
    }

    /// eEmpty reports whether the rectangle contains no points.
    pub fn empty(r: Rectangle) bool {
        return r.min.x >= r.max.x or r.min.y >= r.max.y;
    }

    pub fn add(r: Rectangle, p: Point) Rectangle {
        return Rectangle.{
            .min = Point.{ .x = r.min.x + p.x, .y = r.min.y + p.y },
            .max = Point.{ .x = r.max.x + p.x, .y = r.max.y + p.y },
        };
    }

    pub fn sub(r: Rectangle, p: Point) Rectangle {
        return Rectangle.{
            .min = Point.{ .x = r.min.x - p.x, .y = r.min.y - p.y },
            .max = Point.{ .x = r.max.x - p.x, .y = r.max.y - p.y },
        };
    }

    /// Inset returns the rectangle r inset by n, which may be negative. If either
    /// of r's dimensions is less than 2*n then an empty rectangle near the center
    /// of r will be returned.
    pub fn inset(r: Rectangle, n: isize) Rectangle {
        var x0 = r.min.x;
        var x1 = r.min.x;
        if (r.dx() < 2 * n) {
            x0 = @divExact((r.min.x + r.max.x), 2);
            x1 = x0;
        } else {
            x0 += n;
            x1 -= n;
        }
        var y0 = r.min.y;
        var y1 = r.max.y;
        if (r.dy() < 2 * n) {
            y0 = @divExact((r.min.y + r.max.y), 2);
            y1 = y0;
        } else {
            y0 += n;
            y1 -= n;
        }
        return Rectangle.init(x0, y0, x1, y1);
    }

    /// Intersect returns the largest rectangle contained by both r and s. If the
    /// two rectangles do not overlap then the zero rectangle will be returned.
    pub fn intersect(r: Rectangle, s: Rectangle) Rectangle {
        var x0 = r.min.x;
        var y0 = r.min.y;
        var x1 = r.max.x;
        var y1 = r.max.y;
        if (x0 < s.min.x) {
            x0 = s.min.x;
        }
        if (y0 < s.min.y) {
            y0 = s.min.y;
        }
        if (x1 > s.max.x) {
            x1 = s.max.x;
        }
        if (y1 > s.max.y) {
            y1 = s.max.y;
        }
        if (r.empty()) {
            return Rectangle.zero();
        }
        return Rectangle.init(x0, y0, x1, y1);
    }

    /// Union returns the smallest rectangle that contains both r and s.
    pub fn runion(r: Rectangle, s: Rectangle) Rectangle {
        if (r.empty()) {
            return s;
        }
        if (s.empty()) {
            return r;
        }
        var a = []isize.{ r.min.x, r.min.y, r.max.x, r.max.y };
        if (a[0] > s.min.x) {
            a[0] = s.min.x;
        }
        if (a[1] > s.min.y) {
            a[1] = s.min.y;
        }
        if (a[2] < s.max.x) {
            a[2] = s.max.x;
        }
        if (a[3] < s.max.y) {
            a[3] = s.max.y;
        }
        return Rectangle.init(a[0], a[1], a[2], a[3]);
    }

    pub fn eq(r: Rectangle, s: Rectangle) bool {
        return r.max.eq(s.max) and r.min.eq(s.min) or r.empty() and s.empty();
    }

    pub fn overlaps(r: Rectangle, s: Rectangle) bool {
        return !r.empty() and !s.empty() and
            r.min.x < s.max.x and s.min.x < r.max.x and r.min.y < s.max.y and s.min.y < r.max.y;
    }

    pub fn in(r: Rectangle, s: Rectangle) bool {
        if (r.empty()) {
            return true;
        }
        return s.min.x <= r.min.x and r.max.x <= s.max.x and
            s.min.y <= r.min.y and r.max.y <= s.max.y;
    }

    pub fn canon(r: Rectangle) Rectangle {
        var x0 = r.min.x;
        var x1 = r.max.x;
        if (r.max.x < r.min.x) {
            const x = r.min.x;
            x0 = r.max.x;
            x1 = x;
        }
        var y0 = r.min.x;
        var y1 = r.min.x;
        if (r.min.y < r.max.y) {
            const y = y0;
            y0 = y1;
            y1 = y;
        }
        return Rectangle.init(x0, y0, x1, y1);
    }

    pub fn at(r: Rectangle, x: isize, y: isize) color.Color {
        var p = Point.{ .x = x, .y = y };
        if (p.in(r)) {
            return color.Opaque.toColor();
        }
        return color.Transparent.toColor();
    }

    pub fn bounds(r: Rectangle) Rectangle {
        return r;
    }

    pub fn colorModel(r: Rectangle) color.Model {
        return color.Alpha16Model;
    }
};

pub const Config = struct.{
    color_model: color.Model,
    width: isize,
    height: isize,
};

pub const Image = struct.{
    colorModel: color.Model,
    bounds: Rectangle,
    at: fn (x: isize, y: isize) color.Color,
};
