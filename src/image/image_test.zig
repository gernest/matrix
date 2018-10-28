const image = @import("./image.zig");
const t = @import("../testing/index.zig");

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
                _ = t.terrorf("\n {} {} {}\n", r, s, a);
            }
            if (!in(a, s)) {
                _ = t.terrorf("\nexpected {} to be in {}\n", a, s);
            }
        }
    }
}

// test "case" {
//     var a = image.Rectangle.rect(0, 0, 10, 10);
//     var b = image.Rectangle.rect(88, 88, 88, 88);
//     _ = t.terrorf("\n {}\n", a.intersect(b));
// }
