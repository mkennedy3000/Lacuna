----------------
--[ GameGrid ]--
----------------

require 'Cube'

GameGrid = {
	size = { w = 400, h = 800 },
	pos = { x = 10, y = 10},
	grid = {},
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
	local x, y
	for x = 1, 10 do
		self.grid[x] = {}
		for y = 1, 20 do
			self.grid[x][y] = 0
		end
	end
	
	--Test Cube--
	self.cubes[1] = Cube:new()
	self.grid[self.cubes[1].pos.x+1][self.cubes[1].pos.y+1] = 1
end

function GameGrid:update(dt)
	self.timePassed = self.timePassed + dt
	if self.timePassed >= self.updateRate then
		self.timePassed = self.timePassed - self.updateRate
		if self.cubes[#self.cubes].pos.y < ((self.size.h/40)-1) then
			self.grid[self.cubes[#self.cubes].pos.x+1][self.cubes[#self.cubes].pos.y+1] = 0
			self.cubes[#self.cubes]:move("down")
			self.grid[self.cubes[#self.cubes].pos.x+1][self.cubes[#self.cubes].pos.y+1] = 1
		else
			--Spawn New Block--
			self.cubes[#self.cubes + 1] = Cube:new()
		end
	end
end

function GameGrid:draw()
	--Draw Game Grid (just a white rect for now)--
	love.graphics.setColor(230, 230, 230)
	love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.size.w, self.size.h)
	
	--Draw Cubes--
	local i
	for i = 1, #self.cubes do
		self.cubes[i]:draw()
	end
end

function GameGrid:keypressed(key, unicode)
	--Move Test Cube--
	local dir = "none"
	
	if key == "left" or key == "a" then
		if self.cubes[#self.cubes].pos.x > 0 then
			self.grid[self.cubes[#self.cubes].pos.x+1][self.cubes[#self.cubes].pos.y+1] = 0
			dir = "left"
		end
	elseif key == "right" or key == "d" then
		if self.cubes[#self.cubes].pos.x < ((self.size.w/40)-1) then
			self.grid[self.cubes[#self.cubes].pos.x+1][self.cubes[#self.cubes].pos.y+1] = 0
			dir = "right"
		end
	elseif key == "down" or key == "s" then
		if self.cubes[#self.cubes].pos.y < ((self.size.h/40)-1) then
			self.grid[self.cubes[#self.cubes].pos.x+1][self.cubes[#self.cubes].pos.y+1] = 0
			dir = "down"
		end
	end
	
	self.cubes[#self.cubes]:move(dir)
	self.grid[self.cubes[#self.cubes].pos.x+1][self.cubes[#self.cubes].pos.y+1] = 1
end