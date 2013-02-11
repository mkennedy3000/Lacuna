------------------
--[ Cube Class ]--
------------------

Cube = {
	image = love.graphics.newImage("Resources/darkBlueCube.png"),  --Just the default color for now
	pos = { x = 4, y = 0 },
	gridPos = { x = 0, y = 0},
}

--------------------
--[ Cube Methods ]--
--------------------

function Cube:new(--[[color will go here]])
	o = {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Cube:draw()
	local x = (self.gridPos.x + (self.pos.x * 40))
	local y = (self.gridPos.y + (self.pos.y * 40))
	
	love.graphics.draw( self.image, x, y )
end

function Cube:move(dir)
	if dir == 'left' then
		self.pos.x = self.pos.x - 1
	elseif dir == 'right' then
		self.pos.x = self.pos.x + 1
	elseif dir == 'down' then
		self.pos.y = self.pos.y + 1
	end
end

