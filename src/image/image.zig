const coor = @import("./color.zig");

/// A Point is an X, Y coordinate pair. The axes increase right and down.
pub const Point = struct.{
    x: usize,
    y: usize,

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
        return Point.{ .x = p.x / q.x, .y = p.y / q.y };
    }

    pub fn in(p: Point, r: Rectangle) bool {
        return r.min.x <= p.x and p.x < r.max.x and r.min.y <= p.y and p.y < r.max.y;
    }

    pub fn mod(p: Point, r: Rectangle) Point {
        const w = r.dx();
        const h = r.dy();
        const point = p.sub(r.min);
        point.x = point.x % w;
        if (point.x < 0) {
            point.x += w;
        }
        point.y = point.y % h;
        if (point.y < 0) {
            point.y += h;
        }
        return point.add(r.min);
    }

    pub fn eq(p: Point, q: Point) bool {
        return p.x == q.x and p.y == q.y;
    }
};

pub const Rectangle = struct.{
    min: Point,
    max: Point,

    /// dx returns r's width.
    pub fn dx(r: Rectangle) usize {
        return r.max.x - r.min.x;
    }

    /// dy returns r's height.
    pub fn dy(r: Rectangle) usize {
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
};

pub const Config = struct.{
    color_model: color.Model,
    width: usize,
    height: usize,
};

pub const Image = struct.{
    colorModel: color.Model,
    bounds: Rectangle,
    at: fn (x: usize, y: usize) color.Color,
};
