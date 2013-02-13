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
	self.quitButton = Button:new{ text = "QUIT", x = 200, y = 750 , align = "center",
								 callBack = function() love.event.quit() end}
end

function GameScene:update(dt)
	if self.grid.gameOver == 0 then
		self.grid:update(dt)
	end
	
	self.quitButton:update()
end

function GameScene:draw()
	self.grid:draw()
	
	if self.grid.gameOver == 1 then
		self.gameOverTitle = {
		text = "Game Over",
		size = 60,
		x = 0,
		y = 350, 
		align = "center",
		color = { r = 230, g = 230, b = 230 }
		}
		love.graphics.setColor(self.gameOverTitle.color.r, self.gameOverTitle.color.g, self.gameOverTitle.color.b)
		love.graphics.setNewFont(self.gameOverTitle.size)
		love.graphics.printf(self.gameOverTitle.text, self.gameOverTitle.x, self.gameOverTitle.y, 420, self.gameOverTitle.align)
	end
	
	self.quitButton:draw()
end

function GameScene:keypressed(key, unicode)
	if self.grid.gameOver == 0 then
		self.grid:keypressed(key, unicode)
	end
end