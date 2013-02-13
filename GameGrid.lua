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
	
	gameOver = 0,
	
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
	
	love.keyboard.setKeyRepeat(0.25,0.05)
	math.randomseed( os.time() )
	
	--Spawn New Block--
	self:spawnBlock()
end

function GameGrid:update(dt)
	local dir = "none"
	local x = self.cubes[#self.cubes].pos.x
	local y = self.cubes[#self.cubes].pos.y
	self.timePassed = self.timePassed + dt
	
	if self.timePassed >= self.updateRate then
		self.timePassed = self.timePassed - self.updateRate
		if y < ((self.size.h/40)-1) then
			self.grid[x+1][y+1] = 0
			dir = self:checkIfBlock(x, y, "down")
		end
		
		if dir == "down" then
			self.cubes[#self.cubes]:move(dir)
			self.grid[self.cubes[#self.cubes].pos.x+1][self.cubes[#self.cubes].pos.y+1] = 1
		else
			--Spawn New Block--
			self.grid[self.cubes[#self.cubes].pos.x+1][self.cubes[#self.cubes].pos.y+1] = 1
			self:spawnBlock()
		end
	end
end

function GameGrid:draw()
	--Draw Game Grid (just a white rect for now)--
	if self.gameOver == 1 then
		love.graphics.setColor(100, 100, 100)
	else
		love.graphics.setColor(230, 230, 230)
	end
	
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
	local x = self.cubes[#self.cubes].pos.x
	local y = self.cubes[#self.cubes].pos.y
	
	if key == "left" or key == "a" then
		if x > 0 then
			self.grid[x+1][y+1] = 0
			dir = self:checkIfBlock(x, y, "left")
		end
	elseif key == "right" or key == "d" then
		if x < ((self.size.w/40)-1) then
			self.grid[x+1][y+1] = 0
			dir = self:checkIfBlock(x, y, "right")
		end
	elseif key == "down" or key == "s" then
		if y < ((self.size.h/40)-1) then
			self.grid[x+1][y+1] = 0
			dir = self:checkIfBlock(x, y, "down")
		end
	end
	
	self.cubes[#self.cubes]:move(dir)
	self.grid[self.cubes[#self.cubes].pos.x+1][self.cubes[#self.cubes].pos.y+1] = 1
end

function GameGrid:spawnBlock()
	--Check if GameOver--
	local x
	for x = 1, 10 do
		if self.grid[x][1] == 1 then
			--GameOver--
			self.gameOver = 1
		end
	end
	
	if self.gameOver == 0 then
		--Pick Random Color--
		local color = math.random(0, 4)
	
		--Make Cubes for now--
		local b = Cube:new(color)
		table.insert(self.cubes, b)
		self.grid[self.cubes[#self.cubes].pos.x+1][self.cubes[#self.cubes].pos.y+1] = 1
	end
end

--Returns direction to move--
function GameGrid:checkIfBlock(x, y, dir)
	local v = dir
	
	if dir == "left" then
		if self.grid[x][y+1] == 1 then
			v = "none"
		end
	elseif dir == "right" then
		if self.grid[x+2][y+1] == 1 then
			v = "none"
		end
	elseif dir == "down" then
		if self.grid[x+1][y+2] == 1 then
			v = "none"
		end
	end
	
	return v
end