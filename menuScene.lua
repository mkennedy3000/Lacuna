require 'Button'

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
	menuPlayButton = Button:new{ text = "PLAY", y = 400 }
	
	--Create Quit Button--
	menuQuitButton = Button:new{ text = "QUIT", y = 460 , callBack = function() love.event.quit() end}
	
end

function updateMenu()
	menuPlayButton:update()
	menuQuitButton:update()
end

function drawMenu()
	--Draw Background--
	love.graphics.setBackgroundColor(yellow.r, yellow.g, yellow.b)
	
	--Draw Title--
	love.graphics.setColor(menuTitle.color.r, menuTitle.color.g, menuTitle.color.b)
	love.graphics.setNewFont(menuTitle.size)
	love.graphics.printf(menuTitle.text, menuTitle.x, menuTitle.y, 500, menuTitle.align)
	
	--Draw Play Button--
	menuPlayButton:draw()
	
	--Draw Quit Button--
<<<<<<< HEAD
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
=======
	menuQuitButton:draw()
>>>>>>> Button class added
end

function deleteMenu()
	--Deallocate Memory--
	menuTitle = nil
	menuQuitButton = nil
	menuPlayButton = nil
end
