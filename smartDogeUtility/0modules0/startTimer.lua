function startTimer (seconds)

	for o = 1, #timer, 1 do 
	
		if timer[o].free == true then
			timer[o].free = false
			timer[o].start(seconds)
			return o
		end
	
	end

end

return startTimer
