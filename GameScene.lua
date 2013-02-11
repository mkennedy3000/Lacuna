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
	self.grid = GameGrid:new()
	self.grid:loadGameGrid()
end

function GameScene:update(dt)
	self.grid:update(dt)
end

function GameScene:draw()
	self.grid:draw()
end

function GameScene:keypressed(key, unicode)
	self.grid:keypressed(key, unicode)
end