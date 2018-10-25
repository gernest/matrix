const std = @import("std");

pub const RequestMessage = struct.{
    jsonrpc: []const u8,
    id: id,
    params: ?std.HashMap,
};

pub const id = union(enum).{
    str: []const u8,
    num: u64,
};
