function initiatePopups ()

	popupTable = { changedTable = "bla", changedVar = "bla",

		elements = {

			[1] = "text",

		},
		x = 0, y = 0, width = 100--[[optional, otherwise it takes the width of
		the widest element]], height = 0, extraWidth = 0--[[additional width to the length of
		the widest element]], extraHeight = 0, upsideDown = false, color = {fill={255,255,255,255},
	line = {255,255,255,255}, text = {255,255,255,255}, selected = {20,20,20,255} },
	font = randomfont,
	shown = false, --[[this is not changed, it is false by default and true when shown
	on the screen]] disabledText = ""--[[this popup option is not shown]],
	initialButtonHeight = 30,

	}

	function popupDefine (changedTable, changedVar, elements, x, y, initialButtonHeight, width, height, disabledText, colorFill, colorLine, colorText, font)

		--for disabledText
		if disabledText ~= nil then
			popupTable.disabledText = disabledText
		end

		--for changedTable
		if changedTable ~= nil then
			popupTable.changedTable = changedTable
		end

		--for changedVar
		if changedVar ~= nil then
			popupTable.changedVar = changedVar
		end

		--for elements
		if elements ~= nil then
			local disabledTextSkipped = false
			for theElement = 1, #elements, 1 do
				popupTable.elements[theElement] = elements[theElement]
			end
		end

		--for initialButtonHeight
		if initialButtonHeight ~= nil then
			popupTable.initialButtonHeight = initialButtonHeight
		end

		--for x
		if x ~= nil then
			popupTable.x = x
		end
		--for y
		if y ~= nil then
			popupTable.y = y
		end
		--for width
		if width ~= nil then
			popupTable.width = width
		end

		--for width
		if height ~= nil then
			popupTable.height = height
		end

		--for colorFill
		if colorFill ~= nil then
			popupTable.color.fill = colorFill
		end

		--for colorLine
		if colorLine ~= nil then
			popupTable.color.line = colorLine
		end

		--for colorText
		if colorText ~= nil then
			popupTable.color.text = colorText
		end

		if font ~= nil then
			popupTable.font = font
		end

	end


	function popupCheck (xCursor, yCursor) --THIS HAS TO BE AT THE END OF ALL MOUSE CHECKS
		xCursor, yCursor = xCursor, yCursor

		local disabledTextSkipped = false
		if popupTable.shown == true then

			if popupTable.upsideDown == false then
				for theElement = 1, #popupTable.elements, 1 do
					if disabledTextSkipped == false then
						if popupTable.disabledText ~= popupTable.elements[theElement] then
							if xCursor >= popupTable.x and xCursor <= popupTable.x+popupTable.width and
							yCursor >= popupTable.y+popupTable.height*(theElement-1) and
							yCursor <= popupTable.y+popupTable.height*(theElement-1)+popupTable.height then
									popupTable.changedTable[popupTable.changedVar] = popupTable.elements[theElement]
									popupTable.shown = false
									save()
							end
						else
							disabledTextSkipped = true
						end
					else
						if xCursor >= popupTable.x and xCursor <= popupTable.x+popupTable.width and
						yCursor >= popupTable.y+popupTable.height*(theElement-2) and
						yCursor <= popupTable.y+popupTable.height*(theElement-2)+popupTable.height then
							love.graphics.setColor(popupTable.color.selected)
								popupTable.changedTable[popupTable.changedVar] = popupTable.elements[theElement]
								popupTable.shown = false
								save()
						end
					end
				end
			else
				for theElement = 1, #popupTable.elements, 1 do
					if disabledTextSkipped == false then
						if popupTable.disabledText ~= popupTable.elements[theElement] then
							if xCursor >= popupTable.x and xCursor <= popupTable.x+popupTable.width and
							yCursor >= popupTable.y-(popupTable.initialButtonHeight+popupTable.height*(theElement)) and
							yCursor <= popupTable.y-(popupTable.initialButtonHeight+popupTable.height*(theElement))+popupTable.height then
									popupTable.changedTable[popupTable.changedVar] = popupTable.elements[theElement]
									popupTable.shown = false
									save()
							end
						else
							disabledTextSkipped = true
						end
					else

						if xCursor >= popupTable.x and xCursor <= popupTable.x+popupTable.width and
						yCursor >= popupTable.y-(popupTable.initialButtonHeight+popupTable.height*(theElement-1)) and
						yCursor <= popupTable.y-(popupTable.initialButtonHeight+popupTable.height*(theElement-1))+popupTable.height then
								popupTable.changedTable[popupTable.changedVar] = popupTable.elements[theElement]
								popupTable.shown = false
								save()
						end
					end
				end
			end
		end
		--if popupTable.shown == true then popupTable.shown = false end
	end



--this is a problem because we need a custom if popupTable.shown == false then
--in the game's mouse checks... because this has to be drawn last but the
--mouse has to be detected first on this!
	function popupDraw (x, y) --THIS HAS TO BE AT THE END OF ALL MOUSE CHECKS
		xCursor, yCursor = x, y

		local disabledTextSkipped = false
		if popupTable.shown == true then
			love.graphics.setFont(popupTable.font)

			if popupTable.upsideDown == false then
				for theElement = 1, #popupTable.elements, 1 do
					if disabledTextSkipped == false then
						if popupTable.disabledText ~= popupTable.elements[theElement] then

							if xCursor >= popupTable.x and xCursor <= popupTable.x+popupTable.width and
							yCursor >= popupTable.y+popupTable.height*(theElement-1) and
							yCursor <= popupTable.y+popupTable.height*(theElement-1)+popupTable.height then
								love.graphics.setColor(popupTable.color.selected)
							else
								love.graphics.setColor(popupTable.color.fill)
							end
							love.graphics.rectangle('fill', popupTable.x, popupTable.y+popupTable.height*(theElement-1), popupTable.width, popupTable.height)
							love.graphics.setColor(popupTable.color.line)
							love.graphics.rectangle('line', popupTable.x, popupTable.y+popupTable.height*(theElement-1), popupTable.width, popupTable.height)
							love.graphics.setColor(popupTable.color.text)
							love.graphics.print(popupTable.elements[theElement], popupTable.x+5,
							popupTable.y+popupTable.extraHeight+popupTable.height*(theElement-1))
							love.graphics.setColor(255,255,255,255)
						else
							disabledTextSkipped = true
						end
					else

						if xCursor >= popupTable.x and xCursor <= popupTable.x+popupTable.width and
						yCursor >= popupTable.y+popupTable.height*(theElement-2) and
						yCursor <= popupTable.y+popupTable.height*(theElement-2)+popupTable.height then
							love.graphics.setColor(popupTable.color.selected)
						else
							love.graphics.setColor(popupTable.color.fill)
						end
						love.graphics.rectangle('fill', popupTable.x, popupTable.y+popupTable.height*(theElement-2), popupTable.width, popupTable.height)
						love.graphics.setColor(popupTable.color.line)
						love.graphics.rectangle('line', popupTable.x, popupTable.y+popupTable.height*(theElement-2), popupTable.width, popupTable.height)						love.graphics.setColor(popupTable.color.text)
						love.graphics.print(popupTable.elements[theElement], popupTable.x+5,
						popupTable.y+popupTable.extraHeight+popupTable.height*(theElement-2))
						love.graphics.setColor(255,255,255,255)
					end
				end
			else
				for theElement = 1, #popupTable.elements, 1 do
					if disabledTextSkipped == false then
						if popupTable.disabledText ~= popupTable.elements[theElement] then

								if xCursor >= popupTable.x and xCursor <= popupTable.x+popupTable.width and
							yCursor >= popupTable.y-(popupTable.initialButtonHeight+popupTable.height*(theElement)) and
							yCursor <= popupTable.y-(popupTable.initialButtonHeight+popupTable.height*(theElement))+popupTable.height then
								love.graphics.setColor(popupTable.color.selected)
							else
								love.graphics.setColor(popupTable.color.fill)
							end
							love.graphics.rectangle('fill', popupTable.x, popupTable.y-(popupTable.initialButtonHeight+popupTable.height*(theElement)), popupTable.width, popupTable.height)
							love.graphics.setColor(popupTable.color.line)
							love.graphics.rectangle('line', popupTable.x, popupTable.y-(popupTable.initialButtonHeight+popupTable.height*(theElement)), popupTable.width, popupTable.height)							love.graphics.setColor(popupTable.color.text)
							love.graphics.print(popupTable.elements[theElement], popupTable.x+5,
							popupTable.y-(popupTable.initialButtonHeight+popupTable.extraHeight+popupTable.height*(theElement)))
							love.graphics.setColor(255,255,255,255)
						else
							disabledTextSkipped = true
						end
					else

						if xCursor >= popupTable.x and xCursor <= popupTable.x+popupTable.width and
						yCursor >= popupTable.y-(popupTable.initialButtonHeight+popupTable.height*(theElement-1)) and
						yCursor <= popupTable.y-(popupTable.initialButtonHeight+popupTable.height*(theElement-1))+popupTable.height then
							love.graphics.setColor(popupTable.color.selected)
						else
							love.graphics.setColor(popupTable.color.fill)
						end
						love.graphics.rectangle('fill', popupTable.x, popupTable.y-(popupTable.initialButtonHeight+popupTable.height*(theElement-1)), popupTable.width, popupTable.height)
						love.graphics.setColor(popupTable.color.line)
						love.graphics.rectangle('line', popupTable.x, popupTable.y-(popupTable.initialButtonHeight+popupTable.height*(theElement-1)), popupTable.width, popupTable.height)						love.graphics.setColor(popupTable.color.text)
						love.graphics.print(popupTable.elements[theElement], popupTable.x+5,
						popupTable.y-(popupTable.initialButtonHeight+popupTable.extraHeight+popupTable.height*(theElement-1)))
						love.graphics.setColor(255,255,255,255)
					end
				end
			end
		end
	end

	function popupLaunch (upsideDown)
		if upsideDown ~= nil then
			popupTable.upsideDown = upsideDown
		end
		popupTable.shown = true
	end

	--in the draw part there should be a function that accumulates all the other
	--draw functions
end

return initiatePopups
