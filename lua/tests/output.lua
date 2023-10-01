local a = 0
local b = {}
local c
for d, e, f in {} do
end
for g = string.byte("a"), string.byte("z") - string.byte("a") do
    b.push(String.fromCharCode(g))
end
for g = string.byte("A"), string.byte("Z") - string.byte("A") do
    b.push(String.fromCharCode(g))
end
for g = string.byte("0"), string.byte("9") - string.byte("0") do
    b.push(String.fromCharCode(g))
end
b.push("_")
local j = {}
for g = string.byte("a"), string.byte("z") - string.byte("a") do
    j.push(String.fromCharCode(g))
end
for g = string.byte("A"), string.byte("Z") - string.byte("A") do
    j.push(String.fromCharCode(g))
end
function indexToVarName(m, n, o, p, q)
    local r = ""
    local s = m % j.length
    m = (m - s) / j.length
    r = r .. j[s]
    while m > 0 do
        local s = m % b.length
        m = (m - s) / b.length
        r = r .. b[s]
    end
    return r
end
function genNextVarName()
    local u = a
    a = a + 1;
    return indexToVarName(u)
end
function genVarName()
    local v = genNextVarName()
    while c.includes(v) do
        v = genNextVarName()
    end
    return v
end