function add_image ()
	
	for zz = 1, #anipart, 1 do 
		local location = "sprites/"..anipart[zz].image.data..".png"
		anipart[zz].image.data = love.graphics.newImage (location)
	end
		
end

return add_image
