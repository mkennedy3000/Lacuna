function loadMenu()
	--[[ Implement later to make cleaner and allow for iterations in updateMenu and drawMenu
	menu = {menuTitle, ...}
	--]]
	
	--Create Title--
	menuTitle = {
		text = "LACUNA",
		size = 64,
		x = 0,
		y = 100, 
		align = "center",
		color = darkBlue
	}
	
	--Create Play Button--
	menuPlayButton = {
		text = "PLAY",
		size = 32,
		x = 0,
		y = 400, 
		align = "center",
		color = redOrange,
		hoverColor = darkBlue,
		pressedColor = lightBlue,
		hitBox = { w = 100, h = 40, inRange = false, pressed = false}
	}
	
	--Create Quit Button--
	menuQuitButton = {
		text = "QUIT",
		size = 32,
		x = 0,
		y = 460, 
		align = "center",
		color = redOrange,
		hoverColor = darkBlue,
		pressedColor = lightBlue,
		hitBox = { w = 100, h = 40, inRange = false, pressed = false}
	}
end

function updateMenu()
	--Check if mouse is hovering over button--
	local x, y = love.mouse.getPosition()
	isHovering(x,y)
	
	--Check for button presses--
	if love.mouse.isDown("l") then
		if menuPlayButton.hitBox.inRange then
			menuPlayButton.hitBox.pressed = true
			menuQuitButton.hitBox.pressed = false
		elseif menuQuitButton.hitBox.inRange then
			menuQuitButton.hitBox.pressed = true
			menuPlayButton.hitBox.pressed = false
		else
			menuQuitButton.hitBox.pressed = false
			menuPlayButton.hitBox.pressed = false
		end
	--Check for button releases--
	else
		if menuPlayButton.hitBox.pressed then
			--Play Button Clicked--
			menuPlayButton.hitBox.pressed = false
		elseif menuQuitButton.hitBox.pressed then
			--Quit Button Clicked--
			menuQuitButton.hitBox.pressed = false
			love.event.quit()
		end
	end
end

function drawMenu()
	--Draw Background--
	love.graphics.setBackgroundColor(yellow.r, yellow.g, yellow.b)
	
	--Draw Title--
	love.graphics.setColor(menuTitle.color.r, menuTitle.color.g, menuTitle.color.b)
	love.graphics.setNewFont(menuTitle.size)
	love.graphics.printf(menuTitle.text, menuTitle.x, menuTitle.y, 500, menuTitle.align)
	
	--Draw Play Button--
	if menuPlayButton.hitBox.inRange == true then
		if not menuPlayButton.hitBox.pressed then
			love.graphics.setColor(menuPlayButton.hoverColor.r, menuPlayButton.hoverColor.g, menuPlayButton.hoverColor.b)
		else
			love.graphics.setColor(menuPlayButton.pressedColor.r, menuPlayButton.pressedColor.g, menuPlayButton.pressedColor.b)
		end
		love.graphics.rectangle("fill", 250-(menuPlayButton.hitBox.w/2), menuPlayButton.y, menuPlayButton.hitBox.w, menuPlayButton.hitBox.h)
	end
	
	love.graphics.setColor(menuPlayButton.color.r, menuPlayButton.color.g, menuPlayButton.color.b)
	love.graphics.setNewFont(menuPlayButton.size)
	love.graphics.printf(menuPlayButton.text, menuPlayButton.x, menuPlayButton.y, 500, menuPlayButton.align)
	
	--Draw Quit Button--
	if menuQuitButton.hitBox.inRange == true then
		if not menuQuitButton.hitBox.pressed then
			love.graphics.setColor(menuQuitButton.hoverColor.r, menuQuitButton.hoverColor.g, menuQuitButton.hoverColor.b)
		else
			love.graphics.setColor(menuQuitButton.pressedColor.r, menuQuitButton.pressedColor.g, menuQuitButton.pressedColor.b)
		end
		love.graphics.rectangle("fill", 250-(menuQuitButton.hitBox.w/2), menuQuitButton.y, menuQuitButton.hitBox.w, menuQuitButton.hitBox.h)
	end
	
	love.graphics.setColor(menuQuitButton.color.r, menuQuitButton.color.g, menuQuitButton.color.b)
	love.graphics.setNewFont(menuPlayButton.size)
	love.graphics.printf(menuQuitButton.text, menuQuitButton.x, menuQuitButton.y, 500, menuQuitButton.align)
	
end

function isHovering(x,y)
	--Play Button--
	if x >= 250-(menuPlayButton.hitBox.w/2) and
	   x <= 250+(menuPlayButton.hitBox.w/2) and
	   y >= menuPlayButton.y and
	   y <= menuPlayButton.y+menuPlayButton.hitBox.h then
		menuPlayButton.hitBox.inRange = true
	else
		menuPlayButton.hitBox.inRange = false
	end
	
	--Quit Button--
	if x >= 250-(menuQuitButton.hitBox.w/2) and
	   x <= 250+(menuQuitButton.hitBox.w/2) and
	   y >= menuQuitButton.y and
	   y <= menuQuitButton.y+menuQuitButton.hitBox.h then
		menuQuitButton.hitBox.inRange = true
	else
		menuQuitButton.hitBox.inRange = false
	end
end

function deleteMenu()
	--Deallocate Memory--
	menuTitle = nil
	menuQuitButton = nil
	menuPlayButton = nil
end
