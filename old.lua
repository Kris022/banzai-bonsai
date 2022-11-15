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