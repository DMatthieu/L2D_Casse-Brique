--Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no');

--love.graphics.setDefaultFilter( "nearest" )



function love.load()
    --DIMENSIONS DE LA FENETRE
    largeur = love.graphics.getWidth();
    hauteur = love.graphics.getHeight();

    --Pad variables
    pad = {}
        pad.height = 20
        pad.width = 100
        pad.x = (largeur / 2) - (pad.width / 2)
        pad.y = hauteur - (pad.height * 2)

    ball = {}
        ball.width = 20
        ball.x = pad.x + (pad.width / 2)
        ball.y = pad.y - (ball.width / 2)
        ball.stick = true
        ball.speed = 180
        ball.vx = ball.speed
        ball.vy = -ball.speed

    mousePos = {}
        mousePos.x, mousePos.y = 0  
        
    

    level_1 = {
                {1,1,1,1,1,1,1,1,1,1},
                {1,1,1,1,1,1,1,1,1,1},
                {1,1,1,1,1,1,1,1,1,1},
                {1,1,1,1,1,1,1,1,1,1},
                {1,1,1,1,1,1,1,1,1,1},
                {1,1,1,1,1,1,1,1,1,1}
            }

    tile = {}
        tile.width = (97 * (largeur / #level_1[1])) / 100
        tile.height = ball.width
         
        tile.offset = 2

end

function love.update(dt)

    

    --Update Mouse Pos
    mousePos.x, mousePos.y = love.mouse.getPosition()

    --update paddle position on X-Axis
    pad.x = mousePos.x
    CheckPaddleCollideWalls()

    --Behavior of ball if STICKY or NOT
    if ball.stick == true  then
        ball.x = pad.x + (pad.width / 2)
        ball.y = pad.y - (ball.width / 2)
    elseif ball.stick == false then
        

        ball.x = ball.x + (ball.vx * dt)
        ball.y = ball.y + (ball.vy * dt)
    end

    CheckBallCollideWall()
    
end

function love.draw()
    --Draw paddle
    love.graphics.rectangle("fill", pad.x, pad.y, pad.width, pad.height)
    
    --Draw ball
    love.graphics.setColor(255,0,0)
    love.graphics.circle("fill", ball.x, ball.y, ball.width / 2)
    love.graphics.reset()

    PrintDebug()

    DrawLevel(level_1)

    
    
end

--Callback checking if mouse is clicked
function love.mousepressed(x, y, button, istouch, presses)
    --LAUNCH THE BALL IF MOUSECLICK
    if button == 1 and ball.stick == true then
        ball.stick = false
        --WARNING: This callback can call whatever love function
        --but if you tru to call a love.graphics function
        --it will do nothing because out of DRAW FUNCTION ! :)
    end
end

function DrawLevel(pLevel)
    for i=1,#pLevel,1 do
        local tile_y = 2 + ((i - 1) * (tile.height + tile.offset))
        for j=1,#pLevel[i],1 do
            local tile_x = (j - 1) * (largeur / #pLevel[i])
            love.graphics.setColor(255,0,255)
            love.graphics.rectangle("fill", tile_x, tile_y, tile.width, tile.height)
            love.graphics.reset()
        end
    end
end

--Permit Game Extinction
function love.keypressed(key)
    if key=="escape" then
        love.event.quit()
    end  
end

function CheckBallCollideWall()
    --Wall Right
    if ball.x >= largeur - (ball.width/2) then ball.vx = 0 - ball.vx end
    --Wall Upside
    if ball.y <= 0 + (ball.width/2) then ball.vy = 0 - ball.vy end
    --Wall Left
    if ball.x <= 0 + (ball.width/2) then ball.vx = 0 - ball.vx end
    --Wall Bottom ! (Game Over ?)
    if ball.y >= hauteur - (ball.width/2) then ball.vy = 0 - ball.vy end
end

function CheckBallCollidePad()

end

--Manage collisions on walls
function CheckPaddleCollideWalls()
    

    --Wall Right
    if pad.x >= largeur - (pad.width) then 
        pad.x = largeur - pad.width 

    end
end

function PrintDebug() 
    --Paddle informations
    love.graphics.print("ball.vx: "..ball.vx, 650, 470, 0, 1.5, 1.5)
    love.graphics.print("ball.vy: "..ball.vy, 650, 490, 0, 1.5, 1.5)
    --love.graphics.print("Mouse.x: "..mousePos.x, 850, 50, 0, 1.5, 1.5)
    --love.graphics.print("Mouse.y: "..mousePos.y, 850, 70, 0, 1.5, 1.5)

    --love.graphics.print("#level_1[1] : "..#level_1[1], 850, 90, 0, 1.5, 1.5)
end