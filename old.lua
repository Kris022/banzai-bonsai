function drawCircle(x, y, r)
    local c = display.newCircle(x, y, r)
    c:setFillColor(0)
    c.strokeWidth = 1
    print(r)
    if r > 2 then
        r = r * 0.75
        drawCircle(x, y, r)
    end
end

function drawTwoCircles(x, y, r)
    local c = display.newCircle(x, y, r)
    c:setFillColor(0)
    c.strokeWidth = 1
    print(r)
    if r > 2 then
        drawTwoCircles(x + r / 2, y, r / 2)
        drawTwoCircles(x - r / 2, y, r / 2)
    end
end

function drawTree(x, y, le)
    local l = display.newLine(x, y, x, y - 100)
    le = le - 1
    if le > 2 then
        l:rotate(45)
        drawTree(x, y - 100, le)
        -- drawTree(x, y-100, le-1)
    end
end

function drawTree2(x, y, le)
    local l = display.newLine(x, y, x, y - 100)

    local ba = display.newLine(x, y - 100, x, y - 200)
    ba:rotate(-45)


    local bb = display.newLine(x, y - 100, x, y - 200)
    bb:rotate(45)
    print(bb.contentBounds["yMin"])
    local bc = display.newLine(bb.contentBounds["xMax"]-2, bb.contentBounds["yMin"]+2, 273, 126 - 50)
    bc:rotate(60)
end

--
--bc:rotate(90)

function drawTree3(x, y, le, a)
    local l = display.newLine(x, y, x, y - 100)
    print(l.x)
    l:rotate(a)
    a = a * -1
    le = le - 1
    if le > 0 then
    drawTree3(x, y-100, le, 45)
    end
end

-- pos x y = (x,y) + angle * branch length

-- display.newLine(200, 300, 200, 200) -- x, y, x, y-100

drawTree2(200, 300, 4)



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
    ['b'] = 'FF+[+F-F-F]-[-F+F+F]'
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

tx, ty = 200, 250
lHeight = 10

-- next x, y
nx = tx
ny = ty - lHeight

a = 0
theta = 0.7
-- table.remove(tableName, index) to pop index = #tableName
-- table[#tableName+1] = {x,y} to push

-- PI/6 = 30 degrees

simpleStack = {}
simpleStack[1] = {200, 250}

function turtle()
    for i = 1, #sentence do
        local current = sentence:sub(i, i) -- current character

        if current == "F" then
            display.newLine(tx, ty, nx, ny)

            tx = nx
            ty = ny

            if a == 0 then
                ny = ty - lHeight
            end

        elseif current == "+" then
            -- rotate right
            -- nl:rotate(45)
            -- polar cooridnates key???
            a = a + theta
            dx = lHeight * math.cos(a)
            dy = lHeight * math.sin(a)

            nx = nx + dx
            ny = ny - dy
            -- display.newLine(tx, ty, tx+dx, ty-dy)

        elseif current == "[" then
            -- push
            -- when saving there is no nx because turtle moved there already
            simpleStack[#simpleStack + 1] = {tx, ty, a}

        elseif current == "]" then
            -- pop
            tx = simpleStack[#simpleStack][1]
            ty = simpleStack[#simpleStack][2]
            a = simpleStack[#simpleStack][3]

        elseif current == "-" then
            -- rotate left
            a = a + theta
            dx = lHeight * math.cos(a)
            dy = lHeight * math.sin(a)

            nx = nx - dx
            ny = ny - dy
        end
        print(a)
    end

    print(sentence)

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

