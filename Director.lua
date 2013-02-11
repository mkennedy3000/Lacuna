---------------------
--[ Director Class]--
---------------------

require 'Scene'

Director = {
	scenes = {},
	currentScene = -1
}

-----------------------
--[ Director Methods]--
-----------------------

function Director:loadFirstScene(s)
	s:loadScene()
	self.currentScene = 1
	self.scenes[self.currentScene] = s
end

function Director:update(dt)
	--Update the current scene--
	self.scenes[self.currentScene]:update(dt)
end

function Director:draw()
	--Draw the current scene--
	self.scenes[self.currentScene]:draw()
end

function Director:mousepressed(x, y, button)
	self.scenes[self.currentScene]:mousepressed(x, y, button)
end

function Director:mousereleased(x, y, button)
	self.scenes[self.currentScene]:mousereleased(x, y, button)
end

function Director:keypressed(key, unicode)
	self.scenes[self.currentScene]:keypressed(key, unicode)
end

function Director:keyreleased(key, unicode)
	self.scenes[self.currentScene]:keyreleased(key, unicode)
end

function Director:focus(f)
	--Pause To Be Implemented--
	--Push Pause Scene Here--
	self.scenes[self.currentScene]:focus(f)
end

function Director:quit()
	self.scenes[self.currentScene]:quit()
end

-----------------------------------------------------

function Director:changeToScene(s)
	s:loadScene()
	self.scenes[self.currentScene] = s
end

function Director:pushScene(s)
	--To Be Implemented--
end

function Director:popScene()
	--To Be Implemented--
end