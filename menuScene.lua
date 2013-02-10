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
	menuQuitButton:draw()
end

function deleteMenu()
	--Deallocate Memory--
	menuTitle = nil
	menuQuitButton = nil
	menuPlayButton = nil
end
