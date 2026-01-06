
function love.load()
    --Player

    Player={}
    Player.x=100
    Player.y=150
    Player.speed=100
    Player.texture=love.graphics.newImage('sprites/player.png')
    Player.conltolTexture=love.graphics.newImage('sprites/control.png')
    Player.texture:setFilter('nearest','nearest')
    Player.conltolTexture:setFilter('nearest','nearest')
    Player.controls={
        up='w',
        down='s',
        left='a',
        right='d'
    }
    Player.touch=love.touch.getTouches()
    -- Camera
    Camera=require 'lib/camera'
    Cam=Camera()

    --window
    love.window.setMode(800,600,{resizable=false,vsync=true})
end

function love.update(dt)

    -- movement
    if love.keyboard.isDown('right') or love.keyboard.isDown('d') then
        Player.x = Player.x + Player.speed* dt
    end
    if love.keyboard.isDown('left') or love.keyboard.isDown('a') then
        Player.x = Player.x - Player.speed* dt
    end
    if love.keyboard.isDown('up') or love.keyboard.isDown('w') then
        Player.y = Player.y - Player.speed* dt
    end
    if love.keyboard.isDown('down') or love.keyboard.isDown('s') then
        Player.y = Player.y + Player.speed* dt
    end

    -- Cam:lookAt(Player.x,Player.y)

end

function love.draw()
    love.graphics.setColor(1,1,1,1)
    love.graphics.setBackgroundColor(0, 0.5, 1)
    
    -- Cam:attach()
        love.graphics.draw(Player.texture,Player.x,Player.y,0,10,10)
    -- Cam:detach()

    love.graphics.setColor(1,1,1,0.5)
    love.graphics.draw(Player.conltolTexture,50,400,0,5,5)
    love.graphics.setColor(1,1,1,1)
    love.graphics.print(string.format("position:%.1f,%.1f",Player.x,Player.y),4,4)
end

function love.keypressed(key)
    if key=='f' then
        love.window.setFullscreen(true)
    end
    if key=='p' then
        Player.speed=Player.speed+50
    end
end

--function love.touchpressed(id,x,y,dx,dy,pressure)
--    if x>50 and x<200 and y>400 and y<550  then
--            Player.x=Player.x+50
--    end
 -- end

function love.mousepressed(x,y,button,istouch,presses)
    
     if x>50 and x<200 and y>400 and y<550 and istouch==true then
             Player.x=Player.x+50
     end
    
end

