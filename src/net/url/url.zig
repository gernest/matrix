const assert = @import("std").debug.assert;

const encoding =enum{
    path,
    pathSegment,
    host,
    zone,
    userPassword,
    queryComponent,
    fragment,
};

fn shouldEscape(c : u8, mode: encoding) bool{
    if ('A' <= c and c <= 'Z' or 'a' <= c and c <= 'z' or '0' <= c and c <= '9'){
        return false;
    }
    if (mode==encoding.host or mode==encoding.zone){
        switch (c){
            '!', '$', '&', '\'', '(', ')', '*', '+', ',', ';', '=', ':', '[', ']', '<', '>', '"' => return false,
            else => {},
        }
    }
    switch(c){
        '-', '_', '.', '~' => return false,
        '$', '&', '+', ',', '/', ':', ';', '=', '?', '@' => blk: {
            switch(mode){
                encoding.path =>return c=='?',
                encoding.pathSegment => return c == '/' or c == ';' or c == ',' or c == '?',
                encoding.userPassword => return c == '@' or c == '/' or c == '?' or c == ':',
                encoding.queryComponent => return true,
                encoding.fragment => return false,
                else => {},
            } break :blk ;
        },
        else => {},
    }
    if (mode==encoding.fragment){
        switch (c){
            '!', '(', ')', '*' => return false,
            else => {},
        }
    }
    return true;
}


test "shouldEscape" {
    assert(shouldEscape('%',encoding.path));
}