-----------------------
--[ MenuScene Class ]--
-----------------------

require 'Scene'
require 'GameScene'
require 'Button'

MenuScene = Scene:new()

-------------------------
--[ MenuScene Methods ]--
-------------------------

function MenuScene:loadScene()
	--Create Title--
	self.title = {
		text = "LACUNA",
		size = 64,
		x = 0,
		y = 100, 
		align = "center",
		color = darkBlue
	}
	
	--Create Play Button--
	local playPushed = function()
		Director:changeToScene( GameScene:new() )
	end
	self.playButton = Button:new{ text = "PLAY", y = 400 , callBack = playPushed}
	
	--Create Quit Button--
	self.quitButton = Button:new{ text = "QUIT", y = 460 , callBack = function() love.event.quit() end}
	
end

function MenuScene:update()
	self.playButton:update()
	self.quitButton:update()
end

function MenuScene:draw()
	--Draw Background--
	love.graphics.setBackgroundColor(yellow.r, yellow.g, yellow.b)
	
	--Draw Title--
	love.graphics.setColor(self.title.color.r, self.title.color.g, self.title.color.b)
	love.graphics.setNewFont(self.title.size)
	love.graphics.printf(self.title.text, self.title.x, self.title.y, screenSize.w, self.title.align)
	
	--Draw Buttons--
	self.playButton:draw()
	self.quitButton:draw()
end