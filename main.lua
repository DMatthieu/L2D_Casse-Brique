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

    mousePos = {}
        mousePos.x, mousePos.y = 0    

end

function love.update(dt)

    --Update Mouse Pos
    mousePos.x, mousePos.y = love.mouse.getPosition()

    --update paddle position on X-Axis
    pad.x = mousePos.x

    --Position of the Ball on screen
    if ball.stick  then
        ball.x = pad.x + (pad.width / 2)
        ball.y = pad.y - (ball.width / 2)
    else
    
    end

end

function love.draw()
    --Draw paddle
    love.graphics.rectangle("fill", pad.x, pad.y, pad.width, pad.height)
    
    --Draw ball
    love.graphics.setColor(255,0,0)
    love.graphics.circle("fill", ball.x, ball.y, ball.width / 2)
    love.graphics.reset()

    PrintDebug()

end




--Permit Game Extinction
function love.keypressed(key)
    if key=="escape" then
        love.event.quit()
    end  
end

function PrintDebug() 
    --Paddle informations
    love.graphics.print("Pad.x: "..pad.x, 850, 10, 0, 1.5, 1.5)
    love.graphics.print("Pad.y: "..pad.y, 850, 30, 0, 1.5, 1.5)
    love.graphics.print("Mouse.x: "..mousePos.x, 850, 50, 0, 1.5, 1.5)
    love.graphics.print("Mouse.y: "..mousePos.y, 850, 70, 0, 1.5, 1.5)
end