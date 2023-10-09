Stack = {}
function Stack:new()
    local o = {
        stack = {}
    }
    self.__index = self
    setmetatable(o, self)
    return o
end
function Stack:push(x)
    self.stack[#self.stack + 1] = x
end
function Stack:top()
    return self.stack[#self.stack]
end
function Stack:pop()
    if #self.stack == 0 then
        error("Nothing on the stack")
    end
    self.stack[#self.stack] = nil
end