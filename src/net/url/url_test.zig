const url = @import("./url.zig");
const std = @import("std");
const assert = std.debug.assert;
const mem =std.mem;
const debug =std.debug;

const EscapeTest =struct{
    in : []const u8,
    out : []const u8,
    err: ?url.Error,
};

fn unescapePassingTests() []const EscapeTest{
    const ts= []EscapeTest{
        EscapeTest{
            .in= "",
            .out="",
            .err =null,
        },
        EscapeTest{
            .in= "1%41",
            .out="1A",
            .err =null,
        },
        EscapeTest{
            .in= "1%41%42%43",
            .out="1ABC",
            .err =null,
        },
        EscapeTest{
            .in= "%4a",
            .out="J",
            .err =null,
        },
        EscapeTest{
            .in ="%6F",
            .out ="o",
            .err =null,
        },
        EscapeTest{
            .in ="a+b",
            .out ="a b",
            .err =null,
        },
        EscapeTest{
            .in ="a%20b",
            .out ="a b",
            .err =null,
        },
    };
    return ts[0..];
}

fn unescapeFailingTests() []const EscapeTest{
    const ts= []EscapeTest{
        EscapeTest{
            .in= "%",
            .out="",
            .err =url.Error.EscapeError,
        },
        EscapeTest{
            .in= "%a",
            .out="",
            .err =url.Error.EscapeError,
        },
        EscapeTest{
            .in= "%1",
            .out="",
            .err =url.Error.EscapeError,
        },
        EscapeTest{
            .in= "123%45%6",
            .out="",
            .err =url.Error.EscapeError,
        },
        EscapeTest{
            .in= "%zzzzz",
            .out="",
            .err =url.Error.EscapeError,
        },
    };
    return ts[0..];
}

test "QueryUnEscape" {
    var buffer = try std.Buffer.init(debug.global_allocator, "");
    var buf =&buffer;
    defer buf.deinit();
    for (unescapePassingTests()) |ts|{
        try url.QueryUnEscape(buf, ts.in);
        assert(buf.eql(ts.out));
        buf.shrink(0);
    }
    for (unescapeFailingTests()) |ts|{
        if (url.QueryUnEscape(buf, ts.in)){
            @panic("expected an error");
        } else |err| {
            assert(err==ts.err.?);
        }
        buf.shrink(0);
    }
}