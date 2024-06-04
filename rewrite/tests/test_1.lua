-- Arithmetic Operations
local sum = (47395834458145/1e+15+85839087547834/1e+14+43239386108139/1e+14+54729930718345/1e+15+69183743289251/1e+14+6393623083282/10000000000000+52517446765381/1e+14+50320566351785/1e+14+54599659113517/1e+14+33904894944964/1e+14+59034175514036/1e+14+11138935209468/1e+15+29823940592327/1e+14+38009392270218/1e+14+73539859014528/1e+14+47706770813518/1e+14+61642312459879/1e+14+55184983960615/1e+14+30599426847269/1e+15+65718576145836/1e+14+45062286662999/1e+14+17349287272664/1e+14+64373258733019/1e+14+69199469310595/1e+14+72065584549425/1e+14+96574947534475/1e+15+46909934565382/1e+14+58110454208167/1e+14+86740131442213/1e+14+20329269672087/1e+14+20135675494003/1e+14+91479714888028/1e+14)
local difference = 5 - 3 -- 2
local product = 5 * 3 -- 15
local quotient = 5 / 3 -- 1.6666666666667
local floorDiv = 5 // 3 -- 1
local modulus = 5 % 3 -- 2
local power = 5 ^ 3 -- 125

-- Relational Operations
local isEqual = 5 == 3 -- false
local isNotEqual = 5 ~= 3 -- true
local isLess = 5 < 3 -- false
local isGreater = 5 > 3 -- true
local isLessOrEqual = 5 <= 3 -- false
local isGreaterOrEqual = 5 >= 3 -- true

-- Logical Operations
local andResult = true and false -- false
local orResult = true or false -- true
local notResult = not true -- false

-- Bitwise Operations
local bitAnd = 5 & 3 -- 1
local bitOr = 5 | 3 -- 7
local bitXor = 5 ~ 3 -- 6
local bitNot = ~5 -- -6
local bitLeftShift = 5 << 1 -- 10
local bitRightShift = 5 >> 1 -- 2

-- Concatenation Operation
local concat = "Hello" .. " " .. "World" -- "Hello World"

-- Combined Examples
local combined1 = (5 + 3) & (10 - 2) -- 8
local combined2 = (5 * 3) | (2 ^ 3) -- 15
local combined3 = (5 > 3) and (2 < 4) -- true
local combined4 = (5 == 3) or (2 <= 4) -- true
local combined5 = (5 & 3) + (10 | 2) -- 11
local combined6 = (5 ~ 3) * (8 >> 2) -- 12
local combined7 = (5 + 3) == (10 - 2) -- true
local combined8 = (5 * 3) ~= (2 ^ 3) -- true
