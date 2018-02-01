function timerCheck (timestep)

	if timer ~= nil and ALL_RUNNING_TIMERS ~= nil then--can only be run if it has not been defined yet

		local currentTime = love.timer.getTime()

		for w = #ALL_RUNNING_TIMERS, 1 , -1 do

			if currentTime >= timer[ALL_RUNNING_TIMERS[w]].finishes then
				timer[ALL_RUNNING_TIMERS[w]].free = true
				timer[ALL_RUNNING_TIMERS[w]].running = false

				table.remove (ALL_RUNNING_TIMERS, w)

			end

		end

	end

end

return timerCheck
