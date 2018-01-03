function starterpack ()
--------------------------------------------------------------------------------
	sprite = {} users={} char={} map = {} input = {} --char_list = {}
	universalclock = {}
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--LIBRARIES
	addTimers = require "0modules0.addTimers" addTimers(100)-- this function is run only once
	timerCheck = require "0modules0.timerCheck" --this is among the love.update loops in main.lua
	startTimer = require "0modules0.startTimer"

	initiatePopups = require "0modules0.initiatePopups" initiatePopups()

	tween = require "0modules0.0libraries0.tween.tween"
--SCREEN_RELATED
	cam = require "0modules0.screen_related.camera"
	windowstretching = require "0modules0.screen_related.windowstretcher"
	drawStuff = require "0modules0.screen_related.drawStuff"
--INPUT_RELATED
	checkPage = require "0modules0.check_page"

--------------------------------------------------------------------------------
animationCanvas = {width = 800, height = 480}
--------------------------------------------------------------------------------
	--these are defined here in case player plays in a non scaling windowstrech
	sx=1 sy=1 xx=0 yy=0 ww=0 hh=0
    --this here are the key press booleans
buttonList = {

}
function addButton (namez, xxxx, yyyy, widthhh, heighttt)
	local thereIsOne = false
	for afszz = #buttonList, 1, -1 do
		if buttonList[afszz][1] == namez then
			if buttonList[afszz][2] == xxxx and
			buttonList[afszz][3] == yyyy and
			buttonList[afszz][4] == widthhh and
			buttonList[afszz][5] == heighttt then
				thereIsOne = true
			end
		end
	end
	if thereIsOne == false then

		for afszz = #buttonList, 1, -1 do
			if buttonList[afszz][1] == namez then
				table.remove(buttonList, afszz)
			end
		end

		table.insert (buttonList, {namez, xxxx, yyyy, widthhh, heighttt})
	end
end

	color_change_shader = [[
	extern vec4 colors;

	vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
	{
	    vec4 texcolor = Texel(texture, texture_coords); // This reads a color from our texture at the coordinates LOVE gave us (0-1, 0-1)

	    return texcolor*colors;
	}]]

	color_change = love.graphics.newShader (color_change_shader)

	picking = { anipartId = 0, type = "sprite"}
	picking.anipartId =0

	lastAnipartBeforeAnimation = 0 --this is used so the last anipart before you click "play" is selected after the animation stops

	choosingPositionFor = "anipart" --it can also be "sprite offset" or "character origin", by default it's "anipart"

	--offsetIsBeingSet = false --for when you click on the offset button

	particleSystemTemplate = { emissionRate = 100, speed = {min = 0, max = 0}, sizeVariation = 0, rotation = {min = 0, max = 0},
	relativeRotation = false, spin = {min = 0, max = 0}, spinVariation =0,
	particleLifetime = {min = 0, max = 1}, emitterLifetime = -1, spread = 5, linearDamping = {min = 0, max = 0}, linearAcceleration = {xmin = 0, ymin = 0, xmax = 0, ymax = 0},
	radialAcceleration = {min = 0, max = 0}, tangentialAcceleration = {min = 0, max = 0}, areaSpread = { distribution="none", dx=0, dy=0 },
	colors = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	sizes = {0,0,0,0,0,0,0,0}, insertMode = "top", bufferSize = 100000, offset = {x=0, y=0}, name = "defaultPS" }


	canStop = false

	selectedForScaling = "" --in case you want to scale just x or y

	upScrollFileAppear = false
	downScrollFileAppear = false

  rightScrollFramesAppear = false
	leftScrollFramesAppear = false

	upScrollAnipartsAppear = false
	downScrollAnipartsAppear = false

	upScrollCharactersAppear = false
	downScrollCharactersAppear = false

	upCharScrollLocation = {x = 0, y = 0}
	downCharScrollLocation = {x= 0, y = 0}

	upScrollLocation = { x= 0, y= 0}
	downScrollLocation = { x= 0, y= 0}

	moveSpeedPercentage = 0.01
	editingFrame = 0
	editingCharacterLabel = 0
	editingAnipartLabel = 0
	editingAnipartOpacity = 0

	leftMouseUndoDone = false
	previousValues = {0, 0} --used for storing variables for the undo/redo function

	colorsForSelectedVariables = {228,0,0}
	leftMousePressed = false
	rightMousePressed = false

	textInputEnabled = false

	keyf11pressed = false
	jpressed = false
	kpressed = false
	ipressed = false
	opressed = false
	asteriskpressed = false
	gravepressed = false

	downpressed = false
	uppressed = false
	leftpressed = false
	rightpressed = false

	npressed = false
	mpressed = false
	pluspressed = false
	minuspressed = false
	tabpressed = false
	hpressed = false
	spacepressed = false
	f1pressed = false

	enterPressed = false
	backspacePressed = false

	stopAnimating = false
	animationRunning = false
	animationTriggered = false
	memo = {{}}--AND THIS HAS TO CHANGED
	tnt = {{}}--THIS HAS TO BE CHANGED EVERY TIME YOU ADD A CHARACTER
	tntcomplete = {{}}--AND THIS HAS TO BE CHANGED TOO
	colorTween = {{}}
	particleTween = {{}}
	--main measurement for the entire game, the size of a tile
	m=64
	awesomecanvas = love.graphics.newCanvas(animationCanvas.width, animationCanvas.height)
	awesomecanvas:setFilter('nearest', 'nearest')
	love.graphics.setDefaultFilter( 'nearest', 'nearest', 0 )

	buttonCanvas = love.graphics.newCanvas(animationCanvas.width, animationCanvas.height)
	awesomecanvas:setFilter('nearest', 'nearest')
	love.graphics.setDefaultFilter( 'nearest', 'nearest', 0 )
--------------------------------------------------------------------------------
	--[[setting for whether or not when resizing window game stretches or
	leaves a black border; 0 for black border;1 for stretch;2 for aspect ratio]]
	windowstretch = 2
	local a  = love.graphics.getWidth()
	local b = love.graphics.getHeight()
	love.window.setMode( animationCanvas.width, animationCanvas.height, {fullscreen =false, fullscreentype="desktop",
	vsync=false,msaa=0,resizable = true,borderless = false,centered = true,
	display = 1,minwidth=0,minheight=0,highdpi=false} )
	fullscren=false
	--read the settingfile and check if default mode is true or false
	--if default mode is true don't do anything if it's false
	--load the custom settings from before
		--create the canvas and set the filter to nearest neighbor
--------------------------------------------------------------------------------
	--draws important variables
	randomfont = love.graphics.newFont( "LiberationSans-Regular.ttf", 36 )
	smallerFont = love.graphics.newFont( "LiberationSans-Regular.ttf", 24 )
	ticketFont = love.graphics.newFont( "LiberationSans-Regular.ttf", 20 )
	evenSmallerFont = love.graphics.newFont( "LiberationSans-Regular.ttf", 14 )
	love.graphics.setFont(randomfont)
end
return starterpack
