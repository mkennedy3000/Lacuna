-------------------
--[ Scene Class ]--
-------------------

Scene = {}

---------------------
--[ Scene Methods ]--
---------------------

function Scene:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Scene:loadScene()
end

function Scene:update(dt)
end

function Scene:draw()
end

function Scene:mousepressed(x, y, button)
end

function Scene:mousereleased(x, y, button)
end

function Scene:keypressed(key, unicode)
end

function Scene:keyreleased(key, unicode)
end

function Scene:focus(f)
end

function Scene:quit()
end