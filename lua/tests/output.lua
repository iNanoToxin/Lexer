__1('paths')
__2('audio')
local __3 = __4('moses')
local __5 = "vcc2016_training"
__6('code.dtw.dtw')
__7('code.world')
__8.x, __10.y, __12.z = 1, 2, 3
local __14<X>, __16<Y>, __18<Z> = 4, 5, 6
function __20.ofIterator(...)
    local __22 = {}
    for __23 in __24, __25, __26 do
        __27[#__28 + 1] = __29
    end
    return __30
end
__31(__32[__33], __34, __35)
function __36(__37, __38)
    local __39 = __40.concat(__42, __43)
    local __44 = __45.ofIterator(__47.iterfiles(__49))
    local __50 = __51.map(__53, function(__54, __55)
        return __56.concat(__58, __59)
    end)
    return __60
end
local function __61(__62)
    local __63, __64 = __65.load(__67)
    local __68 = __69[{
        {},
        1
    }]
    return __70.pack(__72.doAll(__74, __75))
end
__76 = 2
function __77()
    local __78 = __79.dir(__81)
    local __82 = __83 .. "_feat"
    __84.mkdir(__86)
    local __87 = __88.filter(__90, function(__91, __92)
        return __93:find("S") == 1
    end)
    local __95 = __96.filter(__98, function(__99, __100)
        return __101:find("T") == 1
    end)
    if __103 <= 1 then
        for __104, __105 in __106(__107.union(__109, __110)) do
            __111.mkdir(__113.concat(__115, __116))
        end
        for __117, __118 in __119(__120.union(__122, __123)) do
            local __124 = __125(__126, __127)
            local __128 = __129.map(__131, function(__132, __133)
                return __134(__135)
            end)
            __136.eachi(__138, function(__139, __140)
                local __141 = __142.gsub(__144.gsub(__146[__147], __148, __149), ".wav", ".feat")
                local __150 = __151.map(__153, function(__154, __155)
                    return __156:float()
                end)
                __158.save(__160, __161)
            end)
        end
    end
    do
        return
    end
    if __162 <= 2 then
        local __163 = __164 .. "_pairs"
        __165.mkdir(__167)
        for __168, __169 in __170(__171) do
            for __172, __173 in __174(__175) do
                local __176 = __177(__178, __179)
                local __180 = __181(__182, __183)
                local __184 = __185.zip(__187, __188)
                local __189 = __190.concat(__192, (__193 .. "_") .. __194)
                __195.mkdir(__197)
                for __198, __199 in __200(__201) do
                    local __202 = __203.load(__205[1])
                    local __206 = __207.load(__209[2])
                    local __210 = __211(__212[3], __213[3])
                    __214.insert(__216, __217)
                    local __218 = __219 + 100000
                    local __220 = __221.concat(__223, __224 .. ".feat")
                    __225(__226)
                    __227.save(__229, __230)
                end
            end
        end
    end
end
function __231()
    local __232 = __233.popen("ls -1 vcc2016_training_feat/*/*.feat")
    for __235 in __236:lines() do
        local __238 = __239.load(__241)
        __242(__243[1]:type() == "torch.DoubleTensor")
        local __245 = __246.map(__248, function(__249, __250)
            if __251.type(__253) == "torch.DoubleTensor" then
                return __254:float()
            else
                return __256
            end
        end)
        __257(__258[1]:type() == "torch.FloatTensor")
        __260(__261)
        __262.save(__264, __265)
    end
end
__266()