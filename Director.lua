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

function Director:update()
	--Update the current scene--
	self.scenes[self.currentScene]:update()
end

function Director:draw()
	--Draw the current scene--
	self.scenes[self.currentScene]:draw()
end

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