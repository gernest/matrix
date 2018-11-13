const std = @import("std");
const io = std.io;
const warn = std.debug.warn;

const max_buffer_size: usize = 8192;

pub fn main() !void {
    var stdin_file = try io.getStdIn();
    var stdin = stdin_file.inStream();
    var buf = try std.Buffer.init(std.debug.global_allocator, "");
    defer buf.deinit();
    try stdin.stream.readUntilDelimiterBuffer(&buf, '\n', max_buffer_size);
    warn("{}\n", buf.toSlice());
}
