const image = @import("./image.zig");
const t = @import("../testing/index.zig");
const std = @import("std");

fn in(f: image.Rectangle, g: image.Rectangle) bool {
    if (!f.in(g)) {
        return false;
    }
    var y = f.min.y;
    while (y < f.max.y) {
        var x = f.min.x;
        while (x < f.max.x) {
            var p = image.Point.init(x, y);
            if (!p.in(g)) {
                return false;
            }
            x += 1;
        }
        y += 1;
    }
    return true;
}

const rectangles = []image.Rectangle.{
    image.Rectangle.rect(0, 0, 10, 10),
    image.Rectangle.rect(10, 0, 20, 10),
    image.Rectangle.rect(1, 2, 3, 4),
    image.Rectangle.rect(4, 6, 10, 10),
    image.Rectangle.rect(2, 3, 12, 5),
    image.Rectangle.rect(-1, -2, 0, 0),
    image.Rectangle.rect(-1, -2, 4, 6),
    image.Rectangle.rect(-10, -20, 30, 40),
    image.Rectangle.rect(8, 8, 8, 8),
    image.Rectangle.rect(88, 88, 88, 88),
    image.Rectangle.rect(6, 5, 4, 3),
};

test "Rectangle" {
    for (rectangles) |r| {
        for (rectangles) |s| {
            const got = r.eq(s);
            const want = in(r, s) and in(s, r);
            if (got != want) {
                try t.terrorf("\n {}:{} expected {} to be in {}\n", got, want, r, s);
            }
        }
    }

    for (rectangles) |r| {
        for (rectangles) |s| {
            const a = r.intersect(s);
            if (!in(a, r)) {
                try t.terrorf("\n {} {} {}\n", r, s, a);
            }
            if (!in(a, s)) {
                try t.terrorf("\nexpected {} to be in {}\n", a, s);
            }
            const is_zero = a.eq(image.Rectangle.zero());
            const overlaps = r.overlaps(s);
            if (is_zero == overlaps) {
                try t.terrorf("\n Intersect: r={}, s={}, a={}: is_zero={} same as overlaps={}\n", r, s, a, is_zero, overlaps);
            }
            const larger_than_a = []image.Rectangle.{
                image.Rectangle.init(
                    a.min.x - 1,
                    a.min.y,
                    a.max.x,
                    a.max.y,
                ),
                image.Rectangle.init(
                    a.min.x,
                    a.min.y - 1,
                    a.max.x,
                    a.max.y,
                ),
                image.Rectangle.init(
                    a.min.x,
                    a.min.y,
                    a.max.x + 1,
                    a.max.y,
                ),
                image.Rectangle.init(
                    a.min.x,
                    a.min.y,
                    a.max.x,
                    a.max.y + 1,
                ),
            };
            for (larger_than_a) |b| {
                if (b.empty()) {
                    continue;
                }
                if (in(b, r) and in(b, s)) {
                    try t.terrorf("\n Intersect: r={}, s={}, a={}, b={} :intersection could be larger\n", r, s, a, b);
                }
            }
        }
    }

    for (rectangles) |r| {
        for (rectangles) |s| {
            const a = r.runion(s);
            if (!in(r, a)) {
                try t.terrorf("\nUnion: r={}, s={}, a={} r not in a ", r, s, a);
            }
            if (!in(s, a)) {
                try t.terrorf("\nUnion: r={}, s={}, a={} s not in a ", r, s, a);
            }
            if (a.empty()) {
                continue;
            }
            const smaller_than_a = []image.Rectangle.{
                image.Rectangle.init(
                    a.min.x + 1,
                    a.min.y,
                    a.max.x,
                    a.max.y,
                ),
                image.Rectangle.init(
                    a.min.x,
                    a.min.y + 1,
                    a.max.x,
                    a.max.y,
                ),
                image.Rectangle.init(
                    a.min.x,
                    a.min.y,
                    a.max.x - 1,
                    a.max.y,
                ),
                image.Rectangle.init(
                    a.min.x,
                    a.min.y,
                    a.max.x,
                    a.max.y - 1,
                ),
            };
            for (smaller_than_a) |b| {
                if (in(r, b) and in(s, b)) {
                    try t.terrorf("\nUnion: r={}, s={}, a={}, b={}: union could be smaller ", r, s, a, b);
                }
            }
        }
    }
}

const TestImage = struct.{
    name: []const u8,
    image: image.Image,
    mem: []u8,
};

fn newRGBA(a: *std.mem.Allocator, r: image.Rectangle) !TestImage {
    const w = @intCast(usize, r.dx());
    const h = @intCast(usize, r.dy());
    const size = 4 * w * h;
    var u = try a.alloc(u8, size);
    var m = &image.RGBA.init(u, 4 * r.dx(), r);
    return TestImage.{
        .name = "RGBA",
        .image = m.image(),
        .mem = u,
    };
}

test "RGBA" {
    var allocator = std.debug.global_allocator;
    const rgb = try newRGBA(allocator, image.Rectangle.rect(0, 0, 10, 10));
    defer allocator.free(rgb.mem);

    const test_images = []TestImage.{rgb};

    for (test_images) |tc| {
        const r = image.Rectangle.rect(0, 0, 10, 10);
        if (!r.eq(tc.image.bounds)) {
            try t.terrorf("\n want bounds={} got {}\n", r, tc.image.bounds);
        }
    }
}
