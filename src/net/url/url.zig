const std=@import("std");
const debug =std.debug;
const assert = std.debug.assert;
const mem =std.mem;

const encoding =enum{
    path,
    pathSegment,
    host,
    zone,
    userPassword,
    queryComponent,
    fragment,
};

pub const Error = error{
    EscapeError,
    InvalidHostError,
};

fn escapeErr(err:error)UnescapedValue{
    return UnescapedValue{.Error =errors.New(err,null)};
}

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
        '$', '&', '+', ',', '/', ':', ';', '=', '?', '@' => {
            switch(mode){
                encoding.path =>return c=='?',
                encoding.pathSegment => return c == '/' or c == ';' or c == ',' or c == '?',
                encoding.userPassword => return c == '@' or c == '/' or c == '?' or c == ':',
                encoding.queryComponent => return true,
                encoding.fragment => return false,
                else => {},
            }
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

fn ishex ( c : u8) bool{
    if ('0' <= c and c <= '9'){
        return true ;
    }
    if ('a' <= c and c <= 'f'){
        return true;
    }
    if ('A' <= c and c <= 'F'){
        return true;
    }
    return false;
}

fn unhex(c:u8) u8{
    if ('0' <= c and c <= '9'){
       return c - '0';
    }
    if ('a' <= c and c <= 'f'){
        return c - 'a' + 10 ;
    }
    if ('A' <= c and c <= 'F'){
        return c - 'A' + 10 ;
    }
    return 0 ;
}

fn is25 (s : []const u8)bool{
    return mem.eql(u8,s, "%25");
}

fn unescape(a : *std.Buffer, s :[]const u8, mode :encoding) !void{
    var n : usize =0;
    var hasPlus : bool=true;
    var tmpa: [3]u8 =undefined;
    var tm =tmpa[0..];
    var i : usize =0;
    while (i <s.len){
        switch (s[i]){
            '%' =>{
                n=n+1;
                if (i+2>= s.len or !ishex(s[i+1]) or !ishex(s[i+2])){
                    return Error.EscapeError;
                }
                if (mode==encoding.host and unhex(s[i+1])<9 and !is25(s[i..i+3])){
                    return Error.EscapeError;
                }
                if (mode==encoding.zone){
                    const v =unhex(s[i+1])<<4 | unhex(s[i+2]);
                    if (!is25(s[i..i+3]) and v!= ' ' and shouldEscape(v,encoding.host)){
                        return Error.EscapeError;
                    }
                }
                i= i+3 ;
            },
            '+' => {
                hasPlus=mode== encoding.queryComponent;
                i=i+1;
            },
            else => {
                if ( (mode ==encoding.host or mode ==encoding.zone) and s[i] < 0x80 and shouldEscape(s[i], mode) ){
                    return Error.InvalidHostError;
                }
                i= i+1;
            }
        }
    }
    if (n==0 and !hasPlus){
        try a.append(s);
    }else{
        try a.resize(s.len - 2*n);
        var t = a.toSlice();
        var j: usize=0;
        i=0;
        while(i<s.len) {
            switch (s[i]){
                '%' => {
                    t[j]=unhex(s[i+1])<<4 | unhex(s[i+2]);
                    j= j+1;
                    i=i+3;
                },
                '+' => {
                    if (mode==encoding.queryComponent){
                        t[j]=' ';
                    } else {
                        t[j]='+';
                    }
                    j=j+1;
                    i=i+1;
                },
                else => {
                    t[j]=s[i];
                    j=j+1;
                    i=i+1;
                }
            }
        }
    }
}


pub fn QueryUnEscape(a : *std.Buffer, s: []const u8) !void{
    return unescape(a,s, encoding.queryComponent);
}

pub fn PathUnescape(a : *std.Buffer, s: []const u8) !void{
    return unescape(s, encoding.path);
}

pub fn PathEscape(a: *std.Buffer, s: []const u8)!void{
    return escape(a,s, encoding.path);
}

pub fn QueryEscape(a: *std.Buffer, s: []const u8)!void{
    return escape(a,s, encoding.queryComponent);
}

fn escape(a: *std.Buffer, s: []const u8, mode:encoding) !void{
    var spaceCount: usize =0;
    var hexCount: usize =0;
    for (s) |c| {
        if (shouldEscape(c,mode)){
            if (c== ' ' and mode==encoding.queryComponent){
                spaceCount=spaceCount+1;
            } else{
                hexCount=hexCount+1;
            }
        }
    }
    if (spaceCount==0 and hexCount==0){
        try a.append(s);
    } else {
        const required =s.len+2*hexCount;
        try a.resize(required);
        var t = a.toSlice();
        var i: usize=0;
        if (hexCount==0){
            while (i<s.len){
                if (s[i]==' '){
                    t[i]='+';
                }else{
                    t[i]=s[i];
                }
                i=i+1;
            }
        } else{
            i=0;
            var j: usize=0;
            const alpha: []const u8 ="0123456789ABCDEF";
            while (i<s.len){
               const c= s[i];
               if (c==' ' and mode==encoding.queryComponent){
                   t[j]='+' ;
                   j=j+1;
               } else if (shouldEscape(c,mode)){
                   t[j]='%';
                   t[j+1]=alpha[c>>4];
                   t[j+2]=alpha[c&15];
                   j= j+3 ;
               } else{
                   t[j]=s[i];
                   j=j+1;
               }
               i=i+1;
            }
        }

    }
}