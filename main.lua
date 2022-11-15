-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- Your code here
local UI = require "ui"

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
