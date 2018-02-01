function drawStuff ()



	local w = love.graphics.getWidth()
	local h = love.graphics.getHeight()
	local totalRatio = 800/480
	ww = h*totalRatio
	if ww>w then
	while ww>w do
		ww=ww-0.1
	end
	hh=ww/totalRatio
	else hh = h end
	sx = ww/800
	sy = hh/480
	yy = (1-(hh/h))/2*h
	xx = (1-(ww/w))/2*w

		love.graphics.setBackgroundColor( 0, 0, 0 ) --back-background color


		love.graphics.setBlendMode('alpha', 'premultiplied')

		love.graphics.draw(awesomecanvas,xx,yy,0,sx,sy)
		--love.graphics.draw(awesomecanvas,0,0,0,zoom,zoom)
		--love.graphics.draw(buttonCanvas,0,0,0,zoom,zoom)
		love.graphics.draw(buttonCanvas,xx,yy,0,sx,sy)


		love.graphics.setColor( 255, 255, 255, 255 )
		love.graphics.setBlendMode('alpha', 'alphamultiply')
--[[temporarilyhere, this below
		love.graphics.setFont(randomfont)
		love.graphics.setColor(0,0,0,255)
    love.graphics.print(printMeThis, 10, 10)
		love.graphics.setColor(255,255,255,255)]]
end

return drawStuff
