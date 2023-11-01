print("testing syntax")
local a = require("debug")
local function b(c, d)
    assert(string.find(select(2, load(c)), d))
end
local c
do
end
do
    c = 3
    assert(c == 3)
end
if false then
    c = 3 // 0
    c = nan
end
d = #4
assert(512 == 512)
assert(32 == 32)
assert(0.2 == 0.2 and -4 == -4)
assert(not nil and 2 and not (2 > 3 or 3 < 2))
assert(-9 == -9)
assert(-4 == -4 and 4 == 4 and 0 == 0)
assert(-3 == 2 and 2 == 2)
assert(3 == 3 and 3 .. 3 == "33")
assert(not (3 > 3) and "a" .. "b" > "a")
assert(240 | 204 ~ 168 == 244)
assert(168 ~ 204 | 240 == 244)
assert(16 == 16)
assert(81 // 8 // 5 == 2)
assert(-3 + 20 // 512 // 9 + 1.33333 == -3 + 20 // 512 // 9 + 1.33333)
assert(not ((true or false) and nil))
assert((true or false) and nil)
assert(((1 or false) and true or false) == true)
assert(((nil and true or false) and true) == false)
local c, e = 1, nil
assert(-(1 or 2) == -1 and (1 and 2) + (-1.2 or -4) == 0.7)
local d = (e or c) + 1 == 2 and (10 or c) + 1 == 11
assert(d)
d = (2 < 3 or 1) == true and (2 < 3 and 4) == 4
assert(d)
local d, f = 1, 2
assert(d > f and d or f == 2)
d, f = 2, 1
assert(d > f and d or f == 2)
assert(1234567890 == tonumber('1234567890') and 1234567891 == 1234567891)
do
    local g = {
        3,
        100,
        5,
        -10,
        -5,
        10000,
        -10000
    }
    local h = {
        "+",
        "-",
        "*",
        "/",
        "//",
        "%",
        "^",
        "&",
        "|",
        "^",
        "<<",
        ">>",
        "==",
        "~=",
        "<",
        ">",
        "<=",
        ">="
    }
    for i, j in ipairs(h) do
        local k = assert(load(string.format([[return function (x,y)
                return x %s y
              end]], j)))()
        for i, l in ipairs(g) do
            for i, m in ipairs(g) do
                local n = k(l, m)
                _ENV.XX = l
                local o = string.format("return XX %s %s", j, m)
                local p = assert(load(o))()
                assert(p == n)
                _ENV.XX = m
                o = string.format("return (%s) %s XX", l, j)
                p = assert(load(o))()
                assert(p == n)
                o = string.format("return (%s) %s %s", l, j, m)
                p = assert(load(o))()
                assert(p == n)
            end
        end
    end
    _ENV.XX = nil
end
repeat
until 1
repeat
until true
while false do
end
while nil do
end
do
    local c
    local function g(d)
        d = {a = 1}
        d = {x = 1}
        d = {G = 1}
    end
end
do
    local g = {"local x = {"}
    for h = 1, 257 do
        g[#g + 1] = h .. ".1,"
    end
    g[#g + 1] = "};"
    g = table.concat(g)
    local function h(i, j)
        local g = g .. i
        g = load(g)
        assert(g() == j)
    end
    h("return (1 ~ (2 or 3))", 1 ~ 2)
    h("return (1 | (2 or 3))", 3)
    h("return (1 + (2 or 3))", 3)
    h("return (1 << (2 or 3))", 1 << 2)
end
local function g(h)
    if type(h) ~= 'number' then
        return h, 'jojo'
    end
    if h > 0 then
        return h, g(h - 1)
    end
end
d = {
    g(3),
    g(5),
    g(10)
}
assert(d[1] == 3 and d[2] == 5 and d[3] == 10 and d[4] == 9 and d[12] == 1)
assert(d[nil] == nil)
d = {
    g('alo'),
    g('xixi'),
    nil
}
assert(d[1] == 'alo' and d[2] == 'xixi' and d[3] == nil)
d = {g('alo') .. 'xixi'}
assert(d[1] == 'aloxixi')
d = {g({})}
assert(d[2] == 'jojo' and type(d[1]) == 'table')
local g = function(h)
    if h < 10 then
        return 'a'
    elseif h < 20 then
        return 'b'
    elseif h < 30 then
        return 'c'
    end
end
assert(g(3) == 'a' and g(12) == 'b' and g(26) == 'c' and g(100) == nil)
for h = 1, 1000 do
    break
end
local h = 100
local i = 3
local j = {}
local c = nil
while not c do
    c = 0
    for i = 1, h do
        for i = i, 1, -1 do
            c = c + 1
            j[i] = 1
        end
    end
end
assert(c == h * (h + 1) / 2 and i == 3)
assert(j[1] and j[h] and not j[0] and not j[h + 1])
function g(e)
    local d = 1
    repeat
        local c
        if e == 1 then
            local e = 1
            d = 10
            break
        elseif e == 2 then
            d = 20
            break
        elseif e == 3 then
            d = 30
        else
            local c, e, k, l = math.sin(1)
            d = d + 1
        end
    until d >= 12
    return d
end
assert(g(1) == 10 and g(2) == 20 and g(3) == 30 and g(4) == 12)
local g = function(i)
    if i < 10 then
        return 'a'
    elseif i < 20 then
        return 'b'
    elseif i < 30 then
        return 'c'
    else
        return 8
    end
end
assert(g(3) == 'a' and g(12) == 'b' and g(26) == 'c' and g(100) == 8)
local c, e = nil, 23
d = {
    g(100) * 2 + 3 or c,
    c or e + 2
}
assert(d[1] == 19 and d[2] == 25)
d = {
    f = 5 or c,
    a = e + 2
}
assert(d.g == 5 and d.c == 25)
c = {y = 1}
d = {c.f}
assert(d[1] == 1)
local function g(i)
    while 1 do
        if i > 0 then
            i = i - 1
        else
            return
        end
    end
end
local function k(i)
    while 1 do
        if i > 0 then
            i = i - 1
        else
            return
        end
    end
end
g(10)
k(10)
do
    function g()
        return 1, 2, 3
    end
    local c, e, l = g()
    assert(c == 1 and e == 2 and l == 3)
    c, e, l = g()
    assert(c == 1 and e == nil and l == nil)
end
local c, e = 3 and g()
assert(c == 1 and e == nil)
function k()
    g()
    return
end
assert(k() == nil)
function k()
    return nil or g()
end
c, e = k()
assert(c == 1 and e == nil)
print('+')
do
    local l<const> = [[local x <XXX> = 10]]
    b(l, "unknown attribute 'XXX'")
    b([[local xxx <const> = 20; xxx = 10]], ":1: attempt to assign to const variable 'xxx'")
    b([[
    local xx;
    local xxx <const> = 20;
    local yyy;
    local function foo ()
      local abc = xx + yyy + xxx;
      return function () return function () xxx = yyy end end
    end
  ]], ":6: attempt to assign to const variable 'xxx'")
    b([[
    local x <close> = nil
    x = io.open()
  ]], ":2: attempt to assign to const variable 'x'")
end
g = [[
return function ( a , b , c , d , e )
  local x = a >= b or c or ( d and e ) or nil
  return x
end , { a = 1 , b = 2 >= 1 , } or { 1 };
]]
g = string.gsub(g, "%s+", "\n")
g, c = load(g)()
assert(c.c == 1 and c.e)
function k(c, e, l, m, n)
    if not ((c >= e or l or m) and n or nil) then
        return 0
    else
        return 1
    end
end
local function l(c, e, m, n, o)
    while c >= e or m or n and o or nil do
        return 1
    end
    return 0
end
assert(g(2, 1) == true and k(2, 1) == 1 and l(2, 1) == 1)
assert(g(1, 2, 'a') == 'a' and k(1, 2, 'a') == 1 and l(1, 2, 'a') == 1)
assert(g(1, 2, 'a') ~= nil, "")
assert(g(1, 2, 'a') == 'a' and k(1, 2, 'a') == 1 and l(1, 2, 'a') == 1)
assert(g(1, 2, nil, 1, 'x') == 'x' and k(1, 2, nil, 1, 'x') == 1 and l(1, 2, nil, 1, 'x') == 1)
assert(g(1, 2, nil, nil, 'x') == nil and k(1, 2, nil, nil, 'x') == 0 and l(1, 2, nil, nil, 'x') == 0)
assert(g(1, 2, nil, 1, nil) == nil and k(1, 2, nil, 1, nil) == 0 and l(1, 2, nil, 1, nil) == 0)
assert(1 and 2 < 3 == true and 2 < 3 and 'a' < 'b' == true)
d = 2 < 3 and not 3
assert(d == false)
d = 2 < 1 or 2 > 1 and 'a'
assert(d == 'a')
do
    local c
    if nil then
        c = 1
    else
        c = 2
    end
    assert(c == 2)
end
local function m(c)
    assert(a.getinfo(1, "n").name == 'F')
    return c, 2, 3
end
c, e = m(1) ~= nil
assert(c == true and e == nil)
c, e = m(nil) == nil
assert(c == true and e == nil)
_ENV.GLOB1 = math.random(0, 1)
local n = {
    {
        "nil",
        nil
    },
    {
        "false",
        false
    },
    {
        "true",
        true
    },
    {
        "10",
        10
    },
    {
        "(0==_ENV.GLOB1)",
        0 == _ENV.GLOB1
    }
}
local o
if _ENV.GLOB1 == 0 then
    n[2][1] = "F"
    o = [[
    local F <const> = false
    if %s then IX = true end
    return %s
]]
else
    n[4][1] = "k10"
    o = [[
    local k10 <const> = 10
    if %s then IX = true end
    return %s
  ]]
end
print('testing short-circuit optimizations (' .. _ENV.GLOB1 .. ')')
local p<const> = {
    {
        " and ",
        function(c, e)
            if not c then
                return c
            else
                return e
            end
        end
    },
    {
        " or ",
        function(c, e)
            if c then
                return c
            else
                return e
            end
        end
    }
}
local q<const> = {}
local function r(h)
    local s = {}
    for i = 1, h - 1 do
        for t, u in ipairs(q[i]) do
            for t, v in ipairs(q[h - i]) do
                for t, w in ipairs(p) do
                    local j = {
                        "(" .. u[1] .. w[1] .. v[1] .. ")",
                        w[2](u[2], v[2])
                    }
                    s[#s + 1] = j
                    s[#s + 1] = {
                        "not" .. j[1],
                        not j[2]
                    }
                end
            end
        end
    end
    return s
end
local s = _soft and 3 or 4
q[1] = n
for i = 2, s do
    q[i] = r(i)
end
print("+")
local i = 0
for h = 1, s do
    for t, u in pairs(q[h]) do
        local v = u[1]
        local w = load(string.format(o, v, v), "")
        x = false
        assert(w() == u[2] and x == not not u[2])
        i = i + 1
        if i % 60000 == 0 then
            print('+')
        end
    end
end
t = nil
_G.GLOB1 = nil
b("for x do", "expected")
b("x:call", "expected")
print('OK')