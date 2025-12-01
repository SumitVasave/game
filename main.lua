
function love.load()
    camera=require 'lib/camera'
    cam=camera()
    x,y=100,150
    kid=love.graphics.newImage('sprites/kidbig.png')
    icon=love.image.newImageData('sprites/kid.png')
    love.window.setIcon(icon)
    love.window.setTitle("Game by sumit.")
    background=love.graphics.newImage('sprites/background.png')
    --love.window.setMode(800,600,{resizable=true})
    --love.window.maximize()
    love.window.updateMode({resizable=true})
    
end

function love.update(dt)
    if love.keyboard.isDown('right') or love.keyboard.isDown('d') then
        x = x + 100 * dt
    end
    if love.keyboard.isDown('left') or love.keyboard.isDown('a') then
        x = x - 100 * dt
    end
    if love.keyboard.isDown('up') or love.keyboard.isDown('w') then
        y = y - 100 * dt
    end
    if love.keyboard.isDown('down') or love.keyboard.isDown('s') then
        y = y + 100 * dt
    end

    cam:lookAt(x,y)

    local w= love.graphics.getWidth()
    local h= love.graphics.getHeight()

    if x<w/2 then
        cam:lookAt(w/2,cam.y)
    end
    if y<h/2 then
        cam:lookAt(cam.x,h/2)
    end
    --[[ TO be coded LATER for BOUNDARIES
    if x>w/2 then
        cam:lookAt(w/2,cam.y)
    end
    if y>h/2 then
        cam:lookAt(cam.x,h/2)
    end
    --]]
end

function love.draw()
    
    cam:attach()
        love.graphics.draw(background,0,0,0,0.7,0.7)
        love.graphics.draw(kid,x,y,0,0.3,0.3,kid:getWidth()/2,kid:getHeight()/2)
    cam:detach()
    love.graphics.print(string.format("position:%.1f,%.1f",x,y),10,10)
end

function love.keypressed(key)
    if key=='f' then
        love.window.setFullscreen(true)
    end
end
