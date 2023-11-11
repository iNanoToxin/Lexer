print("testing UTF-8 library")
local a = require("utf8")
local function b(c, d, ...)
    local e, f = pcall(d, ...)
    assert(not e and string.find(f, c))
end
local function c(d)
    return #string.gsub(d, "[\x80-\xBF]", "")
end
local d = "^" .. a.charpattern .. "$"
local function e(f, g)
    local h = {"return '"}
    for i = 1, #g do
        h[i + 1] = string.format("\\u{%x}", g[i])
    end
    h[#g + 2] = "'"
    h = table.concat(h)
    assert(assert(load(h))() == f)
end
assert(not a.offset("alo", 5))
assert(not a.offset("alo", -4))
local function f(g, h, i)
    local j = a.c(g, 1, -1, i)
    assert(#h == j and c(g) == j)
    assert(a.char(table.unpack(h)) == g)
    assert(a.offset(g, 0) == 1)
    e(g, h)
    local k = {a.codepoint(g, 1, -1, i)}
    assert(#h == #k)
    for l = 1, #h do
        assert(h[l] == k[l])
    end
    for l = 1, j do
        local m = a.offset(g, l)
        local n = a.offset(g, 2, m)
        assert(string.find(string.sub(g, m, n - 1), d))
        assert(a.offset(g, -1, n) == m)
        assert(a.offset(g, l - j - 1) == m)
        assert(n - m == #a.char(a.codepoint(g, m, m, i)))
        for o = m, n - 1 do
            assert(a.offset(g, 0, o) == m)
        end
        for o = m + 1, n - 1 do
            assert(not a.c(g, o))
        end
        assert(a.c(g, m, m, i) == 1)
        assert(a.c(g, m, n - 1, i) == 1)
        assert(a.c(g, m, -1, i) == j - l + 1)
        assert(a.c(g, n, -1, i) == j - l)
        assert(a.c(g, 1, m, i) == l)
    end
    local l = 0
    for m, n in a.codes(g, i) do
        l = l + 1
        assert(n == h[l] and m == a.offset(g, l))
        assert(a.codepoint(g, m, m, i) == n)
    end
    assert(l == #h)
    l = 0
    for m in string.gmatch(g, a.charpattern) do
        l = l + 1
        assert(m == a.char(h[l]))
    end
    assert(l == #h)
    for l = 1, j do
        assert(a.offset(g, l) == a.offset(g, l - j - 1, #g + 1))
    end
end
do
    local function f(g, h)
        local i, j = a.c(g)
        assert(not i and j == h)
    end
    f("abc\xE3def", 4)
    f("\xF4\x9F\xBF", 1)
    f("\xF4\x9F\xBF\xBF", 1)
    f("\230\177\137\229\173\151\x80", 25)
    f("\x80hello", 1)
    f("hel\x80lo", 4)
    f("\230\177\137\229\173\151\xBF", 25)
    f("\xBFhello", 1)
    f("hel\xBFlo", 4)
end
do
    local function g(h)
        b("invalid UTF%-8 code", function()
            for i in a.codes(h) do
                assert(i)
            end
        end)
    end
    g("ab\xff")
    g("\u{110000}")
    g("in\x80valid")
    g("\xbfinvalid")
    g("\206\177\206\187\207\134\xBF\206\177")
    local h = a.codes("")
    assert(h("", 2) == nil)
    assert(h("", -1) == nil)
    assert(h("", math.mininteger) == nil)
end
b("position out of bounds", a.offset, "abc", 1, 5)
b("position out of bounds", a.offset, "abc", 1, -4)
b("position out of bounds", a.offset, "", 1, 2)
b("position out of bounds", a.offset, "", 1, -1)
b("continuation byte", a.offset, "\240\166\167\186", 1, 2)
b("continuation byte", a.offset, "\240\166\167\186", 1, 2)
b("continuation byte", a.offset, "\x80", 1)
b("out of bounds", a.c, "abc", 0, 2)
b("out of bounds", a.c, "abc", 1, 4)
local g = "hello World"
local h = {string.byte(g, 1, -1)}
for i = 1, a.c(g) do
    assert(h[i] == string.byte(g, i))
end
f(g, h)
f("\230\177\137\229\173\151/\230\188\162\229\173\151", {
    27721,
    23383,
    47,
    28450,
    23383
})
do
    local g = "\195\161\195\169\195\173\128"
    local h = {a.codepoint(g, 1, #g - 1)}
    assert(#h == 3 and h[1] == 225 and h[2] == 233 and h[3] == 237)
    b("invalid UTF%-8 code", a.codepoint, g, 1, #g)
    b("out of bounds", a.codepoint, g, #g + 1)
    h = {a.codepoint(g, 4, 3)}
    assert(#h == 0)
    b("out of bounds", a.codepoint, g, -(#g + 1), 1)
    b("out of bounds", a.codepoint, g, 1, #g + 1)
    assert(a.codepoint("\u{D7FF}") == 55295)
    assert(a.codepoint("\u{E000}") == 57344)
    assert(a.codepoint("\u{D800}", 1, 1, true) == 55296)
    assert(a.codepoint("\u{DFFF}", 1, 1, true) == 57343)
    assert(a.codepoint("\u{7FFFFFFF}", 1, 1, true) == 2147483647)
end
assert(a.char() == "")
assert(a.char(0, 97, 98, 99, 1) == "\0abc\1")
assert(a.codepoint(a.char(1114111)) == 1114111)
assert(a.codepoint(a.char(2147483647), 1, 1, true) == -2147483649)
b("value out of range", a.char, 2147483648)
b("value out of range", a.char, -1)
local function i(g)
    b("invalid UTF%-8 code", a.codepoint, g)
    assert(not a.c(g))
end
i("\xF4\x9F\xBF\xBF")
i("\u{D800}")
i("\u{DFFF}")
i("\xC0\x80")
i("\xC1\xBF")
i("\xE0\x9F\xBF")
i("\xF0\x8F\xBF\xBF")
i("\x80")
i("\xBF")
i("\xFE")
i("\xFF")
f("", {})
g = "\0 \x7F\z\xC2\x80 \xDF\xBF\z\xE0\xA0\x80 \xEF\xBF\xBF\z\xF0\x90\x80\x80  \xF4\x8F\xBF\xBF"
g = string.gsub(g, " ", "")
f(g, {
    0,
    127,
    128,
    2047,
    2048,
    65535,
    65536,
    1114111
})
do
    local g = "\u{4000000}\u{7FFFFFFF}"
    assert(#g == 12)
    f(g, {
        67108864,
        2147483647
    }, true)
    g = "\u{200000}\u{3FFFFFF}"
    assert(#g == 10)
    f(g, {
        2097152,
        67108863
    }, true)
    g = "\u{10000}\u{1fffff}"
    assert(#g == 8)
    f(g, {
        65536,
        2097151
    }, true)
end
local j = "\230\151\165\230\156\172\232\170\158a-4\0\195\169\195\179"
f(j, {
    26085,
    26412,
    35486,
    97,
    45,
    52,
    0,
    233,
    243
})
f("\240\163\178\183\240\160\156\142\240\160\177\147\240\161\129\187\240\160\181\188ab\240\160\186\162", {
    146615,
    132878,
    134227,
    135291,
    134524,
    97,
    98,
    134818
})
f("\240\168\179\138\240\169\182\152\240\166\167\186\240\168\179\146\240\165\132\171\240\164\147\147\xF4\x8F\xBF\xBF", {
    167114,
    171416,
    158202,
    167122,
    151851,
    148691,
    1114111
})
local k = 0
for l, m in string.gmatch(j, "()(" .. a.charpattern .. ")") do
    k = k + 1
    assert(a.offset(j, k) == l)
    assert(a.c(j, l) == a.c(j) - k + 1)
    assert(a.c(m) == 1)
    for n = 1, #m - 1 do
        assert(a.offset(j, 0, l + n - 1) == l)
    end
end
print("ok")