function love.load()
	player = {}
	player.x = 400
	player.y = 200
	player.speed = 0
	player.dir = 1
	up = true
	upCount = 3
	stamina = 100
	myFont = love.graphics.newFont("/assets/noto/NotoSans-Bold.ttf", 24)
end

function love.update(dt)
--bobbing
	if up == true then
		player.y = player.y - 0.15
		upCount = upCount + 1
		if upCount == 20 then
			up = false
		end
	end
	if up == false then
		player.y = player.y + 0.15
		upCount = upCount - 1
		if upCount == 1 then
			 up = true
		end
	end
-- arrows
	if love.keyboard.isDown("right") then
		player.x = player.x + 7
		player.dir = 1
	end
	if love.keyboard.isDown("left") then
		player.x = player.x - 7
		player.dir = 2
	end
	if love.keyboard.isDown("up") then
		player.y = player.y - 7
		player.dir = 3
	end
	if love.keyboard.isDown("down") then
		player.y = player.y + 7
		player.dir = 4
	end
-- dash thing
	if love.keyboard.isDown("space") then
		if player.dir == 1 then
			player.x = player.x + 30
			stamina = stamina - 0.5
		elseif player.dir == 2 then
			player.x = player.x - 30
			stamina = stamina - 0.5
		elseif player.dir == 3 then
			player.y = player.y -30
			stamina = stamina - 0.5
		elseif player.dir == 4 then
			player.y = player.y + 30
			stamina = stamina - 0.5
		end
	end	

-- add stamina bar
end

function love.draw()
	love.graphics.setFont(myFont)
	love.graphics.setColor(255,255,255,255)
	love.graphics.circle("fill", player.x, player.y, 50)
	love.graphics.setColor(0,0,0,255)
	love.graphics.print("^_^", player.x - 20, player.y -40)
	love.graphics.setColor(255,255,255,255)
	love.graphics.print(stamina,500,-500)
end

