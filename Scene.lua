-------------------
--[ Scene Class ]--
-------------------

Scene = {}

---------------------
--[ Scene Methods ]--
---------------------

function Scene:new()
	o = {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Scene:loadScene()
	--Abstract--
end

function Scene:update()
	--Abstract--
end

function Scene:draw()
	--Abstract--
end