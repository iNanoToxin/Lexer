ALSO_FIRST = {}
function FIRST_VAR:new()
    local ALSO_FIRST = {
        ALSO_FIRST = {}
    }
    FIRST_VAR.__index = ALSO_FIRST
    ALSO_FIRST(ALSO_FIRST, ALSO_FIRST)
    return ALSO_FIRST
end
function FIRST_VAR:push(ALSO_FIRST)
    FIRST_VAR.stack[#FIRST_VAR.stack + 1] = ALSO_FIRST
end
function FIRST_VAR:top()
    return FIRST_VAR.stack[#FIRST_VAR.stack]
end
function FIRST_VAR:pop()
    if #FIRST_VAR.stack == 0 then
        ALSO_FIRST("Nothing on the stack")
    end
    FIRST_VAR.stack[#FIRST_VAR.stack] = nil
end
function FIRST_VAR.x.x.x.x.x:x()
end