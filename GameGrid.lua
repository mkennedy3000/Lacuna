----------------
--[ GameGrid ]--
----------------

require 'Cube'

GameGrid = {
	size = { w = 400, h = 800 },
	pos = { x = 0, y = 0},
	rods = {},
	cubes = {},
	block = {},
	numBlocksCleared = 0,
	
	updateRate = 1.0,
	timePassed = 0.0,
}

------------------------
--[ GameGrid Methods ]--
------------------------

function GameGrid:new()
	o = {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function GameGrid:loadGameGrid()
	--Load with correct level... ect.--
	--Test Cube--
	self.cubes[1] = Cube:new()
end

function GameGrid:update(dt)
	
end

function GameGrid:draw()
	--Draw Game Grid (just a white rect for now)--
	love.graphics.setColor(230, 230, 230)
	love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.size.w, self.size.h)
	
	--Draw Test Cube--
	self.cubes[1]:draw()
end

function GameGrid:keypressed(key, unicode)
	--Move Test Cube--
	self.cubes[1]:move(key)
end