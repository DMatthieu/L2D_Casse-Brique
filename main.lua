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

end

function love.update(dt)

    

end

function love.draw()
    --Draw paddle
    love.graphics.rectangle("fill", pad.x, pad.y, pad.width, pad.height)
    
    love.graphics.setColor(255,0,0)
    love.graphics.circle("fill", ball.x, ball.y, ball.width / 2)
    love.graphics.reset()
end




--Permit Game Extinction
function love.keypressed(key)
    if key=="escape" then
        love.event.quit()
    end  
end