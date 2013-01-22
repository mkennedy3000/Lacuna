require 'menuScene'
require 'gameScene'

function loadScene(scene)
	if scene == "menu" then
		loadMenu()
	end
end

function updateScene(scene)
	if scene == "menu" then
		updateMenu()
	end
end

function drawScene(scene)
	if scene == "menu" then
		drawMenu()
	end
end

function changeToScene(scene)
	if scene == "menu" then
		loadMenu()
		delete(currentScene)
		currentScene = "menu"
	end
end

function delete(scene)
	if scene == "menu" then
		deleteMenu()
	end
end