require 'Director'
require 'MenuScene'

function love.load()
	--[[Game Constants]]--
		--Scene Size--
		screenSize = { w = 620, h = 820}
		--Load Colors--
		darkBlue = { r = 10, g = 34, b = 78}
		lightBlue = { r = 160, g = 216, b = 241}
		redOrange = { r = 191, g = 56, b = 26}
		orange = { r = 224, g = 118, b = 40}
		yellow = { r = 233, g = 175, b = 50}
	----------------------
	
	--Load First Scene--
	Director:loadFirstScene( MenuScene:new() )
end

function love.update(dt)
	Director:update(dt)
end

function love.draw()
	Director:draw()
end

function love.mousepressed(x, y, button)
	Director:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	Director:mousereleased(x, y, button)
end

function love.keypressed(key, unicode)
	Director:keypressed(key, unicode)
end

function love.keyreleased(key, unicode)
	Director:keyreleased(key, unicode)
end

function love.focus(f)
	Director:focus(f)
end

function love.quit()
	Director:quit()
end