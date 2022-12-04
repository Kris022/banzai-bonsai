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
    ['b'] = 'FF+F-F-F'
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
   -- print(sentence)

end

-- PI/6 = 30 degrees

function turtle()
    -- current x, y
    local cx, cy = 200, 250
    local length = 10

    -- next x, y
    local nx = 0
    local ny = 0

    -- angle
    local angle = 0
    local theta = 0.7

    -- saved x, y, angle
    local sx, sy, sa = 0, 0, 0

    for i = 1, #sentence do
        local current = sentence:sub(i, i) -- current character
        print(angle)
        if current == "F" then
            if angle == 0 then
                nx = cx
                ny = cy - length
            end
        
        
            display.newLine(cx, cy, nx, ny)

            -- move turtle to new position
            cx = nx
            cy = ny

        elseif current == "+" then
            -- rotate right
            -- nl:rotate(45)
            -- polar cooridnates key???
            angle = angle + math.pi/4
            nx = cx + (length * math.cos(angle)) -- length = radius, theta = angle
            ny = cy + (length * math.sin(angle))
            
            
        
        elseif current == "-" then
            -- rotate left
            angle = angle - math.pi/4
            nx = cx + (length * math.cos(angle)) -- length = radius, theta = angle
            ny = cy + (length * math.sin(angle))

        elseif current == "[" then
            -- push
            -- when saving there is no nx because turtle moved there already

        elseif current == "]" then
            -- pop
        
        end
    end

   -- print(sentence)

end

function turtle2()
    local height = 10
    local x, y = 200, 250
    local nx, ny = x, y - height -- next x, y
    local angle = 0
    local dAngle = 45 -- delta angle
    local sx, sy, sa = x, y, angle -- save variables

    for i = 1, #sentence do
        local current = sentence:sub(i, i)

        if current == "F" then
            local dx = height * math.cos(dAngle)
            local dy = height * math.sin(dAngle)
            print(dx, dy)
            nx = nx + dx
            ny = ny - dy

            -- draw line x,y to nx, ny
            display.newLine(x, y, nx, ny)

        elseif current == "+" then
            -- rotate right
            angle = angle + dAngle

        elseif current == "[" then
            -- push
            local sx, sy, sa = x, y, angle

        elseif current == "]" then
            -- pop
            x, y, angle = sx, sy, sa

        elseif current == "-" then
            -- rotate left
            angle = angle - dAngle
        end
    end
end

