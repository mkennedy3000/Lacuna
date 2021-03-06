--------------------
--[ Button Class ]--
--------------------

Button = {
	text = "Button",
	font = love.graphics.newFont(32),
	x = 0,
	y = 400, 
	align = "center",
	color = { r = 191, g = 56, b = 26 }, --RedOrange
	hoverColor = { r = 10, g = 34, b = 78 }, --DarkBlue
	pressedColor = { r = 160, g = 216, b = 241 }, --LightBlue
	hitBox = { w = 100, h = 40 },
	callBack = function() end --placeholder
}

--------------------------------
--[ Private Helper Functions ]--
--------------------------------


----------------------
--[ Button Methods ]--
----------------------

function Button:new (o)
	o = o or {}		--create table if user does not provide one
	
	--Initialize Variables--
	o.hoverOver = false
	o.pressed = false
	
	setmetatable(o, self)
	self.__index = self
	return o
end

function Button:update(dt)
	--Check if mouse is hovering over button--
	local x, y = love.mouse.getPosition()

	if self.align == "center" then
		if x >= (screenSize.w/2) - (self.hitBox.w/2) + self.x and
		   x <= (screenSize.w/2) + (self.hitBox.w/2) + self.x and
		   y >= self.y and
		   y <= self.y+self.hitBox.h then
			self.hoverOver = true
		else
			self.hoverOver = false
		end
	elseif self.align == "right" then
		if x >= (screenSize.w) - (self.hitBox.w) + self.x and
		   x <= (screenSize.w) + self.x and
		   y >= self.y and
		   y <= self.y+self.hitBox.h then
			self.hoverOver = true
		else
			self.hoverOver = false
		end
	end
	
	--Check for button presses--
	if love.mouse.isDown("l") then
		if self.hoverOver then
			self.pressed = true
		else
			self.pressed = false
		end
		
	--Check for button releases--
	else
		if self.pressed then
			--Button Clicked--
			self.pressed = false
			self.callBack()
		end
	end
end

function Button:draw()
	if self.hoverOver == true then
		if not self.pressed then
			love.graphics.setColor(self.hoverColor.r, self.hoverColor.g, self.hoverColor.b)
		else
			love.graphics.setColor(self.pressedColor.r, self.pressedColor.g, self.pressedColor.b)
		end
		if self.align == "center" then
			love.graphics.rectangle("fill", (screenSize.w/2)-(self.hitBox.w/2)+self.x, self.y, self.hitBox.w, self.hitBox.h)
		elseif self.align == "right" then
			love.graphics.rectangle("fill", ((screenSize.w)-(self.hitBox.w)+self.x), self.y, self.hitBox.w, self.hitBox.h)
		end
	end
	
	love.graphics.setColor(self.color.r, self.color.g, self.color.b)
	love.graphics.setFont(self.font)
	love.graphics.printf(self.text, self.x, self.y, screenSize.w, self.align)
end