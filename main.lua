-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- Your code here
local UI = require "ui"

Stack = {}

-- Create a Table with stack functions
function Stack:Create()

  -- stack table
  local t = {}
  -- entry table
  t._et = {}

  -- push a value on to the stack
  function t:push(...)
    if ... then
      local targs = {...}
      -- add values
      for _,v in ipairs(targs) do
        table.insert(self._et, v)
      end
    end
  end

  -- pop a value from the stack
  function t:pop(num)

    -- get num values from stack
    local num = num or 1

    -- return table
    local entries = {}

    -- get values into entries
    for i = 1, num do
      -- get last entry
      if #self._et ~= 0 then
        table.insert(entries, self._et[#self._et])
        -- remove last value
        table.remove(self._et)
      else
        break
      end
    end
    -- return unpacked entries
    return unpack(entries)
  end

  -- get entries
  function t:getn()
    return #self._et
  end

  -- list values
  function t:list()
    for i,v in pairs(self._et) do
      print(i, v)
    end
  end
  return t
end

-- create stack
stack = Stack:Create()
-- push values on to the stack
stack:push("a", "b")
stack:list()
-- pop values
stack:pop()
stack:push("c")
stack:list()


local axiom = "A"
local sentence = axiom

local rule1 = {
    ['a'] = "A",
    ['b'] = 'AB'
}

local rule2 = {
    ['a'] = "B",
    ['b'] = "A"
}

-- function is global to give UI file access
function generate() 
    local nextSentence = ""
    for i = 1, #sentence do
        local current = sentence:sub(i, i)
        if current == rule1['a'] then
            nextSentence = nextSentence..rule1['b']
        elseif current == rule2['a'] then
            nextSentence = nextSentence..rule2['b']
        else
            nextSentence = nextSentence..current
        end
    end

    sentence = nextSentence
    print(sentence)

end
