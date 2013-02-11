-----------------------
--[ GameScene Class ]--
-----------------------

require 'Scene'
require 'GameGrid'

GameScene = Scene:new()

-------------------------
--[ GameScene Methods ]--
-------------------------

function GameScene:loadScene()
	--Create GameGrid--
	self.grid = GameGrid:new()
	self.grid:loadGameGrid()
	
	--Create Quit Button--
	self.quitButton = Button:new{ text = "QUIT", x = -20, y = 750 , align = "right",
								 callBack = function() love.event.quit() end}
end

function GameScene:update(dt)
	self.grid:update(dt)
	self.quitButton:update()
end

function GameScene:draw()
	self.grid:draw()
	self.quitButton:draw()
end

function GameScene:keypressed(key, unicode)
	self.grid:keypressed(key, unicode)
end