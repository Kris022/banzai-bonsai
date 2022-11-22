-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- Your code here
local UI = require "ui"

local axiom = "F"
local sentence = axiom

local rules = {}

rules[1] = {
    ['a'] = "F",
    ['b'] = 'F[+F]F'
}
-- FF+[+F-F-F]-[-F+F+F]

-- function is global to give UI file access
function generate()
    local nextSentence = ""

    for i = 1, #sentence do
        local current = sentence:sub(i, i)
        local foUnd = false;

        for j = 1, #rules do
            if current == rules[j]['a'] then
                found = true
                nextSentence = nextSentence .. rules[j]['b']
                break
            end
        end

        if not (found) then
            nextSentence = nextSentence .. current
        end

    end

    sentence = nextSentence
    print(sentence)

end

tx, ty = 200, 250
lHeight = 10

-- next x, y
nx = tx
ny = ty-lHeight

a = 0.7
-- table.remove(tableName, index) to pop index = #tableName
-- table[#tableName+1] = {x,y} to push

-- PI/6 = 30 degrees

simpleStack = {}
simpleStack[1] = {200, 250}


function turtle()
  for i=1, #sentence do
    local current = sentence:sub(i, i)
    
    if current == "F" then
        display.newLine(tx, ty, nx, ny)
        tx = nx
        ty = ny
        print(tx, ty)

    elseif current == "+" then
      -- rotate right
      --nl:rotate(45)
      dx = lHeight * math.cos(a)
      dy = lHeight * math.sin(a)

      nx = nx + dx
      ny = ny - dy
     -- display.newLine(tx, ty, tx+dx, ty-dy)

    elseif current == "[" then
        -- push
        simpleStack[#simpleStack+1] = {tx, ty, nx, ny}
        print("position saved")
        print(simpleStack[#simpleStack][1], simpleStack[#simpleStack][2])

    elseif  current == "]" then
        -- pop
        tx = simpleStack[#simpleStack][1]
        ty = simpleStack[#simpleStack][2]
        nx = simpleStack[#simpleStack][3]
        ny = simpleStack[#simpleStack][4]

        print("poped position:")
        print(tx, ty, nx, ny)

    elseif current == "-" then
        -- rotate left
    end
  end
end
