
function love.load()
    x,y=100,150
    r=10
    kid=love.graphics.newImage('sprites/kidbig.png')
    background=love.graphics.newImage('sprites/background.png')
end

function love.update(dt)
    if love.keyboard.isDown('right') then
        x = x + 100 * dt
    end
    if love.keyboard.isDown('left') then
        x = x - 100 * dt
    end
    if love.keyboard.isDown('up') then
        y = y - 100 * dt
    end
    if love.keyboard.isDown('down') then
        y = y + 100 * dt
    end
end

function love.draw()
    love.graphics.draw(background,0,0,0,0.7,0.7)
    love.graphics.draw(kid,x,y,0,0.3,0.3,kid:getWidth()/2,kid:getHeight()/2)
    love.graphics.print(string.format("position:%.1f,%.1f",x,y),10,10)
end