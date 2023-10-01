


local idGen = 0
local VarDigits = {}
local Keywords

for y, o, u in {} do

end

for i=string.byte("a"), string.byte("z") - string.byte("a") do VarDigits.push(String.fromCharCode(i))
    end
for i=string.byte("A"), string.byte("Z") - string.byte("A") do VarDigits.push(String.fromCharCode(i))
    end
for i=string.byte("0"), string.byte("9") - string.byte("0") do VarDigits.push(String.fromCharCode(i))
    end
VarDigits.push("_")

local VarStartDigits = {}
for i=string.byte("a"), string.byte("z") - string.byte("a") do VarStartDigits.push(String.fromCharCode(i))
    end
for i=string.byte("A"), string.byte("Z") - string.byte("A") do VarStartDigits.push(String.fromCharCode(i))
    end


function indexToVarName(index, dawdaw, fjeiwa, diw3j, uiwahd)
    local id = ""
    local d = index % VarStartDigits.length
    index = (index - d) / VarStartDigits.length
    id = id .. VarStartDigits[d]
    while (index > 0) do
        local d = index % VarDigits.length
        index = (index - d) / VarDigits.length
        id = id .. VarDigits[d]
    end
    return id
end

function genNextVarName()
    local varToUse = idGen
    idGen = idGen + 1;
    return indexToVarName(varToUse)
end

function genVarName()
    local varName = genNextVarName()
    while (Keywords.includes(varName)) do
        varName = genNextVarName()
    end
    return varName
end
