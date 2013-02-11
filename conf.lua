function love.conf(t)
	t.title = "Lacuna"
	t.author = "Mark Kennedy & Jack Sombeck"
	t.url = nil
	t.identity = "Lacuna"
	t.version = "0.8.0"
	t.console = false
	t.release = false
	t.screen.width = 620		
	t.screen.height = 820
	t.screen.fullscreen = false
	t.screen.vsync = true
	t.screen.fsaa = 0
	t.modules.joystick = false
	t.modules.audio = true
	t.modules.keyboard = true
	t.modules.event = true
	t.modules.image = true
	t.modules.graphics = true
	t.modules.timer = true
	t.modules.mouse = true
	t.modules.sound = true
	t.modules.physics = false
end