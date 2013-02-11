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
	
	updateRate = 0.5,
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
	self.timePassed = self.timePassed + dt
	if self.timePassed >= self.updateRate then
		self.timePassed = self.timePassed - self.updateRate
		if self.cubes[1].pos.y < ((self.size.h/40)-1) then
			self.cubes[1]:move("down")
		end
	end
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
	local dir = "none"
	
	if key == "left" or key == "a" then
		if self.cubes[1].pos.x > 0 then
			dir = "left"
		end
	elseif key == "right" or key == "d" then
		if self.cubes[1].pos.x < ((self.size.w/40)-1) then
			dir = "right"
		end
	elseif key == "down" or key == "s" then
		if self.cubes[1].pos.y < ((self.size.h/40)-1) then
			dir = "down"
		end
	end
	
	self.cubes[1]:move(dir)
end