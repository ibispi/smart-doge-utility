function addTimers (amount)

	if timer == nil then--can only be run if it has not been defined yet
	
		timer = {}
		ALL_RUNNING_TIMERS = {}
		
		for thisTimer = 1, amount, 1 do
		
			timer[thisTimer] = { started = 0, finishes = 0, running =false, free = true }
			
			timer[thisTimer].start = function (howLong) 
				
				timer[thisTimer].free = false
			
				--starts counting for howLong
				timer[thisTimer].started = love.timer.getTime()
				
				timer[thisTimer].finishes = timer[thisTimer].started + howLong
				
				if timer[thisTimer].running == false then 
					timer[thisTimer].running = true
					--what the timer function does
					table.insert (ALL_RUNNING_TIMERS, thisTimer) 
				end
			end
		
		end
	
	end

end

return addTimers
