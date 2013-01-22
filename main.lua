require 'scene'

function love.load()
	--Load Colors--
	darkBlue = { r = 10, g = 34, b = 78}
	lightBlue = { r = 160, g = 216, b = 241}
	redOrange = { r = 191, g = 56, b = 26}
	orange = { r = 224, g = 118, b = 40}
	yellow = { r = 233, g = 175, b = 50}
	
	--Load First Scene--
	currentScene = "menu"
	loadScene(currentScene)
	
end

function love.update()
	updateScene(currentScene)
end

function love.draw()
	drawScene(currentScene)
end

function love.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
end

function love.keypressed(key, unicode)
end

function love.keyreleased(key, unicode)
end

function love.focus(f)
end

function love.quit()
end