const std = @import("std");
const json = @import("../json/json.zig");
const mem = std.mem;
const warn = std.debug.warn;

pub const json_rpc_version = "2.0";

pub const RequestMessage = struct.{
    jsonrpc: []const u8,
    id: ID,
    params: ?json.Value,
};

pub const ID = union(enum).{
    String: []const u8,
    Number: i64,
    Null,
};

pub const ResponseMessage = struct.{
    jsonrpc: []const u8,
    id: ID,
    result: ?json.Value,
    error_value: ?ResponseError,
};

pub const ErrorCode = enum(i64).{
    ParseError = -32700,
    InvalidRequest = -32600,
    MethodNotFound = -32601,
    InvalidParams = -32602,
    InternalError = -32603,
    ServerErrorStart = -32099,
    ServerErrorEnd = -32000,
    ServerNotInitialized = -32002,
    UnknownErrorCode = -32001,
    RequestCancelled = -32800,
};

pub const ResponseError = struct.{
    code: ErrorCode,
    message: []const u8,
    data: ?json.Value,
};

pub const NotificationMessage = struct.{
    jsonrpc: []const u8,
    id: ID,
    method: []const u8,
    params: ?json.Value,
};

pub const CancelParam = struct.{
    id: ID,
};
