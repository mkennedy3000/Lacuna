------------------
--[ Cube Class ]--
------------------

Cube = {
	color = 0
	image = love.graphics.newImage("Resources/darkBlueCube.png"),  --Just the default color for now
	pos = {},
	gridPos = { x = 10, y = 10},
}

--------------------
--[ Cube Methods ]--
--------------------

function Cube:new(color)
	o = {}
	o.pos = { x = 4, y = 0 }
	o.color = color
	o.image = "Resources/"
	if color == 1 then
		o.image = o.image .. "lightBlueCube.png"
	elseif color == 2 then
		o.image = o.image .. "orangeCube.png"
	elseif color == 3 then
		o.image = o.image .. "redOrangeCube.png"
	elseif color == 4 then
		o.image = o.image .. "yellowCube.png"
	else
		o.image = o.image .. "darkBlueCube.png"
	end
	o.image = love.graphics.newImage(o.image)
	
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
	if dir == "left" then
		self.pos.x = self.pos.x - 1
	elseif dir == "right" then
		self.pos.x = self.pos.x + 1
	elseif dir == "down" then
		self.pos.y = self.pos.y + 1
	end
end

