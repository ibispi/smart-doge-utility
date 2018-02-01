--Copyright 2017 Ibispi

--the main file

function love.load()

	xCursor = 0
	yCursor = 0

	reenablePossible = 0 --for the reenable button to  be shown

	addClickingBoxes = true

	clickingBox = {
	}
--[[
	local aNewClickingBox = {
		x1 = xDistance,
		x2 = whichIsBigger,--this will be just the additions to the 1s
		y1 = whereToY,
		y2 = boxHeight,--this will be just the additions to the 1s
		keyboardTarget = "name",
		keyboardClipboard = theGoal.name,
		keyboardTable = theGoal,
		somethingElse = "",
		where = "theGoalEditing"
	}
	table.insert(clickingBox,aNewClickingBox)
]]
	printMeThis = ""
-- things to do:
	--[[

	2.draw a smartdoge icon for the program and make the github page with the doge painting


	3.undo/redo with extra save slots
	4.copy/paste with addingDumbgoal/addingSmartgoal


	6. figure out how to transfer the save file from computer to phone and vice versa

	]]



	function load()

		if love.filesystem.exists("smartDogeSaveFile") then

			local savingNewline = "~~n~"
			local levelTwoGoalLine = "~~2~"
			local levelThreeGoalLine = "~~3~"
			local savingSpace = "~~s~"

			local contents, size = love.filesystem.read("smartDogeSaveFile")


			for theGoalGroup in string.gmatch(contents, "~~goals~(.-)~~ticketInventory~") do

				--everything goal related
				for goals in string.gmatch(theGoalGroup, "(.-)"..savingNewline) do
					--each goal of the level

					local whichGoal = 1
					local elementNum = 0
					local tableType = "broad"
					for insideGoals in string.gmatch(goals, "(.-)"..savingSpace) do
						--inside goals are parts of each individual goal
						elementNum=elementNum+1

						if elementNum == 1 then--type
							if insideGoals == "broad" then
								tableType = "broad"

								--do inner loops.. or not???
							elseif insideGoals == "specific" then
								tableType = "specific"
							end
						elseif elementNum == 2 then
								if insideGoals == "~~1~" then
									addGoal(tableType, goal)
									whichGoal = goal[#goal]
								elseif insideGoals == "~~2~" then
									addGoal(tableType, goal[#goal].goal)
									whichGoal = goal[#goal].goal[#goal[#goal].goal]
								elseif insideGoals == "~~3~" then
									addGoal(tableType, goal[#goal].goal[#goal[#goal].goal].goal)
									whichGoal = goal[#goal].goal[#goal[#goal].goal].goal[#goal[#goal].goal[#goal[#goal].goal].goal]
								end
						elseif elementNum == 3 then --name
							whichGoal.name = insideGoals
						elseif elementNum == 4 then --description
							whichGoal.description = insideGoals
						elseif elementNum == 5 then --ticketAmount
							insideGoals = tonumber(insideGoals)
							whichGoal.ticketAmount = insideGoals
						elseif elementNum == 6 then --measurement.amountTotal --mandatoryBy.year
							if tableType == "specific" then
								insideGoals = tonumber(insideGoals)
								whichGoal.measurement.amountTotal = insideGoals
							elseif tableType == "broad" then
							insideGoals = tonumber(insideGoals)
							whichGoal.mandatoryBy.year = insideGoals
							end
						elseif elementNum == 7 then --measurement.aproxAmountPerSession --mandatoryBy.month
							if tableType == "specific" then
								insideGoals = tonumber(insideGoals)
								whichGoal.measurement.aproxAmountPerSession = insideGoals
							elseif tableType == "broad" then
							insideGoals = tonumber(insideGoals)
							whichGoal.mandatoryBy.month = insideGoals
							end
						elseif elementNum == 8 then --measurement.doneSoFar  --mandatoryBy.day
							if tableType == "specific" then
								insideGoals = tonumber(insideGoals)
								whichGoal.measurement.doneSoFar = insideGoals
							elseif tableType == "broad" then
							insideGoals = tonumber(insideGoals)
							whichGoal.mandatoryBy.day = insideGoals
							end
						elseif elementNum == 9 then --measurement.measurement --mandatoryBy.hour
							if tableType == "specific" then
								whichGoal.measurement.measurement = insideGoals
							elseif tableType == "broad" then
							insideGoals = tonumber(insideGoals)
							whichGoal.mandatoryBy.hour = insideGoals
							end
						elseif elementNum == 10 then --aproxTime.amount --mandatoryBy.min
							if tableType == "specific" then
								insideGoals = tonumber(insideGoals)
								whichGoal.aproxTime.amount = insideGoals
							elseif tableType == "broad" then
							insideGoals = tonumber(insideGoals)
							whichGoal.mandatoryBy.min = insideGoals
							end
						elseif elementNum == 11 then --aproxTime.measurement --partlyCompleted
							if tableType == "specific" then
								whichGoal.aproxTime.measurement = insideGoals
							elseif tableType == "broad" then
								theBool = false
								if insideGoals == "true" then theBool = true end
								whichGoal.partlyCompleted = theBool
							end
						elseif elementNum == 12 then --mandatoryBy.year --fullyCompleted
							if tableType == "specific" then
								insideGoals = tonumber(insideGoals)
								whichGoal.mandatoryBy.year = insideGoals
							elseif tableType == "broad" then
								theBool = false
								if insideGoals == "true" then theBool = true end
								whichGoal.fullyCompleted = theBool
							end
						elseif elementNum == 13 then  --mandatoryBy.month
								insideGoals = tonumber(insideGoals)
								whichGoal.mandatoryBy.month = insideGoals
						elseif elementNum == 14 then  --mandatoryBy.day
								insideGoals = tonumber(insideGoals)
								whichGoal.mandatoryBy.day = insideGoals
						elseif elementNum == 15 then  --mandatoryBy.hour
								insideGoals = tonumber(insideGoals)
								whichGoal.mandatoryBy.hour = insideGoals
						elseif elementNum == 16 then  --mandatoryBy.min
							insideGoals = tonumber(insideGoals)
							whichGoal.mandatoryBy.min = insideGoals
						elseif elementNum == 17 then --partlyCompleted
							theBool = false
							if insideGoals == "true" then theBool = true end
							whichGoal.partlyCompleted = theBool
						elseif elementNum == 18 then --fullyCompleted
							theBool = false
							if insideGoals == "true" then theBool = true end
							whichGoal.fullyCompleted = theBool
						end


					end
				end
			end


			for ticketGroup in string.gmatch(contents, "~~ticketInventory~(.-)~~ticketVault~") do

				--everything goal related
				for ticketGroups in string.gmatch(ticketGroup, "(.-)"..savingNewline) do
					--each goal of the level

					local elementNum = 0
					if #ticketInventory == 0 then
						ticketInventory[1] = { name = "", allows = {amount = 1, measurement = "bla"},
					amount = 1}
					else
						ticketInventory[#ticketInventory+1] = { name = "", allows = {amount = 1, measurement = "bla"},
					amount = 1}
					end

					for insideTickets in string.gmatch(ticketGroups, "(.-)"..savingSpace) do
						elementNum = elementNum + 1
						if elementNum == 1 then
							ticketInventory[#ticketInventory].name = insideTickets
						elseif elementNum == 2 then
							insideTickets = tonumber(insideTickets)
							ticketInventory[#ticketInventory].allows.amount = insideTickets
						elseif elementNum == 3 then
							ticketInventory[#ticketInventory].allows.measurement = insideTickets
						elseif elementNum == 4 then
							insideTickets = tonumber(insideTickets)
							ticketInventory[#ticketInventory].amount = insideTickets
						end
					end
				end
			end

			for ticketGroup in string.gmatch(contents, "~~ticketVault~(.-)~~end~") do --IF YOU WANT TO ADD MORE TO
											--THE SAVING YOU HAVE TO ADD THE NEW CATEGORY HERE BY COMBINING IT WITH THIS
											-- STRING LIKE THIS "~~ticketVault~(.-)~~newCategoryName~"

				--everything goal related
				for ticketGroups in string.gmatch(ticketGroup, "(.-)"..savingNewline) do
					--each goal of the level

					local elementNum = 0
					addTicketToVault()
					for insideTickets in string.gmatch(ticketGroups, "(.-)"..savingSpace) do
						elementNum = elementNum + 1
						if elementNum == 1 then
							ticketVault[#ticketVault].name = insideTickets
						elseif elementNum == 2 then
							insideTickets = tonumber(insideTickets)
							ticketVault[#ticketVault].allows.amount = insideTickets
						elseif elementNum == 3 then
							ticketVault[#ticketVault].allows.measurement = insideTickets
						elseif elementNum == 4 then
							insideTickets = tonumber(insideTickets)
							ticketVault[#ticketVault].rarityHandicap = insideTickets
						end
					end
				end
			end

		else

			local clickHereTask = {
			goal = {--[[loops]]},
			type = "broad",
			name = "click here!",
			description = "Welcome to smartDogeUtility! These goals are just merely examples of how smartDogeUtility can be used, you can set whatever goals you want for yourself. Just remember not to do unproductive things that make you feel good unless you have the appropriate ticket! (You can add tickets to the ticket pool by clicking on Tickets > Ticket Pool) The example goals should be deleted by clicking the delete button.",
			ticketAmount = 0,
			tracking = { percentage = 0.0, sessionsTillFinished=0, measurementTimeTillFinished = "s."--[[calculated based on measurement and aproxTime OF ITS INNER GOALS!!!]]},
			mandatoryBy = {year = 9999, month = 6, day = 23, hour = 15, min = 30, roughlyIn = {amount = 0, measurement = "days"}, },--[[this sets mandatory by to all the inside goals and is set to be earlier if one of the inside goals is earlier]]
			partlyCompleted = false--[[this is for when a task is completed for a day for example and then you reenable it the next day]],
			fullyCompleted = false, --[[when 100% of the task is completed, it can still be reenabled if need be]]}


			local healthTask = { goal = {--[[loops]]
				{type = "specific",
				name = "exercises",
				ticketAmount = 1,
				description = "After 10 sessions of this and all the sessions of the jogging goal you would get awarded with 5 tickets from the health dumb goal!",
				tracking = { percentage = 0.0, sessionsTillFinished=0, measurementTimeTillFinished = "s."--[[number of sessions]]},
				measurement = {amountTotal=10, aproxAmountPerSession = 1, sessionPercentage = 0.0, doneSoFar = 0, measurement = "exercise" --[[calculates percentage and how much more is needed]]},
				aproxTime = { amount = 40, measurement = "min"},
				mandatoryBy = {year = 9999, month = 6, day = 23, hour = 15, min = 30, roughlyIn = {amount = 0, measurement = "days"},},
				partlyCompleted = false--[[this is for when a task is completed for a day for example and then you reenable it the next day]],
				fullyCompleted = false, --[[when 100% of the task is completed, it can still be reenabled if need be]]},

				{type = "specific",
				name = "jogging",
				ticketAmount = 1,
				description = "After 10 sessions of this and all the sessions of the jogging goal you would get awarded with 5 tickets from the health dumb goal!",
				tracking = { percentage = 0.0, sessionsTillFinished=0, measurementTimeTillFinished = "s."--[[number of sessions]]},
				measurement = {amountTotal=10, aproxAmountPerSession = 2, sessionPercentage = 0.0, doneSoFar = 0, measurement = "miles" --[[calculates percentage and how much more is needed]]},
				aproxTime = { amount = 30, measurement = "min"},
				mandatoryBy = {year = 9999, month = 6, day = 23, hour = 15, min = 30, roughlyIn = {amount = 0, measurement = "days"},},
				partlyCompleted = false--[[this is for when a task is completed for a day for example and then you reenable it the next day]],
				fullyCompleted = false, --[[when 100% of the task is completed, it can still be reenabled if need be]]}

		--[[loopsendshere]]},
			type = "broad",
			name = "health",
			description = "These are various tasks to improve your health and well-being. By completing the requirements of all the tasks you get rewarded by 5 extra tickets from this dumb goal! And then you cn just re-enable the tasks and keep on with improving your health!",
			ticketAmount = 5,
			tracking = { percentage = 0.0, sessionsTillFinished=0, measurementTimeTillFinished = "s."--[[calculated based on measurement and aproxTime OF ITS INNER GOALS!!!]]},
			mandatoryBy = {year = 9999, month = 6, day = 23, hour = 15, min = 30, roughlyIn = {amount = 0, measurement = "days"}, },--[[this sets mandatory by to all the inside goals and is set to be earlier if one of the inside goals is earlier]]
			partlyCompleted = false--[[this is for when a task is completed for a day for example and then you reenable it the next day]],
			fullyCompleted = false, --[[when 100% of the task is completed, it can still be reenabled if need be]]}

			local everydayTask =
				{type = "specific",
				name = "everyday task",
				ticketAmount = 1,
				description = "It's useful to have an undefined goal you can just use to reward yourself with tickets. Some tasks can appear out of nowhere and you may not have enough time to plan them out but are still worthy a ticket.",
				tracking = { percentage = 0.0, sessionsTillFinished=0, measurementTimeTillFinished = "s."--[[number of sessions]]},
				measurement = {amountTotal=999998, aproxAmountPerSession = 0, sessionPercentage = 0.0, doneSoFar = 0, measurement = "..." --[[calculates percentage and how much more is needed]]},
				aproxTime = { amount = 1, measurement = "hours"},
				mandatoryBy = {year = 9999, month = 6, day = 23, hour = 15, min = 30, roughlyIn = {amount = 0, measurement = "days"},},
				partlyCompleted = false--[[this is for when a task is completed for a day for example and then you reenable it the next day]],
				fullyCompleted = false, --[[when 100% of the task is completed, it can still be reenabled if need be]]}


			local writeANovelGoal = { goal = {--[[loops]]
			{goal = {--[[loops]]

			{type = "specific",
			name = "fiction-books",
			ticketAmount = 7,
			description = "For example, you could be measuring the progress of the research on the other fictional works on this topic or of this setting based on the number of books/sources read.",
			tracking = { percentage = 0.0, sessionsTillFinished=0, measurementTimeTillFinished = "s."--[[number of sessions]]},
			measurement = {amountTotal=10, aproxAmountPerSession = 1, sessionPercentage = 0.0, doneSoFar = 0, measurement = "sources" --[[calculates percentage and how much more is needed]]},
			aproxTime = { amount = 7, measurement = "days"},
			mandatoryBy = {year = 9999, month = 6, day = 23, hour = 15, min = 30, roughlyIn = {amount = 0, measurement = "days"},},
			partlyCompleted = false--[[this is for when a task is completed for a day for example and then you reenable it the next day]],
			fullyCompleted = false, --[[when 100% of the task is completed, it can still be reenabled if need be]]},

			{type = "specific",
			name = "nonfiction-p.",
			ticketAmount = 1,
			description = "And that you are measuring your progress on non-fiction research by the amount of pages read.",
			tracking = { percentage = 0.0, sessionsTillFinished=0, measurementTimeTillFinished = "s."--[[number of sessions]]},
			measurement = {amountTotal=1000, aproxAmountPerSession = 20, sessionPercentage = 0.0, doneSoFar = 0, measurement = "pages" --[[calculates percentage and how much more is needed]]},
			aproxTime = { amount = 1, measurement = "hours"},
			mandatoryBy = {year = 9999, month = 6, day = 23, hour = 15, min = 30, roughlyIn = {amount = 0, measurement = "days"},},
			partlyCompleted = false--[[this is for when a task is completed for a day for example and then you reenable it the next day]],
			fullyCompleted = false, --[[when 100% of the task is completed, it can still be reenabled if need be]]},

		},
			type = "broad",
			name = "do research",
			description = "Let's say you are writing a historical novel, one of the parts of this process will be to conduct research on the topic or the setting you are writing about.",
			ticketAmount = 1,
			tracking = { percentage = 0.0, sessionsTillFinished=0, measurementTimeTillFinished = "s."},
			mandatoryBy = {year = 9999, month = 6, day = 23, hour = 15, min = 30, roughlyIn = {amount = 0, measurement = "days"}, },
			partlyCompleted = false,
			fullyCompleted = false, },

			{type = "specific",
			name = "words written",
			ticketAmount = 1,
			description = "This is where you'd track your total word count for the novel. How much you've written as of yet.",
			tracking = { percentage = 0.0, sessionsTillFinished=0, measurementTimeTillFinished = "s."--[[number of sessions]]},
			measurement = {amountTotal=100000, aproxAmountPerSession = 1000, sessionPercentage = 0.0, doneSoFar = 0, measurement = "words" --[[calculates percentage and how much more is needed]]},
			aproxTime = { amount = 20, measurement = "min"},
			mandatoryBy = {year = 9999, month = 6, day = 23, hour = 15, min = 30, roughlyIn = {amount = 0, measurement = "days"},},
			partlyCompleted = false--[[this is for when a task is completed for a day for example and then you reenable it the next day]],
			fullyCompleted = false, --[[when 100% of the task is completed, it can still be reenabled if need be]]},

			--[[loopsendshere]]
		},
			type = "broad",
			name = "write a novel",
			description = "You can write down notes regarding a goal here (press Edit > Tap to edit the description)!",
			ticketAmount = 9,
			tracking = { percentage = 0.0, sessionsTillFinished=0, measurementTimeTillFinished = "s."},
			mandatoryBy = {year = 9999, month = 6, day = 23, hour = 15, min = 30, roughlyIn = {amount = 0, measurement = "days"}, },
			partlyCompleted = false,
			fullyCompleted = false, }


			table.insert(goal, writeANovelGoal)
			table.insert(goal, healthTask)
			table.insert(goal, everydayTask)
			table.insert(goal, clickHereTask)


			local defaultReward = {
				--expiresAfter = {year = 0, month = 0, day = 7, hour = 0, min = 0},
				name = "doing something pleasurable",
				allows = {amount = 1, measurement = "hour"},
				rarityHandicap = 100, --[[decreases the likelyhood of this being picked as compared to other tickets]]
			}

			table.insert (ticketVault, defaultReward)

			local defaultReward = {
				--expiresAfter = {year = 0, month = 0, day = 7, hour = 0, min = 0},
				name = "no reward, sometimes you don't need one!",
				allows = {amount = 0, measurement = ""},
				rarityHandicap = 50, --[[decreases the likelyhood of this being picked as compared to other tickets]]
			}

			table.insert (ticketVault, defaultReward)


		end

	end

	function save()
		local dataToBeSaved = ""
		-- ~ is used at the beginning of every important line because the player can't type ~

		local savingNewline = "~~n~"
		local levelOneGoalLine = "~~1~"
		local levelTwoGoalLine = "~~2~"
		local levelThreeGoalLine = "~~3~"
		local savingSpace = "~~s~"

		local dataToBeSaved = dataToBeSaved.."~~goals~"

		for goalNumOne = 1, #goal, 1 do
-- ~~n~ is a new line
-- ~~2~ is a level 2 goal
-- ~~3~ is a level 3 goal
			if goal[goalNumOne].type == "specific" then
				local partlyCompleted = "false"
				local fullyCompleted = "false"
				if goal[goalNumOne].partlyCompleted == true then
					partlyCompleted = "true"
				end
				if goal[goalNumOne].fullyCompleted == true then
					fullyCompleted = "true"
				end

				dataToBeSaved = dataToBeSaved..
				goal[goalNumOne].type..savingSpace..
				levelOneGoalLine..savingSpace..
				goal[goalNumOne].name..savingSpace..
				goal[goalNumOne].description..savingSpace..
				goal[goalNumOne].ticketAmount..savingSpace..
				goal[goalNumOne].measurement.amountTotal..savingSpace..
				goal[goalNumOne].measurement.aproxAmountPerSession..savingSpace..
				goal[goalNumOne].measurement.doneSoFar..savingSpace..
				goal[goalNumOne].measurement.measurement..savingSpace..
				goal[goalNumOne].aproxTime.amount..savingSpace..
				goal[goalNumOne].aproxTime.measurement..savingSpace..
				goal[goalNumOne].mandatoryBy.year..savingSpace..
				goal[goalNumOne].mandatoryBy.month..savingSpace..
				goal[goalNumOne].mandatoryBy.day..savingSpace..
				goal[goalNumOne].mandatoryBy.hour..savingSpace..
				goal[goalNumOne].mandatoryBy.min..savingSpace..
				partlyCompleted..savingSpace..fullyCompleted..savingSpace..savingNewline

			elseif goal[goalNumOne].type == "broad" then

				local partlyCompleted = "false"
				local fullyCompleted = "false"
				if goal[goalNumOne].partlyCompleted == true then
					partlyCompleted = "true"
				end
				if goal[goalNumOne].fullyCompleted == true then
					fullyCompleted = "true"
				end

				dataToBeSaved = dataToBeSaved..
				goal[goalNumOne].type..savingSpace..
				levelOneGoalLine..savingSpace..
				goal[goalNumOne].name..savingSpace..
				goal[goalNumOne].description..savingSpace..
				goal[goalNumOne].ticketAmount..savingSpace..
				goal[goalNumOne].mandatoryBy.year..savingSpace..
				goal[goalNumOne].mandatoryBy.month..savingSpace..
				goal[goalNumOne].mandatoryBy.day..savingSpace..
				goal[goalNumOne].mandatoryBy.hour..savingSpace..
				goal[goalNumOne].mandatoryBy.min..savingSpace..
				partlyCompleted..savingSpace..fullyCompleted..savingSpace..savingNewline

				if goal[goalNumOne].goal[1] ~= nil then

					for goalNumTwo = 1, #goal[goalNumOne].goal, 1 do

						if goal[goalNumOne].goal[goalNumTwo].type == "specific" then

							local partlyCompleted = "false"
							local fullyCompleted = "false"
							if goal[goalNumOne].goal[goalNumTwo].partlyCompleted == true then
								partlyCompleted = "true"
							end
							if goal[goalNumOne].goal[goalNumTwo].fullyCompleted == true then
								fullyCompleted = "true"
							end

							dataToBeSaved = dataToBeSaved..
							goal[goalNumOne].goal[goalNumTwo].type..savingSpace..
							levelTwoGoalLine..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].name..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].description..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].ticketAmount..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].measurement.amountTotal..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].measurement.aproxAmountPerSession..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].measurement.doneSoFar..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].measurement.measurement..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].aproxTime.amount..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].aproxTime.measurement..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].mandatoryBy.year..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].mandatoryBy.month..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].mandatoryBy.day..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].mandatoryBy.hour..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].mandatoryBy.min..savingSpace..
							partlyCompleted..savingSpace..fullyCompleted..savingSpace..savingNewline

						elseif goal[goalNumOne].goal[goalNumTwo].type == "broad" then

							local partlyCompleted = "false"
							local fullyCompleted = "false"
							if goal[goalNumOne].goal[goalNumTwo].partlyCompleted == true then
								partlyCompleted = "true"
							end
							if goal[goalNumOne].goal[goalNumTwo].fullyCompleted == true then
								fullyCompleted = "true"
							end

							dataToBeSaved = dataToBeSaved..
							goal[goalNumOne].goal[goalNumTwo].type..savingSpace..
							levelTwoGoalLine..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].name..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].description..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].ticketAmount..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].mandatoryBy.year..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].mandatoryBy.month..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].mandatoryBy.day..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].mandatoryBy.hour..savingSpace..
							goal[goalNumOne].goal[goalNumTwo].mandatoryBy.min..savingSpace..
							partlyCompleted..savingSpace..fullyCompleted..savingSpace..savingNewline

							if goal[goalNumOne].goal[goalNumTwo].goal[1] ~= nil then

								for goalNumThree = 1, #goal[goalNumOne].goal[goalNumTwo].goal, 1 do

									local partlyCompleted = "false"
									local fullyCompleted = "false"
									if goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].partlyCompleted == true then
										partlyCompleted = "true"
									end
									if goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].fullyCompleted == true then
										fullyCompleted = "true"
									end

									dataToBeSaved = dataToBeSaved..
									goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].type..savingSpace..
									levelThreeGoalLine..savingSpace..
									goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].name..savingSpace..
									goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].description..savingSpace..
									goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].ticketAmount..savingSpace..
									goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].measurement.amountTotal..savingSpace..
									goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].measurement.aproxAmountPerSession..savingSpace..
									goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].measurement.doneSoFar..savingSpace..
									goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].measurement.measurement..savingSpace..
									goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].aproxTime.amount..savingSpace..
									goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].aproxTime.measurement..savingSpace..
									goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].mandatoryBy.year..savingSpace..
									goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].mandatoryBy.month..savingSpace..
									goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].mandatoryBy.day..savingSpace..
									goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].mandatoryBy.hour..savingSpace..
									goal[goalNumOne].goal[goalNumTwo].goal[goalNumThree].mandatoryBy.min..savingSpace..
									partlyCompleted..savingSpace..fullyCompleted..savingSpace..savingNewline

								end

							end

						end

					end

				end

			end

		end


		local dataToBeSaved = dataToBeSaved.."~~ticketInventory~"

		for ticketNum = 1, #ticketInventory, 1 do
			dataToBeSaved = dataToBeSaved..
			ticketInventory[ticketNum].name..savingSpace..ticketInventory[ticketNum].allows.amount..
			savingSpace..ticketInventory[ticketNum].allows.measurement..savingSpace..
			ticketInventory[ticketNum].amount..savingSpace..savingNewline
		end

		local dataToBeSaved = dataToBeSaved.."~~ticketVault~"

		for ticketNum = 1, #ticketVault, 1 do
			dataToBeSaved = dataToBeSaved..
			ticketVault[ticketNum].name..savingSpace..ticketVault[ticketNum].allows.amount..
			savingSpace..ticketVault[ticketNum].allows.measurement..savingSpace..
			ticketVault[ticketNum].rarityHandicap..savingSpace..savingNewline
		end

		dataToBeSaved = dataToBeSaved.."~~end~"
		love.filesystem.write( "smartDogeSaveFile", dataToBeSaved )
	end

	addingDumbGoal = false--if true it allows you to pick a level for the goal
	addingSmartGoal = false
	viewingGoals = false
	viewingGoalPart = "Info"

	--newline string is different per OS
	currentOS = love.system.getOS()
	newLineString = "\n"
	--[[
	if currentOS == "Windows" then
		newLineString = "\r\n"
	elseif currentOS == "OS X" then
		newLineString = "\r"
	elseif currentOS == "Linux" then
		newLineString = "\r\n"
	elseif currentOS == "Android" then
		newLineString = "\n"
	end
]]
	remainingTickets = 0 --0 by default, in case there is more than 1 ticket to be rewarded
	wonATicket = 0 --is 0 by default, if not 0 then a ticket has been chosen
	completingAGoal = false --when the completion window comes up
	completingAGoalWay = "add" -- the other alternative is total
	notChosenTableForCompletion = false --;-;

	maxViewingGoal = 0
	viewingGoalSelected = 3 --became meaningless, should be removed probably
	manuallyViewingGoalSelected = 0

	firstBackspaceTimerDone = false

	descriptionTooltip = ""


	asIfReturnWasPressed = false -- used to simulate pressing enter on the keyboard
	--just to go through the keyboard clipboard iteration

	keyboardInput = false
	keyboardClipboard = ""--string things are written onto before the input is approved
	keyboardTarget = ""--[[this can be the 'name' of a goal for example]]
	keyboardTable = goal -- the table containing the target

	editingDescription = false
	editingGoals = false
	currentGoalPage = 1
	totalAmountOfGoalPages = 1
  selectedGoal = {1, 1, 1} --the goal is the number of the goal on each level
	--there are 3 levels from left to right 1-3, if no goal is selected on a
	--level this is marked by 0

	editingTicket = false
	ticketInventoryOpen = false
	ticketVaultOpen = false
	selectedTicket = 1


	monthLength = {
		leap = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
		common = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
 	}

	mandatoryByWhatToPrint = {
		preWord = "!",
		measurement = "days",
		number = 0,
	}
--table related

--------------------------------------------------------------------------------
	goal = {

	}

	ticketInventory = {


	} --punishments are generated for every punishment drawing

	ticketVault = {


	}

	--tables should be drawn in the order of which goals have already been completed for the day and which are mandatory
--------------------------------------------------------------------------------
--load the modules here and setup the key-press booleans
	local starterpack = require "0modules0.starterpack" starterpack()
	--defaultSprite = love.graphics.newImage("sprites/defaultSprite.png")
	local add_image = require "0modules0.add_image"
	local copy = require "0modules0.copy"

directoryContent = {}

amountToFit = 1
directory = "sprites"
currentFolderPage = 1

undoTable = {}
redoTable = {}

buttonFunction = {
	[1] = function () --undo

	end,
	[2] = function () --redo

	end,
	[3] = function () --newDumbGoal
		if ticketVaultOpen == true then

		elseif ticketInventoryOpen == true then

		else
			if viewingGoals==false and editingGoals == false then
				addingDumbGoal = true
			end
		end
	end,
	[4] = function () --newSmartGoal or addReward
		if ticketVaultOpen == true and editingTicket == false then
			addTicketToVault()
			selectedTicket = #ticketVault
			save()
			addClickingBoxes = true
			clickingBox = {}--has to be emptied every tim
		elseif ticketInventoryOpen == true then

		else
			if viewingGoals==false and editingGoals == false then
				addingSmartGoal = true
			end
		end
	end,
	[5] = function () --tickets

		if ticketInventoryOpen == false and ticketVaultOpen == false then
			ticketInventoryOpen = true

			addClickingBoxes = true
			clickingBox = {}--has to be emptied every tim

			selectedTicket = 1

			editingTicket = false
			ticketVaultOpen = false
			editingGoals = false
			viewingGoals = false
			keyboardInput = false
			completingAGoal = false
			asIfReturnWasPressed = true
			editingDescription = false
		elseif ticketInventoryOpen == true or ticketVaultOpen == true then

			addClickingBoxes = true
			clickingBox = {}--has to be emptied every tim

			selectedTicket = {1,1,1}
			editingTicket=false
			ticketInventoryOpen = false
			ticketVaultOpen = false
			editingGoals = false
			viewingGoals = false
			keyboardInput = false
			completingAGoal = false
			asIfReturnWasPressed = true
			editingDescription = false
		end

	end,
	[6] = function () --complete

		if ticketInventoryOpen == false and ticketVaultOpen == false then
			if editingGoals == false and viewingGoals == false then
				completingAGoal = true
				editingTicket=false

				notChosenTableForCompletion = true

				--[[
				keyboardTarget = "completedAmount"
				keyboardClipboard = ""
				keyboardInput = true
				local rectWidth = 400
				local rectHeight = 300
				local theXOne = (800-rectWidth)/2
				local theXTwo = rectWidth
				local theYOne = ((480-83-rectHeight)/2+83)+8*30+15
				local theYTwo = 40
				love.keyboard.setTextInput(true, theXOne, theYOne , theXTwo, theYTwo)
				]]
			end
		else
			if ticketVaultOpen == true then
				ticketInventoryOpen = true

				addClickingBoxes = true
				clickingBox = {}--has to be emptied every tim

				selectedTicket = 1

				editingTicket=false
				ticketVaultOpen = false
				editingGoals = false
				viewingGoals = false
				keyboardInput = false
				completingAGoal = false
				asIfReturnWasPressed = true
				editingDescription = false
			else
				addClickingBoxes = true
				clickingBox = {}--has to be emptied every tim

				ticketVaultOpen = true

				selectedTicket = 1

				ticketInventoryOpen = false
				editingGoals = false
				editingTicket=false
				viewingGoals = false
				keyboardInput = false
				completingAGoal = false
				asIfReturnWasPressed = true
				editingDescription = false
			end
		end
	end,
	[7] = function () --view
		if ticketInventoryOpen == false and ticketVaultOpen == false then
			if viewingGoals == true and editingGoals == false then
				addClickingBoxes = true
				clickingBox = {}--has to be emptied every tim

				manuallyViewingGoalSelected = 0
				asIfReturnWasPressed = true
				viewingGoals = false
				editingGoals = false
				editingTicket=false
				editingDescription = false
			else
				if goal[selectedGoal[1]] ~= nil then
					addClickingBoxes = true
					clickingBox = {}--has to be emptied every tim

					manuallyViewingGoalSelected = 0
					viewingGoals = true
					editingTicket=false
					editingGoals = false
					editingDescription = false
					asIfReturnWasPressed = true
					viewingGoalSelected = 3 --viewingselection starts with 3
				end
			end
		end
	end,
	[8] = function () --edit or useTicket
		if ticketInventoryOpen == false then
			if ticketVaultOpen == false then
				if editingGoals == true then
					addClickingBoxes = true
					clickingBox = {}--has to be emptied every tim

					manuallyViewingGoalSelected = 0
					asIfReturnWasPressed = true
					editingGoals = false
					editingTicket=false
					editingDescription = false
					viewingGoals = false
				else
					if goal[selectedGoal[1]] ~= nil then
						addClickingBoxes = true
						clickingBox = {}--has to be emptied every time

						manuallyViewingGoalSelected = 0
						viewingGoals = true
						editingGoals = true
						editingTicket=false
						editingDescription = false
						viewingGoalSelected = 3 --viewingselection starts with 3
						asIfReturnWasPressed = true
					end
				end
			else
				if editingTicket == true then

					addClickingBoxes = true
					clickingBox = {}--has to be emptied every tim

					ticketVaultOpen = true

					ticketInventoryOpen = false
					editingGoals = false
					editingTicket=false
					viewingGoals = false
					--keyboardInput = false
					completingAGoal = false
					asIfReturnWasPressed = true
					editingDescription = false
				else
					if ticketVault[1]~=nil then
						manuallyViewingGoalSelected = 0
						viewingGoals = false
						editingGoals = false
						editingTicket=true
						editingDescription = false
						asIfReturnWasPressed = true

						addClickingBoxes = true
						clickingBox = {}--has to be emptied every time
					end
				end
			end
		else
			if ticketInventory[1] == nil then

			elseif ticketInventory[selectedTicket].amount > 1 then
				ticketInventory[selectedTicket].amount=ticketInventory[selectedTicket].amount-1
			else
				table.remove(ticketInventory, selectedTicket)
				save()
				addClickingBoxes = true
				clickingBox = {}--has to be emptied every tim
			end
			if selectedTicket ~= 1 then selectedTicket = selectedTicket - 1 end
		end
	end,
	[9] = function () --copy

	end,
	[10] = function () --delete
		if ticketInventoryOpen == false and editingTicket == false and editingGoals == false and
		viewingGoals == false and editingDescription == false then
			if ticketVaultOpen == true then
				if ticketVault[selectedTicket] ~= nil then
					table.remove(ticketVault, selectedTicket)
					save()
					if selectedTicket ~= 1 then selectedTicket = selectedTicket - 1 end
					addClickingBoxes = true
					clickingBox = {}--has to be emptied every tim
				end
			else

				local deleted = false
				if goal[selectedGoal[1]] ~= nil then
					if goal[selectedGoal[1]].goal ~= nil then
						if goal[selectedGoal[1]].goal[selectedGoal[2]] ~= nil then
							if goal[selectedGoal[1]].goal[selectedGoal[2]].goal ~= nil then
								if goal[selectedGoal[1]].goal[selectedGoal[2]].goal[selectedGoal[3]] ~= nil then
									table.remove(goal[selectedGoal[1]].goal[selectedGoal[2]].goal, selectedGoal[3])
									save()
									if selectedGoal[3] ~= 1 then
										selectedGoal[3] = selectedGoal[3]-1
									end
									deleted = true
								end
							end
						end
					end
				end

				if deleted == false then
					if goal[selectedGoal[1]] ~= nil then
						if goal[selectedGoal[1]].goal ~= nil then
							if goal[selectedGoal[1]].goal[selectedGoal[2]]~= nil then
								table.remove(goal[selectedGoal[1]].goal, selectedGoal[2])
								save()
								if selectedGoal[2] ~= 1 then
									selectedGoal[2] = selectedGoal[2]-1
									selectedGoal[3] = 1
								end
								deleted = true
							end
						end
					end
				end

				if deleted == false then
					if goal[selectedGoal[1]] ~= nil then
							table.remove (goal, selectedGoal[1])
							save()
							if selectedGoal[1] ~= 1 then
								selectedGoal[1] = selectedGoal[1]-1
								selectedGoal[2] = 1
								selectedGoal[3] = 1
							end
							deleted = true
					end
				end

			end
			-- you can delete a ticket or a goal
		end
	end,
}

function drawATicket ()

	local percentage = 0
	local totalPool = 0

	for certainTicket = #ticketVault, 1, -1 do
		totalPool = totalPool + ticketVault[certainTicket].rarityHandicap
	end

	percentage = love.math.random(1, totalPool)

	totalPool = 0
	for certainTicket = #ticketVault, 1, -1 do
		totalPool = totalPool + ticketVault[certainTicket].rarityHandicap
		if totalPool>=percentage then
			return certainTicket
		end
	end

end

function calculateTicketPercentage (aTicket)

	local percentage = 0
	local totalPool = 0

	for certainTicket = #ticketVault, 1, -1 do
		totalPool = totalPool + ticketVault[certainTicket].rarityHandicap
	end

	percentage = ticketVault[aTicket].rarityHandicap/totalPool
	percentage = percentage*100
	percentage = math.floor(percentage)

	return percentage

end

function howLongIsFebruary (year)

	--february has 28 days in common and 29 in leap years

	local divisionVar = {} --checking if the year is divisible by these numbers
	--if the result is 0 it means it is divisible
	divisionVar[1] = math.fmod(year,4)
	divisionVar[2] = math.fmod(year,100)
	divisionVar[3] = math.fmod(year,400)

	if divisionVar[1] == 0 then
		--it's a common year
		return 28
	elseif divisionVar[2] == 0 then
		--it's a leap year
		return 29
	elseif divisionVar[3] == 0 then
		--it's a common year
		return 28
	else
		--it's a leap year
		return 29
	end
	--[[
	if (year is not divisible by 4) then (it is a common year)
	else if (year is not divisible by 100) then (it is a leap year)
	else if (year is not divisible by 400) then (it is a common year)
	else (it is a leap year)]]
end

function addTicketToVault () --adds a ticket to the ticket pool that you can draw later

		local defaultReward = {
			--expiresAfter = {year = 0, month = 0, day = 7, hour = 0, min = 0},
			name = "doing something pleasurable",
			allows = {amount = 1, measurement = "hour"},
			rarityHandicap = 100, --[[decreases the likelyhood of this being picked as compared to other tickets]]
		}

		table.insert (ticketVault, defaultReward)

end

function addTicketToInventory (ticketNum)

	local copiedTable = copy(ticketVault[ticketNum])

	local dontDoIt = 0
	for ticketInventoryItem = #ticketInventory, 1, -1 do
		if ticketInventory[ticketInventoryItem].name == copiedTable.name and
		ticketInventory[ticketInventoryItem].allows.amount == copiedTable.allows.amount and
		ticketInventory[ticketInventoryItem].allows.measurement == copiedTable.allows.measurement then
			dontDoIt = ticketInventoryItem
			break
		end
	end

	if dontDoIt == 0 then
		copiedTable.amount = 1
		copiedTable.rarityHandicap = nil
		table.insert (ticketInventory, copiedTable)
	else
		ticketInventory[dontDoIt].amount = ticketInventory[dontDoIt].amount + 1
	end


end

function addGoal (type, targetSpace)--[[target space is either an empty space in the goal table or space inside a broad goal]]

	if type == "broad" then

		local defaultBroadGoal = {
		goal = {--[[loops]]},
		type = "broad",
		name = "A goal",
		description = "",
		ticketAmount = 1,
		tracking = { percentage = 0.0, sessionsTillFinished=0, measurementTimeTillFinished = "s."--[[calculated based on measurement and aproxTime OF ITS INNER GOALS!!!]]},
		mandatoryBy = {year = 9999, month = 6, day = 23, hour = 15, min = 30, roughlyIn = {amount = 0, measurement = "days"}, },--[[this sets mandatory by to all the inside goals and is set to be earlier if one of the inside goals is earlier]]
		partlyCompleted = false--[[this is for when a task is completed for a day for example and then you reenable it the next day]],
		fullyCompleted = false, --[[when 100% of the task is completed, it can still be reenabled if need be]]}

		table.insert(targetSpace, defaultBroadGoal)

	elseif type == "specific" then

		local defaultSpecificGoal = {
		type = "specific",
		name = "A goal",
		ticketAmount = 1,
		description = "",
		tracking = { percentage = 0.0, sessionsTillFinished=0, measurementTimeTillFinished = "s."--[[number of sessions]]},
		measurement = {amountTotal=1, aproxAmountPerSession = 1, sessionPercentage = 0.0, doneSoFar = 0, measurement = "things" --[[calculates percentage and how much more is needed]]},
		aproxTime = { amount = 120, measurement = "min"},
		mandatoryBy = {year = 9999, month = 6, day = 23, hour = 15, min = 30, roughlyIn = {amount = 0, measurement = "days"},},
		partlyCompleted = false--[[this is for when a task is completed for a day for example and then you reenable it the next day]],
		fullyCompleted = false, --[[when 100% of the task is completed, it can still be reenabled if need be]]}

		table.insert(targetSpace, defaultSpecificGoal)
--how many more sessions till you complete the task
--percentage of the task each session takes
	end
end



	zoom = 1 -- the amount of zoom

    local ww = love.window.getMode(width)
    ww = ww/2/zoom


--these are the dimensions of the rest of the UI

UI = { icons = {
				generalButtons = {
					undo = love.graphics.newImage ("icons/generalButtons/undo.png"),
					redo = love.graphics.newImage ("icons/generalButtons/redo.png"),
					save = love.graphics.newImage ("icons/generalButtons/save.png"),
					smartGoals = love.graphics.newImage ("icons/generalButtons/smartGoals.png"),
					ticketPool = love.graphics.newImage ("icons/generalButtons/ticketPool.png"),
					tickets = love.graphics.newImage ("icons/generalButtons/tickets.png"),
					help = love.graphics.newImage ("icons/generalButtons/help.png"),
				},
				editButtons = {
					complete = love.graphics.newImage ("icons/editButtons/complete.png"),
					copy = love.graphics.newImage ("icons/editButtons/copy.png"),
					delete = love.graphics.newImage ("icons/editButtons/delete.png"),
					edit = love.graphics.newImage ("icons/editButtons/edit.png"),
					reEnable = love.graphics.newImage ("icons/editButtons/reenable.png"),
					view = love.graphics.newImage ("icons/editButtons/view.png"),
				},
				newGoalButtons = {
					newDumbGoal = love.graphics.newImage ("icons/newGoalButtons/newDumbGoal.png"),
					newSmartGoal = love.graphics.newImage ("icons/newGoalButtons/newSmartGoal.png"),
					newGoalPlus = love.graphics.newImage ("icons/newGoal.png"),
					newGoalPlus2 = love.graphics.newImage ("icons/newGoal1.png"),
					newGoalPlus3 = love.graphics.newImage ("icons/newGoal2.png"),
				},
				ticketButtons = {
					addReward = love.graphics.newImage ("icons/ticketButtons/addReward.png"),
					useTicket = love.graphics.newImage ("icons/ticketButtons/useTicket.png"),
					scrollPageLeft = love.graphics.newImage ("icons/ticketButtons/scrollPageLeft.png"),
					scrollPageRight = love.graphics.newImage ("icons/ticketButtons/scrollPageRight.png"),
				},
				--dot | num | category | a: | spriteName | enabledAnipart/DisabledAnipart (images)| currentlySelectedAnipart (image)
			},
 				heightGap = 20,
				widthGap = 20,
				extraGoalRectSpace = 2,
				gapBetweenGoalsX = 18,
				gapBetweenGoalsY = 10,
				introductoryGoalGap = 18-(41+12+16)+24,
				introductoryXgap = 4,
				heightOfRect = 41+12,
				gapForMandatoryBy = 17,
				color = {
					tickets = {175, 37, 170, 255},
					aproxGoal = {129,216,128,255},
					type = {255,255,255,255},
					state = {255,255,255,255},
					soFar = {218,218,129,255},
					mandatoryTill = {255,53,53,255},
					aproxTime = {119,178,178,255},
					percentage = {218,218,129,255},
					title = {255,255,255,255},
				}
			}


	function resetCanvas ()

		awesomecanvas = love.graphics.newCanvas(animationCanvas.width, animationCanvas.height)
		awesomecanvas:setFilter('nearest', 'nearest')

		love.window.setMode(animationCanvas.width,
		animationCanvas.height, {fullscreen =false, fullscreentype="desktop",
		vsync=true,msaa=0,resizable = true,borderless = false,centered = true,
		display = 1,minwidth=0,minheight=0,highdpi=false} )

		local winddWidth, winddHeight = love.graphics.getDimensions()

		uiCanvas = love.graphics.newCanvas(winddWidth, winddHeight)
		uiCanvas:setFilter('nearest', 'nearest')

		labelsCanvas = love.graphics.newCanvas(winddWidth, winddHeight)
		labelsCanvas:setFilter('nearest', 'nearest')
-----------------------------------------------------

	end

	resetCanvas()
--------------------------------------------------------------------------------

	load()
end

function love.mousepressed( x, y, button, istouch )


	--MOUSE CONTROLS START HERE-----------------------------------------------------
		xCursor, yCursor = x, y
leftMousePressed= true
		if currentOS == "Android" then
			local touches = love.touch.getTouches()

			for i, id in ipairs(touches) do
					local x, y = love.touch.getPosition(id)
					xCursor = x
					yCursor = y
			end
		end

		xCursor = xCursor/sx-xx/sx
		yCursor = yCursor/sy-yy/sy


-----------------------------------------------------this is where you mouse click boxes

local clickBoxExtension = 10 --extend the click box so that it's easier to touch

if updateNotesShown == true then
	updateNotesShown = false

elseif remainingTickets == 1 and wonATicket ~= 0 and completingAGoal==true then
	completingAGoal = false
	wonATicket = 0
	remainingTickets = 0

elseif remainingTickets >= 2 then
	remainingTickets = remainingTickets - 1
	wonATicket = drawATicket()
	addTicketToInventory (wonATicket)
	save()

elseif completingAGoal then
	local rectWidth = 400
	local rectHeight = 300
	local rectX = (800-rectWidth)/2
	local rectY = (480-83-rectHeight)/2+83

	if xCursor<rectX or xCursor>rectX+rectWidth or
	yCursor<rectY or yCursor>rectY+rectHeight then
		completingAGoal = false
		keyboardInput = false
	elseif xCursor>=rectX and xCursor<=rectX+rectWidth and
	yCursor>=rectY+5*30 and yCursor<=rectY+5*30+30 then
		completingAGoalWay = "total"
	elseif xCursor>=rectX and xCursor<=rectX+rectWidth and
	yCursor>=rectY+7*30 and yCursor<=rectY+7*30+30 then
		completingAGoalWay = "add"
	end

elseif yCursor > 83 and yCursor < 83 + 54 and (viewingGoals or editingGoals) then
	asIfReturnWasPressed = true --the user selects a different goal tab
	for theColumn = 3, 1, -1 do
		if xCursor > 266*(theColumn-1) then
			if maxViewingGoal >= theColumn then
				if manuallyViewingGoalSelected ~= theColumn then
					editingDescription = false
					addClickingBoxes = true

					clickingBox = {
					}
				end
				manuallyViewingGoalSelected = theColumn
				addClickingBoxes = true

				clickingBox = {
				}
				break
			end
		end
	end

elseif yCursor > 83 + 60 and yCursor <= 83 + 60 + 45 and (viewingGoals or editingGoals) then
	local columnWidth = 266
	for theForInt = 1, 3, 1 do
		if xCursor >= columnWidth*(theForInt-1) and xCursor <= columnWidth*(theForInt-1)+columnWidth then
			local printedLabels = {"<placeholder>", "Description", "Info"}
			viewingGoalPart = printedLabels[theForInt]
		end
	end


elseif (addingDumbGoal == true or addingSmartGoal == true) and editingGoals == false and viewingGoals == false then

	local plusHeight = 331
	local plusWidth = 254
	local theXWhere = { UI.introductoryXgap,
	UI.introductoryXgap+(UI.gapBetweenGoalsX+UI.extraGoalRectSpace+200+50)*(2-1),
	UI.introductoryXgap+(UI.gapBetweenGoalsX+UI.extraGoalRectSpace+200+50)*(3-1)
	}
	local theYWhere = 83+35
	local theYBottom = 480-35

	if xCursor>= theXWhere[1] and xCursor <= theXWhere[1]+plusWidth and
	yCursor>=theYWhere and yCursor<=theYBottom then

		if addingDumbGoal == true then
			addGoal ("broad", goal)
			save()
			addingDumbGoal = false
		elseif addingSmartGoal == true then
			addGoal ("specific", goal)
			save()
			addingSmartGoal = false
		end
		--1 it is

	elseif xCursor>= theXWhere[2] and xCursor <= theXWhere[2]+plusWidth and
	yCursor>=theYWhere and yCursor<=theYBottom then
		if goal[selectedGoal[1]] ~= nil then
			if goal[selectedGoal[1]].goal ~= nil then
				if addingDumbGoal == true then
					addGoal ("broad", goal[selectedGoal[1]].goal)
					save()
					addingDumbGoal = false
				elseif addingSmartGoal == true then
					addGoal ("specific", goal[selectedGoal[1]].goal)
					save()
					addingSmartGoal = false
				end
		--print("2 it is")
			else
				addingSmartGoal = false
				addingDumbGoal = false
			end
		else
			addingSmartGoal = false
			addingDumbGoal = false
		end

	elseif xCursor>= theXWhere[3] and xCursor <= theXWhere[3]+plusWidth and
	yCursor>=theYWhere and yCursor<=theYBottom then

		if goal[selectedGoal[1]] ~= nil then
			if goal[selectedGoal[1]].goal ~= nil then
				if goal[selectedGoal[1]].goal[selectedGoal[2]] ~= nil then
					if goal[selectedGoal[1]].goal[selectedGoal[2]].goal ~= nil then
						if addingDumbGoal == true or addingSmartGoal == true then
							--adds a smart goal every time regardless of the choice
							addGoal ("specific", goal[selectedGoal[1]].goal[selectedGoal[2]].goal)
							save()
							addingSmartGoal = false
							addingDumbGoal = false
						end
		--print("3 it is")
								--third goal is added
					else
						addingSmartGoal = false
						addingDumbGoal = false
					end
				else
					addingSmartGoal = false
					addingDumbGoal = false
				end
			else
				addingSmartGoal = false
				addingDumbGoal = false
			end
		else
			addingSmartGoal = false
			addingDumbGoal = false
		end

	end

elseif yCursor > 83 and goal[1] ~= nil and yCursor < UI.gapBetweenGoalsY+83+UI.introductoryGoalGap+UI.heightOfRect+UI.gapBetweenGoalsY and
(editingGoals == false and viewingGoals == false) then
	--if the mouse is at the bottom of the screen below the goals
	local columnWidth = 200+UI.extraGoalRectSpace+50
	local clickedLevel = 1 --there are 3 levels from left to right
	if xCursor>UI.gapBetweenGoalsX and xCursor<columnWidth+UI.gapBetweenGoalsX then
		clickedLevel = 1
	elseif xCursor>UI.gapBetweenGoalsX*2+columnWidth and xCursor<columnWidth*2+UI.gapBetweenGoalsX*2 then
		clickedLevel = 2
	elseif xCursor>UI.gapBetweenGoalsX*3+columnWidth*2 and xCursor<columnWidth*3+UI.gapBetweenGoalsX*3 then
		clickedLevel = 3
	end

	if selectedGoal[clickedLevel] > 0 then
		--if you are at the first page...
		if clickedLevel == 1 then

			totalAmountOfGoalPages = checkPage(#goal, 5)
			currentGoalPage = checkPage(selectedGoal[1], 5)
			----------------------------------------------------------------------
			if currentGoalPage == totalAmountOfGoalPages then
				if currentGoalPage ~= 1 then
					selectedGoal[1] = 1
					selectedGoal[2] = 1
					selectedGoal[3] = 1
				end
			else
				selectedGoal[1] = currentGoalPage*5+1
				selectedGoal[2] = 1
				selectedGoal[3] = 1
			end

		elseif clickedLevel == 2 then
			if goal[selectedGoal[1]] ~= nil then
				if goal[selectedGoal[1]].goal ~= nil then
					if goal[selectedGoal[1]].goal[1] ~= nil then
						if selectedGoal[1] ~= 0 and selectedGoal[2] ~= 0 then
							totalAmountOfGoalPages = checkPage(#goal[selectedGoal[1]].goal, 5)
							currentGoalPage = checkPage(selectedGoal[2], 5)
						end
					end
				end
			end

			if currentGoalPage == totalAmountOfGoalPages then
				if currentGoalPage ~= 1 then
					selectedGoal[2] = 1
					selectedGoal[3] = 1
				end
			else
				selectedGoal[2] = currentGoalPage*5+1
				selectedGoal[3] = 1
			end

		elseif clickedLevel == 3 then
			if goal[selectedGoal[1]] ~= nil then
				if goal[selectedGoal[1]].goal ~= nil then
					if goal[selectedGoal[1]].goal[selectedGoal[2]] ~= nil then
						if goal[selectedGoal[1]].goal[selectedGoal[2]].goal ~= nil then
							if goal[selectedGoal[1]].goal[selectedGoal[2]].goal[1] ~= nil then
								if selectedGoal[1] ~= 0 and selectedGoal[2] ~= 0 and selectedGoal[3] ~= 0 then
									totalAmountOfGoalPages = checkPage(#goal[selectedGoal[1]].goal[selectedGoal[2]].goal, 5)
									currentGoalPage = checkPage(selectedGoal[3], 5)
								end
							end
						end
					end
				end
			end

			if currentGoalPage == totalAmountOfGoalPages then
				if currentGoalPage ~= 1 then
					selectedGoal[3] = 1
				end
			else
				selectedGoal[3] = currentGoalPage*5+1
			end

		end
	elseif selectedGoal[clickedLevel] == 0 then
		--if it's 0, there's nothing shown so nothing happens
	end

elseif yCursor > 83+UI.introductoryGoalGap+(UI.heightOfRect+UI.gapBetweenGoalsY)*6
and yCursor < 480 and goal[1] ~= nil and editingGoals == false and viewingGoals == false then
	--if the mouse is at the bottom below the buttons

	local columnWidth = 200+UI.extraGoalRectSpace+50
	local clickedLevel = 1 --there are 3 levels from left to right
	if xCursor>UI.gapBetweenGoalsX and xCursor<columnWidth+UI.gapBetweenGoalsX then
		clickedLevel = 1

	elseif xCursor>UI.gapBetweenGoalsX*2+columnWidth and xCursor<columnWidth*2+UI.gapBetweenGoalsX*2 then
		clickedLevel = 2

	elseif xCursor>UI.gapBetweenGoalsX*3+columnWidth*2 and xCursor<columnWidth*3+UI.gapBetweenGoalsX*3 then
		clickedLevel = 3

	end

	if selectedGoal[clickedLevel] > 0 then
		--if you are at the first page...
		if clickedLevel == 1 then

				totalAmountOfGoalPages = checkPage(#goal, 5)
				currentGoalPage = checkPage(selectedGoal[1], 5)

			----------------------------------------------------------------------
			if currentGoalPage == totalAmountOfGoalPages and currentGoalPage==1 then
				selectedGoal[1] = 1
				selectedGoal[2] = 1
				selectedGoal[3] = 1
			elseif currentGoalPage ~= totalAmountOfGoalPages and currentGoalPage == 1 then
				selectedGoal[1] = totalAmountOfGoalPages*5-4
				selectedGoal[2] = 1
				selectedGoal[3] = 1
			else
				selectedGoal[1] = currentGoalPage*5-9
				selectedGoal[2] = 1
				selectedGoal[3] = 1
			end

		elseif clickedLevel == 2 then
			if goal[selectedGoal[1]] ~= nil then
				if goal[selectedGoal[1]].goal ~= nil then
					if goal[selectedGoal[1]].goal[1] ~= nil then
						if selectedGoal[1] ~= 0 and selectedGoal[2] ~= 0 then
							totalAmountOfGoalPages = checkPage(#goal[selectedGoal[1]].goal, 5)
							currentGoalPage = checkPage(selectedGoal[2], 5)
						end
					end
				end
			end
			----------------------------------------------------------------------

			if currentGoalPage == totalAmountOfGoalPages and currentGoalPage==1 then
				selectedGoal[2] = 1
				selectedGoal[3] = 1
			elseif currentGoalPage ~= totalAmountOfGoalPages and currentGoalPage == 1 then
				selectedGoal[2] = totalAmountOfGoalPages*5-4
				selectedGoal[3] = 1
			else
				selectedGoal[2] = currentGoalPage*5-9
				selectedGoal[3] = 1
			end

		elseif clickedLevel == 3 then
			if goal[selectedGoal[1]] ~= nil then
				if goal[selectedGoal[1]].goal ~= nil then
					if goal[selectedGoal[1]].goal[selectedGoal[2]] ~= nil then
						if goal[selectedGoal[1]].goal[selectedGoal[2]].goal ~= nil then
							if goal[selectedGoal[1]].goal[selectedGoal[2]].goal[1] ~= nil then
								if selectedGoal[1] ~= 0 and selectedGoal[2] ~= 0 and selectedGoal[3] ~= 0 then
									totalAmountOfGoalPages = checkPage(#goal[selectedGoal[1]].goal[selectedGoal[2]].goal, 5)
									currentGoalPage = checkPage(selectedGoal[3], 5)
								end
							end
						end
					end
				end
			end
			----------------------------------------------------------------------

			if currentGoalPage == totalAmountOfGoalPages and currentGoalPage==1 then
				selectedGoal[3] = 1
			elseif currentGoalPage ~= totalAmountOfGoalPages and currentGoalPage == 1 then
				selectedGoal[3] = totalAmountOfGoalPages*5-4
			else
				selectedGoal[3] = currentGoalPage*5-9
			end

		end


	elseif selectedGoal[clickedLevel] == 0 then
		--if it's 0, there's nothing shown so nothing happens
	end

elseif yCursor > UI.gapBetweenGoalsY+83+UI.introductoryGoalGap+UI.heightOfRect+UI.gapBetweenGoalsY and
	yCursor < 83+UI.introductoryGoalGap+(UI.heightOfRect+UI.gapBetweenGoalsY)*6 and viewingGoals == false and
	editingGoals == false then
		--if the mouse is at the bottom of the screen below the goals

	local yGoal = 0 --goes 1-5 from bottom to top
	local beginningTopSide = UI.gapBetweenGoalsY+83+UI.introductoryGoalGap+UI.heightOfRect+UI.gapBetweenGoalsY
	local addedHeight = UI.heightOfRect+UI.gapBetweenGoalsY

	if yCursor > beginningTopSide and yCursor < beginningTopSide+UI.heightOfRect then
		yGoal = 5
	elseif yCursor > beginningTopSide+addedHeight*1 and
	yCursor < beginningTopSide+addedHeight*1+UI.heightOfRect then
		yGoal = 4
	elseif yCursor > beginningTopSide+addedHeight*2 and
	yCursor < beginningTopSide+addedHeight*2+UI.heightOfRect then
		yGoal = 3
	elseif yCursor > beginningTopSide+addedHeight*3 and
	yCursor < beginningTopSide+addedHeight*3+UI.heightOfRect then
		yGoal = 2
	elseif yCursor > beginningTopSide+addedHeight*4 and
	yCursor < beginningTopSide+addedHeight*4+UI.heightOfRect then
		yGoal = 1
	end

	local xLevel = 0
	if xCursor < UI.gapBetweenGoalsX+UI.gapBetweenGoalsX+UI.extraGoalRectSpace+200+50 then
		xLevel = 1 -- first level is clicked
	elseif xCursor > UI.gapBetweenGoalsX+UI.gapBetweenGoalsX+UI.extraGoalRectSpace+200+50
	and xCursor < UI.gapBetweenGoalsX+UI.gapBetweenGoalsX+UI.extraGoalRectSpace+200+50+
	UI.gapBetweenGoalsX+UI.extraGoalRectSpace+200+50 then
		xLevel = 2
	else
		xLevel = 3
	end

	if xLevel ~= 0 and yGoal ~= 0 then
		local tehPage = checkPage(selectedGoal[xLevel],5)
		if xLevel == 1 then
			if goal[tehPage*5-5+yGoal] ~= nil then
				descriptionTooltip = goal[tehPage*5-5+yGoal].description
			else
				descriptionTooltip = ""
			end
		elseif xLevel == 2 then

			if goal[selectedGoal[1]] ~= nil then
				if goal[selectedGoal[1]].goal ~= nil then
					if goal[selectedGoal[1]].goal[tehPage*5-5+yGoal] ~= nil then
							descriptionTooltip = goal[selectedGoal[1]].goal[tehPage*5-5+yGoal].description
					else
						descriptionTooltip = ""
					end
				else
					descriptionTooltip = ""
				end
			else
				descriptionTooltip = ""
			end

		else

			if goal[selectedGoal[1]] ~= nil then
				if goal[selectedGoal[1]].goal ~= nil then
					if goal[selectedGoal[1]].goal[selectedGoal[2]] ~= nil then
						if goal[selectedGoal[1]].goal[selectedGoal[2]].goal ~= nil then
							if goal[selectedGoal[1]].goal[selectedGoal[2]].goal[tehPage*5-5+yGoal] ~= nil then
								descriptionTooltip = goal[selectedGoal[1]].goal[selectedGoal[2]].goal[tehPage*5-5+yGoal].description
						else
							descriptionTooltip = ""
						end
					else
						descriptionTooltip = ""
					end
				else
					descriptionTooltip = ""
				end
			else
				descriptionTooltip = ""
			end
		else
			descriptionTooltip = ""
		end
	end

	selectedGoal[xLevel] = tehPage*5-5+yGoal

	end

end

local emptyTheClickingBoxAfter = false
local dontDoYearChange = false

for theBox = 1, #clickingBox, 1 do

	if popupTable.shown == true then

		popupCheck (xCursor, yCursor)
		dontDoYearChange = true

	else

		if (clickingBox[theBox].where == "scrollingTicketInventory" and ticketInventoryOpen and ticketVaultOpen==false) or
		(clickingBox[theBox].where == "scrollingTicketInventory" and ticketInventoryOpen==false and ticketVaultOpen) then

			if clickingBox[theBox].somethingElse == "leftArrow" then

				if xCursor >= clickingBox[theBox].x1 and xCursor <= clickingBox[theBox].x1+clickingBox[theBox].x2 and
				yCursor >= clickingBox[theBox].y1 and yCursor <= clickingBox[theBox].y1+clickingBox[theBox].y2 then

					if  clickingBox[theBox].currentTicketPage == 1 and clickingBox[theBox].totalTicketPages ~= 1 then
						selectedTicket = (clickingBox[theBox].totalTicketPages-1)*clickingBox[theBox].howManyCanFitAPage+1
						emptyTheClickingBoxAfter = true
					elseif clickingBox[theBox].currentTicketPage == 1 and clickingBox[theBox].totalTicketPages == 1 then

					else
						selectedTicket = (clickingBox[theBox].currentTicketPage-2)*clickingBox[theBox].howManyCanFitAPage+1
						emptyTheClickingBoxAfter = true
					end

				end

			end

			if clickingBox[theBox].somethingElse == "rightArrow" then

				if xCursor >= clickingBox[theBox].x1 and xCursor <= clickingBox[theBox].x1+clickingBox[theBox].x2 and
				yCursor >= clickingBox[theBox].y1 and yCursor <= clickingBox[theBox].y1+clickingBox[theBox].y2 then

					if clickingBox[theBox].currentTicketPage == clickingBox[theBox].totalTicketPages and
					clickingBox[theBox].totalTicketPages ~= 1 then
						selectedTicket = 1
						emptyTheClickingBoxAfter = true
					elseif clickingBox[theBox].currentTicketPage == 1 and clickingBox[theBox].totalTicketPages == 1 then

					else
						selectedTicket = clickingBox[theBox].currentTicketPage*clickingBox[theBox].howManyCanFitAPage+1
						emptyTheClickingBoxAfter = true
					end

				end
			end

			if clickingBox[theBox].somethingElse == "newSelectedTicket" then

				if xCursor >= clickingBox[theBox].x1 and xCursor <= clickingBox[theBox].x1+clickingBox[theBox].x2 and
				yCursor >= clickingBox[theBox].y1 and yCursor <= clickingBox[theBox].y1+clickingBox[theBox].y2 then

					selectedTicket = clickingBox[theBox].theRectNum

				end

			end

		end


		if (clickingBox[theBox].where == "theGoalEditing" and ticketVaultOpen==false and ticketInventoryOpen==false and
		editingGoals) or (clickingBox[theBox].where == "ticketVault" and ticketVaultOpen and editingTicket) then

			if clickingBox[theBox].somethingElse == "" then

				if xCursor >= clickingBox[theBox].x1 and xCursor <= clickingBox[theBox].x1+clickingBox[theBox].x2 and
				yCursor >= clickingBox[theBox].y1 and yCursor <= clickingBox[theBox].y1+clickingBox[theBox].y2 then
					keyboardInput = true
					keyboardTarget = clickingBox[theBox].keyboardTarget
					keyboardClipboard = clickingBox[theBox].keyboardClipboard
					keyboardTable = clickingBox[theBox].keyboardTable
				end

			elseif clickingBox[theBox].somethingElse == "smartphoneDown" then

				if xCursor >= clickingBox[theBox].x1 and xCursor <= clickingBox[theBox].x1+clickingBox[theBox].x2 and
				yCursor >= clickingBox[theBox].y1 and yCursor <= clickingBox[theBox].y1+clickingBox[theBox].y2 then
					love.keyboard.setTextInput(true, clickingBox[theBox].x1, clickingBox[theBox].y1,
					clickingBox[theBox].x2, clickingBox[theBox].y2)
					keyboardInput = true
					keyboardTarget = clickingBox[theBox].keyboardTarget
					keyboardClipboard = clickingBox[theBox].keyboardClipboard
					keyboardTable = clickingBox[theBox].keyboardTable
				end

			elseif clickingBox[theBox].somethingElse == "mandatoryByDate" and editingGoals then

				if popupTable.shown == false and dontDoYearChange==false and
				clickingBox[theBox].keyboardTable.year ~= 9999 then

					if xCursor >= clickingBox[theBox].x1 and xCursor <= clickingBox[theBox].x1+clickingBox[theBox].x2 and
					yCursor >= clickingBox[theBox].y1 and yCursor <= clickingBox[theBox].y1+clickingBox[theBox].y2 then
						keyboardInput = true
						keyboardTarget = clickingBox[theBox].keyboardTarget
						keyboardClipboard = clickingBox[theBox].keyboardClipboard
						keyboardTable = clickingBox[theBox].keyboardTable
					end

				end

			elseif clickingBox[theBox].somethingElse == "openDescription" and editingGoals then

				if yCursor > clickingBox[theBox].y1 then
					editingDescription = true
					keyboardTarget = "description"
					keyboardTable = clickingBox[theBox].keyboardTable
					keyboardClipboard = clickingBox[theBox].keyboardClipboard
					keyboardInput = true
					emptyTheClickingBoxAfter = true
				end

			elseif clickingBox[theBox].somethingElse == "closeDescription" and editingDescription then

				if yCursor < clickingBox[theBox].y1 then
					editingDescription = false
					keyboardInput = false
					editingDescription = false
					emptyTheClickingBoxAfter = true
				end

			elseif clickingBox[theBox].somethingElse == "popup" then

				if xCursor >= clickingBox[theBox].x1 and xCursor <= clickingBox[theBox].x1+clickingBox[theBox].x2 and
				yCursor >= clickingBox[theBox].y1 and yCursor <= clickingBox[theBox].y1+clickingBox[theBox].y2 then

					popupDefine(clickingBox[theBox].keyboardTable.aproxTime, "measurement",{"min", "hours","days", "months", "years"},
					clickingBox[theBox].x1, clickingBox[theBox].y1+clickingBox[theBox].y2,
						clickingBox[theBox].y2, 130, 30, clickingBox[theBox].keyboardTable.aproxTime.measurement, {20,20,20,160}, {30,30,30,200}, {255,255,255,255}, smallerFont )
					popupLaunch(true)
					asIfReturnWasPressed = true
					emptyTheClickingBoxAfter=true
				end

			elseif clickingBox[theBox].somethingElse == "mandatoryByBool" then

				if xCursor >= clickingBox[theBox].x1 and xCursor <= clickingBox[theBox].x1+clickingBox[theBox].x2 and
				yCursor >= clickingBox[theBox].y1 and yCursor <= clickingBox[theBox].y1+clickingBox[theBox].y2 then

					if clickingBox[theBox].keyboardTable.mandatoryBy.year == 9999 then
						local currentYear = tonumber(os.date("%Y"))
						clickingBox[theBox].keyboardTable.mandatoryBy.year = currentYear
						clickingBox[theBox].keyboardTable.mandatoryBy.month = 12
						clickingBox[theBox].keyboardTable.mandatoryBy.day = 31
						clickingBox[theBox].keyboardTable.mandatoryBy.hour = 12
						clickingBox[theBox].keyboardTable.mandatoryBy.min = 00
						asIfReturnWasPressed = true
						emptyTheClickingBoxAfter=true
						save()
					else
						clickingBox[theBox].keyboardTable.mandatoryBy.year = 9999
						save()
						asIfReturnWasPressed = true
						emptyTheClickingBoxAfter=true
					end

				end
			end

		end
	end
end

if emptyTheClickingBoxAfter == true then
	clickingBox = {}
	addClickingBoxes = true
end

if yCursor < UI.gapBetweenGoalsY+83 then
	if popupTable.shown == true then popupTable.shown = false end
	local whereTheButtonX = 17
	for exactButton = 1, 10, 1 do
		if xCursor>whereTheButtonX and xCursor<(whereTheButtonX+72) then
			buttonFunction[exactButton]()
		end
		whereTheButtonX = whereTheButtonX+72+5
	end
end

--------------------------------------------------------------------------------

end





function love.update(dt)
--------------------------------------------------------------------------------
	timerCheck()

	if popupTable.shown == true then
		xCursor, yCursor = love.mouse.getPosition()

		if currentOS == "Android" then
			local touches = love.touch.getTouches()

			for i, id in ipairs(touches) do
					local x, y = love.touch.getPosition(id)
					xCursor = x
					yCursor = y
			end
		end

		xCursor = xCursor/sx-xx/sx
		yCursor = yCursor/sy-yy/sy
	end
--[[
	if not(love.mouse.isDown(1)) and leftMousePressed == true then
		leftMousePressed = false
	end]]

--DRAWING STARTS HERE-----------------------------------------------------------

	love.graphics.setCanvas(buttonCanvas)
	love.graphics.clear()

	love.graphics.setColor( 190, 190, 190, 255 )
	love.graphics.rectangle( "fill", 0, 0, 800, 82)
	love.graphics.setColor( 255, 255, 255, 255 )

	if ticketVaultOpen == false and ticketInventoryOpen == false then
		--love.graphics.draw(UI.icons.generalButtons.undo, 17, 5)
		--love.graphics.draw(UI.icons.generalButtons.redo, 17+5*1+72, 5)
		if editingGoals == false and viewingGoals == false then
			love.graphics.draw(UI.icons.newGoalButtons.newDumbGoal, 17+5*2+72*2, 5)
			love.graphics.draw(UI.icons.newGoalButtons.newSmartGoal, 17+5*3+72*3, 5)
		end
		love.graphics.draw(UI.icons.generalButtons.tickets, 17+5*4+72*4, 5)
		if editingGoals == false and viewingGoals == false then
			if reenablePossible ~= 0 then
				love.graphics.draw(UI.icons.editButtons.reEnable, 17+5*5+72*5, 5)
			else
				love.graphics.draw(UI.icons.editButtons.complete, 17+5*5+72*5, 5)
			end
		end
		love.graphics.draw(UI.icons.editButtons.view, 17+5*6+72*6, 5)
		love.graphics.draw(UI.icons.editButtons.edit, 17+5*7+72*7, 5)
		--love.graphics.draw(UI.icons.editButtons.copy, 17+5*8+72*8, 5)
		if editingGoals == false and viewingGoals == false then
			love.graphics.draw(UI.icons.editButtons.delete, 17+5*9+72*9, 5)
		end
	elseif ticketVaultOpen == true and ticketInventoryOpen == false then
		--love.graphics.draw(UI.icons.generalButtons.undo, 17, 5)
		--love.graphics.draw(UI.icons.generalButtons.redo, 17+5*1+72, 5)
		--love.graphics.draw(UI.icons.newGoalButtons.newDumbGoal, 17+5*2+72*2, 5)
		if editingTicket == false then
		love.graphics.draw(UI.icons.ticketButtons.addReward, 17+5*3+72*3, 5)
		end
		love.graphics.draw(UI.icons.generalButtons.smartGoals, 17+5*4+72*4, 5)
		love.graphics.draw(UI.icons.generalButtons.tickets, 17+5*5+72*5, 5)
		--love.graphics.draw(UI.icons.editButtons.view, 17+5*6+72*6, 5)
		love.graphics.draw(UI.icons.editButtons.edit, 17+5*7+72*7, 5)
		--love.graphics.draw(UI.icons.editButtons.copy, 17+5*8+72*8, 5)
		if editingTicket == false then
			love.graphics.draw(UI.icons.editButtons.delete, 17+5*9+72*9, 5)
		end
	elseif ticketVaultOpen == false and ticketInventoryOpen == true then
		--love.graphics.draw(UI.icons.generalButtons.undo, 17, 5)
		--love.graphics.draw(UI.icons.generalButtons.redo, 17+5*1+72, 5)
		--love.graphics.draw(UI.icons.newGoalButtons.newDumbGoal, 17+5*2+72*2, 5)
		--love.graphics.draw(UI.icons.newGoalButtons.newSmartGoal, 17+5*3+72*3, 5)
		love.graphics.draw(UI.icons.generalButtons.smartGoals, 17+5*4+72*4, 5)
		love.graphics.draw(UI.icons.generalButtons.ticketPool, 17+5*5+72*5, 5)
		--love.graphics.draw(UI.icons.editButtons.view, 17+5*6+72*6, 5)
		love.graphics.draw(UI.icons.ticketButtons.useTicket, 17+5*7+72*7, 5)
		--love.graphics.draw(UI.icons.editButtons.copy, 17+5*8+72*8, 5)
		--love.graphics.draw(UI.icons.editButtons.delete, 17+5*9+72*9, 5)
	end

	love.graphics.setCanvas(awesomecanvas)
	love.graphics.clear()

	love.graphics.setColor( 63, 63, 63, 255 )
	love.graphics.rectangle( "fill", 0, 83, 800, 480-83)
	love.graphics.setColor( 255, 255, 255, 255 )

	whereToDrawGoalsY = UI.gapBetweenGoalsY+83+UI.introductoryGoalGap
	whereToDrawGoalsX = UI.introductoryXgap

	--for each level iterator goes here:::: xxxx

	if editingTicket == true then
		love.graphics.setCanvas(awesomecanvas)
		local whereToY = 83

--==============================================================================

		love.graphics.setColor(UI.color.tickets)
		love.graphics.rectangle( "fill", 0, whereToY, 800, 480-whereToY)
		love.graphics.setColor( 255, 255, 255, 255 )

		local startingXDistance = 1
		local theTicket = ticketVault[selectedTicket]
		local numberBox = 25
		local wordBox = 100
		local boxHeight = 44
		local introductorySpaceY = 70
		local spaceY = 70

		whereToY = 83+UI.gapBetweenGoalsY

----------drawing and detecting the name of the ticket----------------------------
				local xDistance = startingXDistance
				--whereToY= beforeWhereToY
				love.graphics.setFont(randomfont)
				local whatToPrint = "Name of the activity that is rewarded: "
				local lengthOfIt = randomfont:getWidth(whatToPrint)
				love.graphics.print(whatToPrint, xDistance, whereToY)
				xDistance = xDistance + lengthOfIt

				xDistance = startingXDistance
				whereToY= whereToY+spaceY/1.5
				if keyboardTarget == "name" then
					whatToPrint = keyboardClipboard.."_"
				else
					whatToPrint = theTicket.name
				end
				local lengthOfIt = randomfont:getWidth(whatToPrint)
				lengthOfIt= lengthOfIt+12
				local whichIsBigger = nil
				if lengthOfIt < wordBox then
					love.graphics.setColor(50,50,50,170)
					love.graphics.rectangle('fill', xDistance, whereToY, wordBox, boxHeight)
					love.graphics.setColor(20,20,20,200)
					love.graphics.rectangle('line', xDistance, whereToY, wordBox, boxHeight)
					whichIsBigger = wordBox
				else
					love.graphics.setColor(50,50,50,170)
					love.graphics.rectangle('fill', xDistance, whereToY, lengthOfIt, boxHeight)
					love.graphics.setColor(20,20,20,200)
					love.graphics.rectangle('line', xDistance, whereToY, lengthOfIt, boxHeight)
					whichIsBigger = lengthOfIt
				end
				love.graphics.setColor(255,255,255,255)
				love.graphics.print(whatToPrint, xDistance+5, whereToY)
				love.graphics.setColor(0,0,0,255)

				if addClickingBoxes == true then
					local aNewClickingBox = {
						x1 = xDistance,
						x2 = whichIsBigger,
						y1 = whereToY,
						y2 = boxHeight,
						keyboardTarget = "name",
						keyboardClipboard = theTicket.name,
						keyboardTable = theTicket,
						somethingElse = "",
						where = "ticketVault",
					}
					table.insert(clickingBox,aNewClickingBox)
				end

				love.graphics.setColor(255,255,255,255)
----------ending of drawing and detecting the name of the ticket------------------
--allows = {amount = 10, measurement = "hours"},
--rarityHandicap = 0,

----------amount drawing starts here--------------------------------------------
				xDistance = startingXDistance
				whereToY = whereToY+spaceY*1.2

				local whatToPrint = "Amount: "
				local lengthOfIt = randomfont:getWidth(whatToPrint)
				love.graphics.print(whatToPrint, xDistance, whereToY)
				xDistance = xDistance + lengthOfIt

				if keyboardTarget == "amount" then
					whatToPrint = keyboardClipboard.."_"
				else
					whatToPrint = theTicket.allows.amount
				end
				local lengthOfIt = randomfont:getWidth(whatToPrint)
				lengthOfIt= lengthOfIt+12
				local whichIsBigger = nil
				if lengthOfIt < numberBox then
					love.graphics.setColor(50,50,50,170)
					love.graphics.rectangle('fill', xDistance, whereToY, numberBox, boxHeight)
					love.graphics.setColor(20,20,20,200)
					love.graphics.rectangle('line', xDistance, whereToY, numberBox, boxHeight)
					whichIsBigger = numberBox
				else
					love.graphics.setColor(50,50,50,170)
					love.graphics.rectangle('fill', xDistance, whereToY, lengthOfIt, boxHeight)
					love.graphics.setColor(20,20,20,200)
					love.graphics.rectangle('line', xDistance, whereToY, lengthOfIt, boxHeight)
					whichIsBigger = lengthOfIt
				end
				love.graphics.setColor(255,255,255,255)
				love.graphics.print(whatToPrint, xDistance+5, whereToY)
				love.graphics.setColor(0,0,0,255)

				if addClickingBoxes == true then
					local aNewClickingBox = {
						x1 = xDistance,
						x2 = whichIsBigger,--this will be just the additions to the 1s
						y1 = whereToY,
						y2 = boxHeight,--this will be just the additions to the 1s
						keyboardTarget = "amount",
						keyboardClipboard = theTicket.allows.amount,
						keyboardTable = theTicket.allows,
						somethingElse = "",
						where = "ticketVault"
					}
					table.insert(clickingBox, aNewClickingBox)
				end

				xDistance = xDistance + lengthOfIt
				love.graphics.setColor(255,255,255,255)
------------------amount drawing ends here--------------------------------------

----------drawing and detecting the measurement of the rewarded action----------
				--whereToY= beforeWhereToY
				love.graphics.setFont(randomfont)
				xDistance = xDistance + 10

				if keyboardTarget == "measurement" then
					whatToPrint = keyboardClipboard.."_"
				else
					whatToPrint = theTicket.allows.measurement
				end
				local lengthOfIt = randomfont:getWidth(whatToPrint)
				lengthOfIt= lengthOfIt+12
				local whichIsBigger = nil
				if lengthOfIt < wordBox then
					love.graphics.setColor(50,50,50,170)
					love.graphics.rectangle('fill', xDistance, whereToY, wordBox, boxHeight)
					love.graphics.setColor(20,20,20,200)
					love.graphics.rectangle('line', xDistance, whereToY, wordBox, boxHeight)
					whichIsBigger = wordBox
				else
					love.graphics.setColor(50,50,50,170)
					love.graphics.rectangle('fill', xDistance, whereToY, lengthOfIt, boxHeight)
					love.graphics.setColor(20,20,20,200)
					love.graphics.rectangle('line', xDistance, whereToY, lengthOfIt, boxHeight)
					whichIsBigger = lengthOfIt
				end
				love.graphics.setColor(255,255,255,255)
				love.graphics.print(whatToPrint, xDistance+5, whereToY)
				love.graphics.setColor(0,0,0,255)

				if addClickingBoxes == true then
					local aNewClickingBox = {
						x1 = xDistance,
						x2 = whichIsBigger,--this will be just the additions to the 1s
						y1 = whereToY,
						y2 = boxHeight,--this will be just the additions to the 1s
						keyboardTarget = "measurement",
						keyboardClipboard = theTicket.allows.measurement,
						keyboardTable = theTicket.allows,
						somethingElse = "",
						where = "ticketVault"
					}
					table.insert(clickingBox,aNewClickingBox)
				end

				love.graphics.setColor(255,255,255,255)
----------ending of drawing and detecting the name of the rewarded action-------


----------rarityHandicap starts here--------------------------------------------
				xDistance = startingXDistance
				whereToY = whereToY+spaceY*1.5

				love.graphics.setFont(smallerFont)
				local whatToPrint = "Priority (the higher the number the higher the priority): "
				local lengthOfIt = randomfont:getWidth(whatToPrint)
				love.graphics.print(whatToPrint, xDistance, whereToY)
				xDistance = startingXDistance
				whereToY= whereToY+spaceY/2

				love.graphics.setFont(randomfont)
				if keyboardTarget == "rarityHandicap" then
					whatToPrint = keyboardClipboard.."_"
				else
					whatToPrint = theTicket.rarityHandicap
				end
				local lengthOfIt = randomfont:getWidth(whatToPrint)
				lengthOfIt= lengthOfIt+12
				local whichIsBigger = nil
				if lengthOfIt < numberBox then
					love.graphics.setColor(50,50,50,170)
					love.graphics.rectangle('fill', xDistance, whereToY, numberBox, boxHeight)
					love.graphics.setColor(20,20,20,200)
					love.graphics.rectangle('line', xDistance, whereToY, numberBox, boxHeight)
					whichIsBigger = numberBox
				else
					love.graphics.setColor(50,50,50,170)
					love.graphics.rectangle('fill', xDistance, whereToY, lengthOfIt, boxHeight)
					love.graphics.setColor(20,20,20,200)
					love.graphics.rectangle('line', xDistance, whereToY, lengthOfIt, boxHeight)
					whichIsBigger = lengthOfIt
				end
				love.graphics.setColor(255,255,255,255)
				love.graphics.print(whatToPrint, xDistance+5, whereToY)
				love.graphics.setColor(0,0,0,255)

				if addClickingBoxes == true then
					local aNewClickingBox = {
						x1 = xDistance,
						x2 = whichIsBigger,--this will be just the additions to the 1s
						y1 = whereToY,
						y2 = boxHeight,--this will be just the additions to the 1s
						keyboardTarget = "rarityHandicap",
						keyboardClipboard = theTicket.rarityHandicap,
						keyboardTable = theTicket,
						somethingElse = "smartphoneDown",
						where = "ticketVault"
					}
					table.insert(clickingBox,aNewClickingBox)
				end

				xDistance = xDistance + lengthOfIt
				love.graphics.setColor(255,255,255,255)
------------------rarityHandicap ends here--------------------------------------

		love.graphics.setCanvas()

	elseif ticketVaultOpen == true then

		love.graphics.setCanvas(awesomecanvas)
		local whereX = 0
		local whereY = 83
		local rectWidth = 252
		local rectHeight = 53
		local heightForAllRectangles = 350
		local rectIntroductoryHorizontalDist = 4
		local rectHorizontalDist = 18
		local rectVerticalDist = 10
		local howManyCanFitAColumn = heightForAllRectangles/(rectHeight+rectVerticalDist)
		howManyCanFitAColumn = math.floor(howManyCanFitAColumn)

		local countingWidth = rectIntroductoryHorizontalDist
		local howManyCanFitAPage = 0
		local lastHowManyCanFitAPage = 0

		for checkingAmount = 1, 99, 1 do
			howManyCanFitAPage =
			800 - (rectWidth*checkingAmount + rectHorizontalDist*(checkingAmount-1))
			if howManyCanFitAPage <= 0 then
				break
			else
				lastHowManyCanFitAPage = checkingAmount
			end
		end

		howManyCanFitAPage = lastHowManyCanFitAPage
		howManyCanFitAPage = howManyCanFitAPage * howManyCanFitAColumn

		local totalTicketPages = checkPage(#ticketVault, howManyCanFitAPage)
		local currentTicketPage = checkPage(selectedTicket,howManyCanFitAPage)
		local startingTicketForThisPage = (currentTicketPage-1)*howManyCanFitAPage+1
		local endingTicketForThisPage = currentTicketPage*howManyCanFitAPage

		local theFirstOne = true
		local columnNum = 1
		for theRectNum = endingTicketForThisPage, startingTicketForThisPage, -1 do

			if whereY+rectVerticalDist+rectHeight > heightForAllRectangles then
				whereY = 83 + rectVerticalDist
				columnNum = columnNum + 1
			else
				if theFirstOne == true then
					theFirstOne = false
					whereY = 83 + rectVerticalDist
				else
					whereY = whereY+(rectVerticalDist+rectHeight)
				end
			end

			whereX = rectIntroductoryHorizontalDist +
			(rectWidth + rectHorizontalDist)*(columnNum-1)


			local columnWidth = 200+UI.extraGoalRectSpace+50
			local xForLeft = columnWidth+rectIntroductoryHorizontalDist+rectHorizontalDist
			local xForRight = columnWidth*2+rectIntroductoryHorizontalDist+rectHorizontalDist-65
			local yForBoth = heightForAllRectangles+58

			if totalTicketPages ~= 1 and totalTicketPages ~= 0 then

				love.graphics.draw(UI.icons.ticketButtons.scrollPageLeft, xForLeft, yForBoth)
				love.graphics.setFont(randomfont)
				love.graphics.printf(currentTicketPage.."/"..totalTicketPages, columnWidth+rectIntroductoryHorizontalDist+rectHorizontalDist+65+2,heightForAllRectangles+66,
				(columnWidth*2+rectIntroductoryHorizontalDist+rectHorizontalDist-65-2)-(columnWidth+rectIntroductoryHorizontalDist+rectHorizontalDist+65+2), 'center')
				love.graphics.draw(UI.icons.ticketButtons.scrollPageRight, xForRight, yForBoth)

				--checking cursor for the left arrow

				if addClickingBoxes == true then

					local aNewClickingBox = {
						x1 = xForLeft,
						x2 = 65,--this will be just the additions to the 1s
						y1 = yForBoth,
						y2 = 65,--this will be just the additions to the 1s
						currentTicketPage = currentTicketPage,
						totalTicketPages = totalTicketPages,
						howManyCanFitAPage = howManyCanFitAPage,
						keyboardTarget = "name",
						somethingElse = "leftArrow",
						where = "scrollingTicketInventory"
					}
					table.insert(clickingBox,aNewClickingBox)

				end

				if addClickingBoxes == true then

					local aNewClickingBox = {
						x1 = xForRight,
						x2 = 65,--this will be just the additions to the 1s
						y1 = yForBoth,
						y2 = 65,--this will be just the additions to the 1s
						currentTicketPage = currentTicketPage,
						totalTicketPages = totalTicketPages,
						howManyCanFitAPage = howManyCanFitAPage,
						keyboardTarget = "name",
						somethingElse = "rightArrow",
						where = "scrollingTicketInventory"
					}
					table.insert(clickingBox,aNewClickingBox)

				end


			end

			if ticketVault[theRectNum] ~= nil then


				if addClickingBoxes == true then

					local aNewClickingBox = {
						x1 = whereX,
						x2 = rectWidth,--this will be just the additions to the 1s
						y1 = whereY,
						y2 = rectHeight,--this will be just the additions to the 1s
						theRectNum = theRectNum,
						keyboardTarget = "name",
						somethingElse = "newSelectedTicket",
						where = "scrollingTicketInventory"
					}
					table.insert(clickingBox,aNewClickingBox)

				end

				if theRectNum == selectedTicket then
					love.graphics.setColor(UI.color.tickets)
				else
					love.graphics.setColor(UI.color.soFar)
				end
				love.graphics.rectangle('fill', whereX, whereY, rectWidth, rectHeight)
				love.graphics.setColor(255, 255, 255, 255)

				if theRectNum == selectedTicket then
					love.graphics.setColor(UI.color.percentage)
				else
					love.graphics.setColor(0,0,0,200)
				end
				love.graphics.setFont(ticketFont)
				local rarityHandicap = calculateTicketPercentage(theRectNum)
				rarityHandicap = tonumber(rarityHandicap)
				local whatToPrint = ticketVault[theRectNum].allows.amount.." "..
				ticketVault[theRectNum].allows.measurement.." of "..
				ticketVault[theRectNum].name..", "..rarityHandicap.."%"
				love.graphics.printf(whatToPrint, whereX, whereY+2, rectWidth, 'center')
				love.graphics.setColor(255, 255, 255, 255)
			else

				love.graphics.setColor(0,0,0,100)
				love.graphics.rectangle('fill', whereX, whereY, rectWidth, rectHeight)
				love.graphics.setColor(255, 255, 255, 255)

			end

		end

		love.graphics.setCanvas()



	elseif ticketInventoryOpen == true then

		love.graphics.setCanvas(awesomecanvas)
		local whereX = 0
		local whereY = 83
		local rectWidth = 252
		local rectHeight = 53
		local heightForAllRectangles = 350
		local rectIntroductoryHorizontalDist = 4
		local rectHorizontalDist = 18
		local rectVerticalDist = 10
		local howManyCanFitAColumn = heightForAllRectangles/(rectHeight+rectVerticalDist)
		howManyCanFitAColumn = math.floor(howManyCanFitAColumn)

		local countingWidth = rectIntroductoryHorizontalDist
		local howManyCanFitAPage = 0
		local lastHowManyCanFitAPage = 0

		for checkingAmount = 1, 99, 1 do
			howManyCanFitAPage =
			800 - (rectWidth*checkingAmount + rectHorizontalDist*(checkingAmount-1))
			if howManyCanFitAPage <= 0 then
				break
			else
				lastHowManyCanFitAPage = checkingAmount
			end
		end

		howManyCanFitAPage = lastHowManyCanFitAPage
		howManyCanFitAPage = howManyCanFitAPage * howManyCanFitAColumn

		local totalTicketPages = checkPage(#ticketInventory, howManyCanFitAPage)
		local currentTicketPage = checkPage(selectedTicket,howManyCanFitAPage)
		local startingTicketForThisPage = (currentTicketPage-1)*howManyCanFitAPage+1
		local endingTicketForThisPage = currentTicketPage*howManyCanFitAPage

		local theFirstOne = true
		local columnNum = 1
		for theRectNum = endingTicketForThisPage, startingTicketForThisPage, -1 do

			if whereY+rectVerticalDist+rectHeight > heightForAllRectangles then
				whereY = 83 + rectVerticalDist
				columnNum = columnNum + 1
			else
				if theFirstOne == true then
					theFirstOne = false
					whereY = 83 + rectVerticalDist
				else
					whereY = whereY+(rectVerticalDist+rectHeight)
				end
			end

			whereX = rectIntroductoryHorizontalDist +
			(rectWidth + rectHorizontalDist)*(columnNum-1)


			local columnWidth = 200+UI.extraGoalRectSpace+50
			local xForLeft = columnWidth+rectIntroductoryHorizontalDist+rectHorizontalDist
			local xForRight = columnWidth*2+rectIntroductoryHorizontalDist+rectHorizontalDist-65
			local yForBoth = heightForAllRectangles+58

			if totalTicketPages ~= 1 and totalTicketPages ~= 0 then

				love.graphics.draw(UI.icons.ticketButtons.scrollPageLeft, xForLeft, yForBoth)
				love.graphics.setFont(randomfont)
				love.graphics.printf(currentTicketPage.."/"..totalTicketPages, columnWidth+rectIntroductoryHorizontalDist+rectHorizontalDist+65+2,heightForAllRectangles+66,
				(columnWidth*2+rectIntroductoryHorizontalDist+rectHorizontalDist-65-2)-(columnWidth+rectIntroductoryHorizontalDist+rectHorizontalDist+65+2), 'center')
				love.graphics.draw(UI.icons.ticketButtons.scrollPageRight, xForRight, yForBoth)

				--checking cursor for the left arrow
				if addClickingBoxes == true then

					local aNewClickingBox = {
						x1 = xForLeft,
						x2 = 65,--this will be just the additions to the 1s
						y1 = yForBoth,
						y2 = 65,--this will be just the additions to the 1s
						currentTicketPage = currentTicketPage,
						totalTicketPages = totalTicketPages,
						howManyCanFitAPage = howManyCanFitAPage,
						keyboardTarget = "name",
						somethingElse = "leftArrow",
						where = "scrollingTicketInventory"
					}
					table.insert(clickingBox,aNewClickingBox)

				end

				if addClickingBoxes == true then

					local aNewClickingBox = {
						x1 = xForRight,
						x2 = 65,--this will be just the additions to the 1s
						y1 = yForBoth,
						y2 = 65,--this will be just the additions to the 1s
						currentTicketPage = currentTicketPage,
						totalTicketPages = totalTicketPages,
						howManyCanFitAPage = howManyCanFitAPage,
						keyboardTarget = "name",
						somethingElse = "rightArrow",
						where = "scrollingTicketInventory"
					}
					table.insert(clickingBox,aNewClickingBox)

				end

			end

			if ticketInventory[theRectNum] ~= nil then

				if addClickingBoxes == true then

					local aNewClickingBox = {
						x1 = whereX,
						x2 = rectWidth,--this will be just the additions to the 1s
						y1 = whereY,
						y2 = rectHeight,--this will be just the additions to the 1s
						theRectNum = theRectNum,
						keyboardTarget = "name",
						somethingElse = "newSelectedTicket",
						where = "scrollingTicketInventory"
					}
					table.insert(clickingBox,aNewClickingBox)

				end

				if theRectNum == selectedTicket then
					love.graphics.setColor(UI.color.tickets)
				else
					love.graphics.setColor(UI.color.aproxTime)
				end
				love.graphics.rectangle('fill', whereX, whereY, rectWidth, rectHeight)
				love.graphics.setColor(255, 255, 255, 255)

				if theRectNum == selectedTicket then
					love.graphics.setColor(UI.color.percentage)
				else
					love.graphics.setColor(0,0,0,200)
				end
				love.graphics.setFont(ticketFont)
				local whatToPrint = ticketInventory[theRectNum].allows.amount.." "..
				ticketInventory[theRectNum].allows.measurement.." of "..
				ticketInventory[theRectNum].name.." x"..ticketInventory[theRectNum].amount
				love.graphics.printf(whatToPrint, whereX, whereY+2, rectWidth, 'center')
				love.graphics.setColor(255, 255, 255, 255)
			else

				love.graphics.setColor(0,0,0,30)
				love.graphics.rectangle('fill', whereX, whereY, rectWidth, rectHeight)
				love.graphics.setColor(255, 255, 255, 255)

			end

		end

		love.graphics.setCanvas()
	elseif ticketVaultOpen == false and ticketInventoryOpen == false then

		for currentLevelOfGoals = 1, 3, 1 do

		theGoalDirectory = goal
		disableGoalsThisTime = false

		if currentLevelOfGoals == 2 then
			if goal[selectedGoal[1]] ~= nil then
				if goal[selectedGoal[1]].goal ~= nil then
					if goal[selectedGoal[1]].goal[1]~= nil then
						theGoalDirectory = goal[selectedGoal[1]].goal
					else
						disableGoalsThisTime = true
					end
				else
					disableGoalsThisTime = true
		 		end
			else
				disableGoalsThisTime = true
			end
		elseif currentLevelOfGoals == 3 then
			if goal[selectedGoal[1]] ~= nil then
				if goal[selectedGoal[1]].goal ~= nil then
					if goal[selectedGoal[1]].goal[selectedGoal[2]] ~= nil then
						if goal[selectedGoal[1]].goal[selectedGoal[2]].goal ~= nil then
							if goal[selectedGoal[1]].goal[selectedGoal[2]].goal[1] ~= nil then
								theGoalDirectory = goal[selectedGoal[1]].goal[selectedGoal[2]].goal
							else
								disableGoalsThisTime = true
							end
						else
							disableGoalsThisTime = true
						end
					else
						disableGoalsThisTime = true
					end
				else
					disableGoalsThisTime = true
				end
			else
				disableGoalsThisTime = true
			end
		end

		if disableGoalsThisTime == false then
			whereToDrawGoalsY = UI.gapBetweenGoalsY+83+UI.introductoryGoalGap
			whereToDrawGoalsX = UI.introductoryXgap+(UI.gapBetweenGoalsX+UI.extraGoalRectSpace+200+50)*
			(currentLevelOfGoals-1)

			local totalAmountOfGoalsPages = 1

			if currentLevelOfGoals == 1 then
				totalAmountOfGoalsPages = checkPage(#goal, 5)
			elseif currentLevelOfGoals == 2 then
				totalAmountOfGoalsPages = checkPage(#goal[selectedGoal[1]].goal, 5)
			elseif currentLevelOfGoals == 3 then
				totalAmountOfGoalsPages = checkPage(#goal[selectedGoal[1]].goal[selectedGoal[2]], 5)
			end

			local currentPage = checkPage(selectedGoal[currentLevelOfGoals], 5)

			local startingNumberIteration = currentPage*5+1
			local endingNumberIteration = currentPage*5-5

			for enumerateGoals = startingNumberIteration, endingNumberIteration, -1 do

				if theGoalDirectory[enumerateGoals] ~= nil and
				theGoalDirectory[enumerateGoals].type =="broad" then

					if theGoalDirectory[enumerateGoals].tracking.percentage >= 1.0 then
						if theGoalDirectory[enumerateGoals].fullyCompleted == false then
							theGoalDirectory[enumerateGoals].fullyCompleted = true
							save()
							if ticketVault[1] ~= nil then
								if remainingTickets ~= 0 then
									remainingTickets = remainingTickets+theGoalDirectory[enumerateGoals].ticketAmount
								else
									remainingTickets = theGoalDirectory[enumerateGoals].ticketAmount
								end
								save()
							end
							if reenablePossible > currentLevelOfGoals then
								reenablePossible = currentLevelOfGoals
							end
						end
					else
						if theGoalDirectory[enumerateGoals].fullyCompleted == true and not(theGoalDirectory[enumerateGoals].tracking.percentage >= 1.0) and youCanCheckForPercentageNow~=0 then
							theGoalDirectory[enumerateGoals].fullyCompleted = false
							save()
						end
					end
				end

				if enumerateGoals == selectedGoal[currentLevelOfGoals] then
				--	love.graphics.setColor(unpack(UI.color.aproxGoal))
				--	love.graphics.rectangle( 'line', whereToDrawGoalsX-4, whereToDrawGoalsY-4, 200+UI.extraGoalRectSpace+50+8, UI.heightOfRect+8)
				--	love.graphics.setColor(255,255,255,255)
				if theGoalDirectory[enumerateGoals] ~= nil and editingGoals==false then
					if theGoalDirectory[enumerateGoals].type == "specific" then
						--theGoalDirectory[enumerateGoals].measurement.doneSoFar = tonumber(theGoalDirectory[enumerateGoals].measurement.doneSoFar)
						--theGoalDirectory[enumerateGoals].measurement.amountTotal = tonumber(theGoalDirectory[enumerateGoals].measurement.amountTotal)

						if theGoalDirectory[enumerateGoals].measurement.doneSoFar >= theGoalDirectory[enumerateGoals].measurement.amountTotal or
						theGoalDirectory[enumerateGoals].partlyCompleted == true then
							reenablePossible = currentLevelOfGoals
						else
							if not (reenablePossible<currentLevelOfGoals) then
								reenablePossible = 0
							end
						end
					end
				end

					love.graphics.setColor(15,15,15, 255)
				love.graphics.rectangle( 'fill', whereToDrawGoalsX, whereToDrawGoalsY, 200+UI.extraGoalRectSpace+50, UI.heightOfRect)
					--love.graphics.rectangle( 'line', whereToDrawGoalsX-8, whereToDrawGoalsY-8, 200+UI.extraGoalRectSpace+50+16, UI.heightOfRect+16)
					love.graphics.setColor(255,255,255,255)

				else
					love.graphics.setColor(40, 40, 40, 255)

				love.graphics.rectangle( 'fill', whereToDrawGoalsX, whereToDrawGoalsY, 200+UI.extraGoalRectSpace+50, UI.heightOfRect)
					love.graphics.setColor(255,255,255,255)
				end

				local replaceWithTheFirstGoal = false
				local actualEnumerateGoals = 1

				if theGoalDirectory[enumerateGoals] == nil then

					local wantedResult = enumerateGoals/5
					local roundedAmount = math.floor(wantedResult)
					wantedResult = wantedResult - roundedAmount
					wantedResult = tostring(wantedResult)--had to turn it into a string cause comparing float point values sucks
					if wantedResult == "0.2" then
					--it is a number one goal that doesn't exist it is replaced with the first goal
						replaceWithTheFirstGoal = true
					end
				end

				if theGoalDirectory[enumerateGoals] ~= nil or (theGoalDirectory[currentGoalPage*5+1] ~= nil and
				replaceWithTheFirstGoal == true) then

					if replaceWithTheFirstGoal == true then
						actualEnumerateGoals = enumerateGoals
						enumerateGoals = 1
					end
						love.graphics.setFont( smallerFont )
						love.graphics.setColor(unpack(UI.color.title))
						love.graphics.printf( theGoalDirectory[enumerateGoals].name, whereToDrawGoalsX+UI.extraGoalRectSpace, whereToDrawGoalsY+5, 150, 'center')
						love.graphics.setColor(255,255,255,255)

						whereToDrawGoalsX = whereToDrawGoalsX+150+UI.extraGoalRectSpace
						love.graphics.setFont( smallerFont )
						--local tehPercentage = string.format("%5.2f", theGoalDirectory[enumerateGoals].tracking.percentage)
						--tehPercentage = math.floor(tehPercentage)
						if theGoalDirectory[enumerateGoals].type == "specific" then
							theGoalDirectory[enumerateGoals].tracking.percentage=
							theGoalDirectory[enumerateGoals].measurement.doneSoFar/theGoalDirectory[enumerateGoals].measurement.amountTotal
							if theGoalDirectory[enumerateGoals].tracking.percentage > 1.0 then
								theGoalDirectory[enumerateGoals].tracking.percentage = 1.0
							end
						elseif theGoalDirectory[enumerateGoals].type == "broad" then
							if theGoalDirectory[enumerateGoals].goal[1] ~= nil then
								local percentageInTotal = 0
								local addedGoals = 0
								for thisGoal = #theGoalDirectory[enumerateGoals].goal, 1, -1 do
									if theGoalDirectory[enumerateGoals].goal[thisGoal].type == "specific" then
										percentageInTotal = percentageInTotal+theGoalDirectory[enumerateGoals].goal[thisGoal].tracking.percentage
										addedGoals = addedGoals + 1
									else
										if theGoalDirectory[enumerateGoals].goal[thisGoal].goal[1] ~= nil then
											for thatGoal = #theGoalDirectory[enumerateGoals].goal[thisGoal].goal, 1, -1 do
												if theGoalDirectory[enumerateGoals].goal[thisGoal].goal[thatGoal].type == "specific" then
													percentageInTotal= percentageInTotal+theGoalDirectory[enumerateGoals].goal[thisGoal].goal[thatGoal].tracking.percentage
													addedGoals = addedGoals + 1
												else
													if theGoalDirectory[enumerateGoals].goal[thisGoal].goal[thatGoal].goal[1] ~= nil then
														for demGoal = #theGoalDirectory[enumerateGoals].goal[thisGoal].goal[thatGoal].goal, 1, -1 do
															percentageInTotal = percentageInTotal+theGoalDirectory[enumerateGoals].goal[thisGoal].goal[thatGoal].goal[demGoal].tracking.percentage
															addedGoals = addedGoals + 1
														end
													else
														percentageInTotal = percentageInTotal
													end

												end
											end
										else
											percentageInTotal = percentageInTotal
										end
									end

								end
								theGoalDirectory[enumerateGoals].tracking.percentage=percentageInTotal/addedGoals
								if theGoalDirectory[enumerateGoals].tracking.percentage > 1.0 then
									theGoalDirectory[enumerateGoals].tracking.percentage = 1.0
								end
							else
								theGoalDirectory[enumerateGoals].tracking.percentage = 0

							end
						end

						local tehPercentage = theGoalDirectory[enumerateGoals].tracking.percentage*100
						tehPercentage = math.floor(tehPercentage)

						local noMandatoryBy = false
						if tehPercentage == 100 then noMandatoryBy=true end
						tehPercentage = tehPercentage.."%"
						love.graphics.setColor(unpack(UI.color.percentage))
						love.graphics.print( tehPercentage, whereToDrawGoalsX+UI.extraGoalRectSpace, whereToDrawGoalsY)
						love.graphics.setColor(255,255,255,255)

					--	whereToDrawGoalsX = whereToDrawGoalsX+150+UI.extraGoalRectSpace
						--love.graphics.print( tehPercentage, whereToDrawGoalsX+UI.extraGoalRectSpace, whereToDrawGoalsY)
						  --  print(os.date("%H:%M:%S")) --20:08:13 hour:minute:second
						  --  print(os.date("%d/%m/%Y")) --12/13/17 month/day/year

						if theGoalDirectory[enumerateGoals].mandatoryBy.year == 9999 then
							noMandatoryBy = true
						end

						if noMandatoryBy == true then
							love.graphics.setFont(evenSmallerFont)
							whereToDrawGoalsX = whereToDrawGoalsX+20+UI.extraGoalRectSpace
						end

						if noMandatoryBy == false then

							local currentHour = tonumber(os.date("%H"))
							local currentMin = tonumber(os.date("%M"))
							local currentDay = tonumber(os.date("%d"))
							local currentMonth = tonumber(os.date("%m"))
							local currentYear = tonumber(os.date("%Y"))

							--howLongIsFebruary(2008)

							local yearDifference = theGoalDirectory[enumerateGoals].mandatoryBy.year - currentYear

							if yearDifference == 0 then
								local monthDifference = theGoalDirectory[enumerateGoals].mandatoryBy.month - currentMonth

								if monthDifference == 0 then
									local dayDifference = theGoalDirectory[enumerateGoals].mandatoryBy.day - currentDay

									if dayDifference == 0 then

										local hourDifference = theGoalDirectory[enumerateGoals].mandatoryBy.hour - currentHour

										if hourDifference == 0 then
											local minuteDifference = theGoalDirectory[enumerateGoals].mandatoryBy.min - currentMin
											if minuteDifference == 0 then
												noMandatoryBy = true --[[task failed]]
											elseif minuteDifference > 0 then
												mandatoryByWhatToPrint.number=minuteDifference
												mandatoryByWhatToPrint.measurement="minutes"
												--PRINT THE MINUTES LEFT @HERE@
											elseif minuteDifference < 0 then
												noMandatoryBy = true --[[task failed]]
											end
										elseif hourDifference < 0 then
											noMandatoryBy = true --[[task failed]]
										elseif hourDifference > 0 then
											mandatoryByWhatToPrint.number=hourDifference
											mandatoryByWhatToPrint.measurement="hours"
											--PRINT THE HOURS LEFT @HERE@

										end

									elseif dayDifference < 0 then
										noMandatoryBy = true --[[task failed]]
									elseif dayDifference > 0 then
										mandatoryByWhatToPrint.number=dayDifference
										mandatoryByWhatToPrint.measurement="days"
										--PRINT THE DAYS LEFT @HERE@
									end

								elseif monthDifference < 0 then
									noMandatoryBy = true --[[task failed]]
								elseif monthDifference > 0 then
									--you still calculate the month-days...

									local totalAmountOfDaysToPrint = 0
									local theFebruaryLength = howLongIsFebruary (currentYear)
									local howManyMoreDaysThisMonth = 0
									if theFebruaryLength == 28 then
										howManyMoreDaysThisMonth = monthLength.common[currentMonth]-currentDay
									else
										howManyMoreDaysThisMonth = monthLength.leap[currentMonth]-currentDay
									end

									local monthDaysInBetween = 0
									local startFromThisMonth = theGoalDirectory[enumerateGoals].mandatoryBy.month - 1
									local endAtThisMonth = currentMonth + 1

									if monthDifference ~= 1 then
										if theFebruaryLength == 28 then
											for theSpecificMonth = startFromThisMonth, endAtThisMonth, -1 do
												monthDaysInBetween = monthDaysInBetween + monthLength.common[theSpecificMonth]
											end
										else
											for theSpecificMonth = startFromThisMonth, endAtThisMonth, -1 do
												monthDaysInBetween = monthDaysInBetween + monthLength.leap[theSpecificMonth]
											end
										end
									end

									totalAmountOfDaysToPrint = howManyMoreDaysThisMonth +
									theGoalDirectory[enumerateGoals].mandatoryBy.day + monthDaysInBetween
									mandatoryByWhatToPrint.number=totalAmountOfDaysToPrint
									mandatoryByWhatToPrint.measurement="days"
									--PRINT THE DAYS LEFT @HERE@
								end

							end
							if yearDifference > 0 then
								--you still calculate the month-days...
								local totalAmountOfDaysToPrint = 0
								local daysLeftThisYear = 0
								local endAtThisMonth = currentMonth+1
								local theFebruaryLength = howLongIsFebruary (currentYear)
								local monthsDaysInTheLastYear = 0
								local yearDaysInBetween = 0
								if currentMonth ~= 12 then
									for theSpecificMonth = 12, endAtThisMonth, -1 do
										if theFebruaryLength == 28 then
											daysLeftThisYear = daysLeftThisYear + monthLength.common[theSpecificMonth]
										else
											daysLeftThisYear = daysLeftThisYear + monthLength.leap[theSpecificMonth]
										end
									end
								end
								if theFebruaryLength == 28 then
									daysLeftThisYear = daysLeftThisYear + (monthLength.common[currentMonth]-currentDay)
								else
									daysLeftThisYear = daysLeftThisYear + (monthLength.leap[currentMonth]-currentDay)
								end

								local startWithThisMonth = theGoalDirectory[enumerateGoals].mandatoryBy.month - 1
								if currentMonth ~= 1 then
									for theSpecificMonth = startWithThisMonth, 1, -1 do
										if theFebruaryLength == 28 then
											monthsDaysInTheLastYear = monthsDaysInTheLastYear + monthLength.common[theSpecificMonth]
										else
											monthsDaysInTheLastYear = monthsDaysInTheLastYear + monthLength.leap[theSpecificMonth]
										end
									end
								end

								if yearDifference ~= 1 then
									local startWithThisYear = theGoalDirectory[enumerateGoals].mandatoryBy.year - 1
									local endWithThisYear = currentYear + 1
									for thisYear = startWithThisYear, endWithThisYear, -1 do
										local theFebruaryLength = howLongIsFebruary(thisYear)
										for specificMonth = 12, 1, -1 do
											if theFebruaryLength == 28 then
												yearDaysInBetween = yearDaysInBetween + monthLength.common[specificMonth]
											else
												yearDaysInBetween = yearDaysInBetween + monthLength.leap[specificMonth]
											end
										end
									end
								else
									local thisYear = currentYear + 1
									local theFebruaryLength = howLongIsFebruary(thisYear)
									for specificMonth = 12, 1, -1 do
										if theFebruaryLength == 28 then
											yearDaysInBetween = yearDaysInBetween + monthLength.common[specificMonth]
										else
											yearDaysInBetween = yearDaysInBetween + monthLength.leap[specificMonth]
										end
									end
								end

								totalAmountOfDaysToPrint = daysLeftThisYear + yearDaysInBetween +
								monthsDaysInTheLastYear + theGoalDirectory[enumerateGoals].mandatoryBy.day
								mandatoryByWhatToPrint.number=totalAmountOfDaysToPrint
								mandatoryByWhatToPrint.measurement="days"
								--PRINT THE DAYS LEFT @HERE@
							end
							if yearDifference < 0 then noMandatoryBy = true --[[task failed]] end

							--you have to print the mandatoryBy stuff in form of "2 more days or hours etc."
							--for this to work you need to get the system time
							love.graphics.setFont(evenSmallerFont)
							whereToDrawGoalsX = whereToDrawGoalsX+20+UI.extraGoalRectSpace

							local whatToPrintString = mandatoryByWhatToPrint.preWord..mandatoryByWhatToPrint.number..
							mandatoryByWhatToPrint.measurement

							theGoalDirectory[enumerateGoals].mandatoryBy.roughlyIn.amount = mandatoryByWhatToPrint.number
							theGoalDirectory[enumerateGoals].mandatoryBy.roughlyIn.measurement = mandatoryByWhatToPrint.measurement

							love.graphics.setColor(unpack(UI.color.mandatoryTill))
							love.graphics.print( whatToPrintString, whereToDrawGoalsX+UI.gapForMandatoryBy+
							UI.extraGoalRectSpace, whereToDrawGoalsY)
							love.graphics.setColor(255,255,255,255)
						end
						local temporaryWhereToDrawGoalsX = whereToDrawGoalsX
						if theGoalDirectory[enumerateGoals].ticketAmount ~= 0 then
							whereToDrawGoalsX =whereToDrawGoalsX+45
							love.graphics.setColor(0,0,0,255)
							love.graphics.rectangle('fill', whereToDrawGoalsX+UI.gapForMandatoryBy+
							UI.extraGoalRectSpace, whereToDrawGoalsY, 14, 14 )
							love.graphics.setColor(UI.color.tickets)
							love.graphics.print(theGoalDirectory[enumerateGoals].ticketAmount.."t",whereToDrawGoalsX+1+UI.gapForMandatoryBy+
							UI.extraGoalRectSpace, whereToDrawGoalsY)
							love.graphics.setColor(255,255,255,255)
						end

						whereToDrawGoalsX = temporaryWhereToDrawGoalsX
								local evenSmallerFontHeight = evenSmallerFont:getHeight()-4

								if theGoalDirectory[enumerateGoals].type == "specific" then
									theGoalDirectory[enumerateGoals].tracking.sessionsTillFinished =
									(theGoalDirectory[enumerateGoals].measurement.amountTotal-
									theGoalDirectory[enumerateGoals].measurement.doneSoFar)/
									theGoalDirectory[enumerateGoals].measurement.aproxAmountPerSession
								elseif theGoalDirectory[enumerateGoals].type == "broad" then
									if theGoalDirectory[enumerateGoals].goal[1] == nil then
										theGoalDirectory[enumerateGoals].tracking.sessionsTillFinished=0
									else
										local amountOfSessions = 0
										for someSmallerGoal = #theGoalDirectory[enumerateGoals].goal, 1, -1 do
											amountOfSessions = amountOfSessions+
											theGoalDirectory[enumerateGoals].goal[someSmallerGoal].tracking.sessionsTillFinished
										end
										theGoalDirectory[enumerateGoals].tracking.sessionsTillFinished = amountOfSessions
									end
								end
								theGoalDirectory[enumerateGoals].tracking.sessionsTillFinished=
								math.floor(theGoalDirectory[enumerateGoals].tracking.sessionsTillFinished)


								if not(theGoalDirectory[enumerateGoals].tracking.percentage >= 1.0) then
									whatToPrintString = "~"..theGoalDirectory[enumerateGoals].tracking.sessionsTillFinished..
									theGoalDirectory[enumerateGoals].tracking.measurementTimeTillFinished
									love.graphics.setColor(unpack(UI.color.aproxTime))
									love.graphics.print( whatToPrintString, whereToDrawGoalsX+UI.gapForMandatoryBy+
									UI.extraGoalRectSpace+15, whereToDrawGoalsY+evenSmallerFontHeight)
									love.graphics.setColor(255,255,255,255)
								end

								local smallerFontHeight = smallerFont:getHeight()-4
							if theGoalDirectory[enumerateGoals].type == "specific" then
								whereToDrawGoalsX = whereToDrawGoalsX - 20
								whatToPrintString = theGoalDirectory[enumerateGoals].measurement.doneSoFar.."/"..
								theGoalDirectory[enumerateGoals].measurement.amountTotal..theGoalDirectory[enumerateGoals].measurement.measurement
								love.graphics.setColor(unpack(UI.color.soFar))
								love.graphics.print( whatToPrintString, whereToDrawGoalsX,
								whereToDrawGoalsY+smallerFontHeight)
								love.graphics.setColor(255,255,255,255)
							end

								local smallerFontHeight = smallerFont:getHeight()-4
							if theGoalDirectory[enumerateGoals].type == "broad" then
								whereToDrawGoalsX = whereToDrawGoalsX - 20
								whatToPrintString = "has: ".. #theGoalDirectory[enumerateGoals].goal.. " goals"
								love.graphics.setColor(unpack(UI.color.percentage))
								love.graphics.print( whatToPrintString, whereToDrawGoalsX,
								whereToDrawGoalsY+smallerFontHeight)
								love.graphics.setColor(255,255,255,255)
							end

								whereToDrawGoalsX = whereToDrawGoalsX
								local smallerFontHeight = smallerFont:getHeight()-4
								local typeOfGoal = "dumb"
								if theGoalDirectory[enumerateGoals].type ~= "specific" then
								whatToPrintString = typeOfGoal
								love.graphics.setColor(unpack(UI.color.type))
								love.graphics.print( whatToPrintString, whereToDrawGoalsX,
								whereToDrawGoalsY+smallerFontHeight+13)
								love.graphics.setColor(255,255,255,255)
								end

								whereToDrawGoalsX = whereToDrawGoalsX + 40
								local smallerFontHeight = smallerFont:getHeight()-4
								local stateOfGoal = "not done"
								local colorForThis = UI.color.mandatoryTill
								if theGoalDirectory[enumerateGoals].fullyCompleted==true or theGoalDirectory[enumerateGoals].partlyCompleted==true then
									stateOfGoal = "done"
									colorForThis = UI.color.aproxTime
								end
								whatToPrintString = stateOfGoal
								love.graphics.setColor(unpack(colorForThis))
								love.graphics.print( whatToPrintString, whereToDrawGoalsX,
								whereToDrawGoalsY+smallerFontHeight+13)
								love.graphics.setColor(255,255,255,255)

								if theGoalDirectory[enumerateGoals].type == "specific" then

									theGoalDirectory[enumerateGoals].measurement.sessionPercentage =
									theGoalDirectory[enumerateGoals].measurement.aproxAmountPerSession/
									theGoalDirectory[enumerateGoals].measurement.amountTotal


									--local tehSpPercentage = string.format("%5.2f", theGoalDirectory[enumerateGoals].measurement.sessionPercentage)
									local tehSpPercentage = theGoalDirectory[enumerateGoals].measurement.sessionPercentage*100
									tehSpPercentage = math.floor(tehSpPercentage)
									tehSpPercentage = tehSpPercentage.."%"

								whereToDrawGoalsX = UI.introductoryXgap+2+(UI.gapBetweenGoalsX+UI.extraGoalRectSpace+200+50)*
								(currentLevelOfGoals-1)
								whatToPrintString = theGoalDirectory[enumerateGoals].measurement.aproxAmountPerSession..
								theGoalDirectory[enumerateGoals].measurement.measurement.." in"..theGoalDirectory[enumerateGoals].aproxTime.amount..
								theGoalDirectory[enumerateGoals].aproxTime.measurement.."("..tehSpPercentage..")"

								love.graphics.setColor(unpack(UI.color.aproxGoal))
								love.graphics.print( whatToPrintString, whereToDrawGoalsX,
								whereToDrawGoalsY+smallerFontHeight+13)
								love.graphics.setColor(255,255,255,255)

								end
							end

						love.graphics.setFont(randomfont)
						whereToDrawGoalsX = UI.introductoryXgap+(UI.gapBetweenGoalsX+UI.extraGoalRectSpace+200+50)*
						(currentLevelOfGoals-1)
						whereToDrawGoalsY = whereToDrawGoalsY+UI.heightOfRect+UI.gapBetweenGoalsY

						if replaceWithTheFirstGoal == true then
							enumerateGoals = actualEnumerateGoals
						end

					end

					end

		end

		if addingDumbGoal == true or addingSmartGoal == true then

			love.graphics.setColor(255,255,255,187)
			local theYWhere = 83+35
			local theXWhere = UI.introductoryXgap
			if addingSmartGoal == true then
				love.graphics.draw(UI.icons.newGoalButtons.newGoalPlus3, theXWhere, theYWhere)
			else
				love.graphics.draw(UI.icons.newGoalButtons.newGoalPlus, theXWhere,theYWhere)
			end

			if goal[selectedGoal[1]] ~= nil then
				if goal[selectedGoal[1]].goal ~= nil then

					local theXWhere = UI.introductoryXgap+(UI.gapBetweenGoalsX+UI.extraGoalRectSpace+200+50)*(2-1)
						if addingSmartGoal == true then
							love.graphics.draw(UI.icons.newGoalButtons.newGoalPlus3, theXWhere,theYWhere)
						else
							love.graphics.draw(UI.icons.newGoalButtons.newGoalPlus2, theXWhere,theYWhere)
						end
				end
			end

			if goal[selectedGoal[1]] ~= nil then
				if goal[selectedGoal[1]].goal ~= nil then
					if goal[selectedGoal[1]].goal[selectedGoal[2]] ~= nil then
						if goal[selectedGoal[1]].goal[selectedGoal[2]].goal ~= nil then

						local theXWhere = UI.introductoryXgap+(UI.gapBetweenGoalsX+UI.extraGoalRectSpace+200+50)*(3-1)
						love.graphics.draw(UI.icons.newGoalButtons.newGoalPlus3, theXWhere,theYWhere)

						end
					end
				end
			end
			love.graphics.setColor(255,255,255,255)
		end
	--[[
			local heightOfRect = randomfont:getHeight()
			love.graphics.rectangle( 'line', 5, 83+5+UI.gapBetweenGoals, 200+UI.extraGoalRectSpace*2, heightOfRect)
			love.graphics.print(goal[1].name, 5+UI.extraGoalRectSpace, 83+5+UI.gapBetweenGoals)]]

		--------------------------------------------------------------------------------
		love.graphics.rectangle( "line", 0, 83, 800, 480-83)
			love.graphics.setCanvas()

			if viewingGoals == true then
				love.graphics.setCanvas(awesomecanvas)
				love.graphics.clear()

				local whereToY = UI.gapBetweenGoalsY+83+UI.introductoryGoalGap

				theGoal = nil
				local theLevelUsed = 0
				maxViewingGoal = 0

	---iterating through all three levels
				if goal[selectedGoal[1]] ~= nil then
					if goal[selectedGoal[1]].goal ~= nil then
						if goal[selectedGoal[1]].goal[selectedGoal[2]] ~= nil then
							if goal[selectedGoal[1]].goal[selectedGoal[2]].goal ~= nil then
								if goal[selectedGoal[1]].goal[selectedGoal[2]].goal[selectedGoal[3]] ~= nil then
									if maxViewingGoal == 0 then maxViewingGoal = 3 end
									if manuallyViewingGoalSelected == 0 or manuallyViewingGoalSelected == 3 then
										viewingGoalSelected = 3
										theLevelUsed = 3
										theGoal = goal[selectedGoal[1]].goal[selectedGoal[2]].goal[selectedGoal[3]]
										love.graphics.setColor(UI.color.aproxGoal)
										love.graphics.rectangle( "fill", 0, whereToY, 800, 480-whereToY)
										love.graphics.setColor( 255, 255, 255, 255 )
									end
								end
							end
						end
					end
				end

				if theLevelUsed == 0 then
					--check if there's a level 2 goal
					if goal[selectedGoal[1]] ~= nil then
						if goal[selectedGoal[1]].goal ~= nil then
							if goal[selectedGoal[1]].goal[selectedGoal[2]]~= nil then
								if maxViewingGoal == 0 then maxViewingGoal = 2 end
								if manuallyViewingGoalSelected == 0 or manuallyViewingGoalSelected == 2 then
									theGoal = goal[selectedGoal[1]].goal[selectedGoal[2]]
									theLevelUsed = 2
									viewingGoalSelected = 2
									if goal[selectedGoal[1]].goal[selectedGoal[2]].type == "specific" then
										love.graphics.setColor(UI.color.aproxGoal)
										love.graphics.rectangle( "fill", 0, whereToY, 800, 480-whereToY)
										love.graphics.setColor( 255, 255, 255, 255 )
									else
										love.graphics.setColor(UI.color.percentage)
										love.graphics.rectangle( "fill", 0, whereToY, 800, 480-whereToY)
										love.graphics.setColor( 255, 255, 255, 255 )
									end
								end
							end
						end
					end

				end


				if theLevelUsed == 0 then
					--check if there's a level 1 goal
					if goal[selectedGoal[1]] ~= nil then
						if maxViewingGoal == 0 then maxViewingGoal = 1 end
						if manuallyViewingGoalSelected == 0 or manuallyViewingGoalSelected == 1 then
							viewingGoalSelected = 1
							theGoal = goal[selectedGoal[1]]
							theLevelUsed = 1
							if goal[selectedGoal[1]].type == "specific" then
								love.graphics.setColor(UI.color.aproxGoal)
								love.graphics.rectangle( "fill", 0, whereToY, 800, 480-whereToY)
								love.graphics.setColor( 255, 255, 255, 255 )
							else
								love.graphics.setColor(UI.color.percentage)
								love.graphics.rectangle( "fill", 0, whereToY, 800, 480-whereToY)
								love.graphics.setColor( 255, 255, 255, 255 )
							end
						end
					end
				end
				whereToY = whereToY + 18
				local widthOfBlocks = 266

		love.graphics.setLineWidth(4)
			love.graphics.setColor(20,20,20,255)
			if levelCheck ~= 0 then
				for levelCheck = 3, 1, -1 do

						if levelCheck ~= viewingGoalSelected then
							if levelCheck == 1 then
								if goal[selectedGoal[1]] ~= nil then
									if goal[selectedGoal[1]].type == "specific" then
										love.graphics.setColor(UI.color.aproxGoal)
									else
										love.graphics.setColor(UI.color.percentage)
									end
								end
							elseif levelCheck == 2 then
								if goal[selectedGoal[1]] ~= nil then
									if goal[selectedGoal[1]].goal ~= nil then
										if goal[selectedGoal[1]].goal[selectedGoal[2]]~= nil then
											if goal[selectedGoal[1]].goal[selectedGoal[2]].type == "specific" then
												love.graphics.setColor(UI.color.aproxGoal)
											else
												love.graphics.setColor(UI.color.percentage)
											end
										end
									end
								end
							elseif levelCheck == 3 then
								if goal[selectedGoal[1]] ~= nil then
									if goal[selectedGoal[1]].goal ~= nil then
										if goal[selectedGoal[1]].goal[selectedGoal[2]] ~= nil then
											if goal[selectedGoal[1]].goal[selectedGoal[2]].goal ~= nil then
												if goal[selectedGoal[1]].goal[selectedGoal[2]].goal[selectedGoal[3]] ~= nil then
													love.graphics.setColor(UI.color.aproxGoal)
												end
											end
										end
									end
								end
							end

							love.graphics.rectangle("fill", widthOfBlocks*(levelCheck-1), whereToY, widthOfBlocks, 50)
							love.graphics.setColor(20,20,20,255)
							love.graphics.rectangle("line", widthOfBlocks*(levelCheck-1), whereToY, widthOfBlocks, 50)
						else

							love.graphics.line(widthOfBlocks*(levelCheck-1), whereToY, widthOfBlocks*levelCheck, whereToY)

						end
						if levelCheck == 3 and levelCheck <= maxViewingGoal then
							love.graphics.printf(goal[selectedGoal[1]].goal[selectedGoal[2]].goal[selectedGoal[3]].name,widthOfBlocks*(levelCheck-1),whereToY+2,widthOfBlocks,'center')
						elseif levelCheck == 2 and levelCheck <= maxViewingGoal then
							love.graphics.printf(goal[selectedGoal[1]].goal[selectedGoal[2]].name,widthOfBlocks*(levelCheck-1),whereToY+2,widthOfBlocks,'center')
						elseif levelCheck == 1 and levelCheck <= maxViewingGoal then
							love.graphics.printf(goal[selectedGoal[1]].name,widthOfBlocks*(levelCheck-1),whereToY+2,widthOfBlocks,'center')
						end

				end
			end

			local numberBox = 25
			local wordBox = 100
			local boxHeight = 44

			local introductorySpaceY = 70
			local spaceY = 70
			whereToY = whereToY + introductorySpaceY
			local beforeWhereToY = whereToY
			if theLevelUsed ~= 0 and theGoal ~= nil then
				if viewingGoals and editingGoals and not(editingDescription) then
					--if both viewing and editing
	--==============================================================================
					local startingXDistance = 1

	----------drawing and detecting the name of the goal----------------------------
					local xDistance = startingXDistance
					whereToY= beforeWhereToY

					local whatToPrint = "Name: "
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					love.graphics.print(whatToPrint, xDistance, whereToY)
					xDistance = xDistance + lengthOfIt

					if keyboardTarget == "name" then
						whatToPrint = keyboardClipboard.."_"
					else
						whatToPrint = theGoal.name
					end
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					lengthOfIt= lengthOfIt+12
					local whichIsBigger = nil
					if lengthOfIt < wordBox then
						love.graphics.setColor(50,50,50,170)
						love.graphics.rectangle('fill', xDistance, whereToY, wordBox, boxHeight)
						love.graphics.setColor(20,20,20,200)
						love.graphics.rectangle('line', xDistance, whereToY, wordBox, boxHeight)
						whichIsBigger = wordBox
					else
						love.graphics.setColor(50,50,50,170)
						love.graphics.rectangle('fill', xDistance, whereToY, lengthOfIt, boxHeight)
						love.graphics.setColor(20,20,20,200)
						love.graphics.rectangle('line', xDistance, whereToY, lengthOfIt, boxHeight)
						whichIsBigger = lengthOfIt
					end
					love.graphics.setColor(255,255,255,255)
					love.graphics.print(whatToPrint, xDistance+5, whereToY)
					love.graphics.setColor(0,0,0,255)

					if addClickingBoxes == true then
						local aNewClickingBox = {
							x1 = xDistance,
							x2 = whichIsBigger,--this will be just the additions to the 1s
							y1 = whereToY,
							y2 = boxHeight,--this will be just the additions to the 1s
							keyboardTarget = "name",
							keyboardClipboard = theGoal.name,
							keyboardTable = theGoal,
							somethingElse = "",
							where = "theGoalEditing"
						}
						table.insert(clickingBox,aNewClickingBox)
					end

	----------ending of drawing and detecting the name of the goal------------------

	----------mandatory by starts being drawn here----------------------------------
					local xDistance = 366

					local whatToPrint = "Mandatory by:"
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					love.graphics.print(whatToPrint, xDistance, whereToY)
					xDistance = xDistance + lengthOfIt + 10


					local whatToPrint = " "
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					love.graphics.print(whatToPrint, xDistance, whereToY)
					xDistance = xDistance + lengthOfIt

					--draw the tick box for mandatoryBy here!!!!!!!!!!!!!
					if theGoal.mandatoryBy.year == 9999 then
						whatToPrint = ""
					else
						whatToPrint = "x"
					end
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					lengthOfIt= lengthOfIt+5

					love.graphics.setColor(50,50,50,170)
					love.graphics.rectangle('fill', xDistance, whereToY, numberBox, boxHeight)
					love.graphics.setColor(20,20,20,200)
					love.graphics.rectangle('line', xDistance, whereToY, numberBox, boxHeight)
					whichIsBigger = numberBox

					love.graphics.setColor(255,255,255,255)
					love.graphics.print(whatToPrint, xDistance+5, whereToY)
					love.graphics.setColor(0,0,0,255)

					if addClickingBoxes == true then
						local aNewClickingBox = {
							x1 = xDistance,
							x2 = whichIsBigger,--this will be just the additions to the 1s
							y1 = whereToY,
							y2 = boxHeight,--this will be just the additions to the 1s
							keyboardTarget = "name",
							keyboardClipboard = theGoal.name,
							keyboardTable = theGoal,
							somethingElse = "mandatoryByBool",
							where = "theGoalEditing"
						}
						table.insert(clickingBox,aNewClickingBox)
					end


					xDistance = 366
					whereToY = whereToY + spaceY

					local whatToPrint = "y"
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					love.graphics.print(whatToPrint, xDistance, whereToY)
					xDistance = xDistance + lengthOfIt+1

					if keyboardTarget == "year" then
						whatToPrint = keyboardClipboard.."_"
					else
						whatToPrint = theGoal.mandatoryBy.year
					end
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					lengthOfIt= lengthOfIt+12
					local whichIsBigger = nil
					if lengthOfIt < numberBox then
						love.graphics.setColor(50,50,50,170)
						love.graphics.rectangle('fill', xDistance, whereToY, numberBox, boxHeight)
						love.graphics.setColor(20,20,20,200)
						love.graphics.rectangle('line', xDistance, whereToY, numberBox, boxHeight)
						whichIsBigger = numberBox
					else
						love.graphics.setColor(50,50,50,170)
						love.graphics.rectangle('fill', xDistance, whereToY, lengthOfIt, boxHeight)
						love.graphics.setColor(20,20,20,200)
						love.graphics.rectangle('line', xDistance, whereToY, lengthOfIt, boxHeight)
						whichIsBigger = lengthOfIt
					end
					love.graphics.setColor(255,255,255,255)
					love.graphics.print(whatToPrint, xDistance+5, whereToY)
					love.graphics.setColor(0,0,0,255)

					if addClickingBoxes == true then
						local aNewClickingBox = { -- = +if not(popupTable.shown) and thisClickingBox.keyboardTable.mandatoryBy.year ~= 9999
							x1 = xDistance,
							x2 = whichIsBigger,--this will be just the additions to the 1s
							y1 = whereToY,
							y2 = boxHeight,--this will be just the additions to the 1s
							keyboardTarget = "year",
							keyboardClipboard = theGoal.mandatoryBy.year,
							keyboardTable = theGoal.mandatoryBy,
							somethingElse = "mandatoryByDate",
							where = "theGoalEditing"
						}
						table.insert(clickingBox,aNewClickingBox)
					end


					xDistance = xDistance + lengthOfIt + 10

					local whatToPrint = "m"
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					love.graphics.print(whatToPrint, xDistance, whereToY)
					xDistance = xDistance + lengthOfIt+1

					if keyboardTarget == "month" then
						whatToPrint = keyboardClipboard.."_"
					else
						whatToPrint = theGoal.mandatoryBy.month
						whatToPrint = string.format("%02d", whatToPrint)
					end
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					lengthOfIt= lengthOfIt+12
					local whichIsBigger = nil
					if lengthOfIt < numberBox then
						love.graphics.setColor(50,50,50,170)
						love.graphics.rectangle('fill', xDistance, whereToY, numberBox, boxHeight)
						love.graphics.setColor(20,20,20,200)
						love.graphics.rectangle('line', xDistance, whereToY, numberBox, boxHeight)
						whichIsBigger = numberBox
					else
						love.graphics.setColor(50,50,50,170)
						love.graphics.rectangle('fill', xDistance, whereToY, lengthOfIt, boxHeight)
						love.graphics.setColor(20,20,20,200)
						love.graphics.rectangle('line', xDistance, whereToY, lengthOfIt, boxHeight)
						whichIsBigger = lengthOfIt
					end
					love.graphics.setColor(255,255,255,255)
					love.graphics.print(whatToPrint, xDistance+5, whereToY)
					love.graphics.setColor(0,0,0,255)

					if addClickingBoxes == true then
						local aNewClickingBox = { -- = +if not(popupTable.shown) and thisClickingBox.keyboardTable.mandatoryBy.year ~= 9999
							x1 = xDistance,
							x2 = whichIsBigger,--this will be just the additions to the 1s
							y1 = whereToY,
							y2 = boxHeight,--this will be just the additions to the 1s
							keyboardTarget = "month",
							keyboardClipboard = theGoal.mandatoryBy.month,
							keyboardTable = theGoal.mandatoryBy,
							somethingElse = "mandatoryByDate",
							where = "theGoalEditing"
						}
						table.insert(clickingBox,aNewClickingBox)
					end


					xDistance = xDistance + lengthOfIt + 10

					local whatToPrint = "d"
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					love.graphics.print(whatToPrint, xDistance, whereToY)
					xDistance = xDistance + lengthOfIt+1

					if keyboardTarget == "day" then
						whatToPrint = keyboardClipboard.."_"
					else
						whatToPrint = theGoal.mandatoryBy.day
						whatToPrint = string.format("%02d", whatToPrint)
					end
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					lengthOfIt= lengthOfIt+12
					local whichIsBigger = nil
					if lengthOfIt < numberBox then
						love.graphics.setColor(50,50,50,170)
						love.graphics.rectangle('fill', xDistance, whereToY, numberBox, boxHeight)
						love.graphics.setColor(20,20,20,200)
						love.graphics.rectangle('line', xDistance, whereToY, numberBox, boxHeight)
						whichIsBigger = numberBox
					else
						love.graphics.setColor(50,50,50,170)
						love.graphics.rectangle('fill', xDistance, whereToY, lengthOfIt, boxHeight)
						love.graphics.setColor(20,20,20,200)
						love.graphics.rectangle('line', xDistance, whereToY, lengthOfIt, boxHeight)
						whichIsBigger = lengthOfIt
					end
					love.graphics.setColor(255,255,255,255)
					love.graphics.print(whatToPrint, xDistance+5, whereToY)
					love.graphics.setColor(0,0,0,255)

					if addClickingBoxes == true then
						local aNewClickingBox = { -- = +if not(popupTable.shown) and thisClickingBox.keyboardTable.mandatoryBy.year ~= 9999
							x1 = xDistance,
							x2 = whichIsBigger,--this will be just the additions to the 1s
							y1 = whereToY,
							y2 = boxHeight,--this will be just the additions to the 1s
							keyboardTarget = "day",
							keyboardClipboard = theGoal.mandatoryBy.day,
							keyboardTable = theGoal.mandatoryBy,
							somethingElse = "mandatoryByDate",
							where = "theGoalEditing"
						}
						table.insert(clickingBox,aNewClickingBox)
					end


					xDistance = xDistance + lengthOfIt + 10

					local whatToPrint = "h"
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					love.graphics.print(whatToPrint, xDistance, whereToY)
					xDistance = xDistance + lengthOfIt+1

					if keyboardTarget == "hour" then
						whatToPrint = keyboardClipboard.."_"
					else
						whatToPrint = theGoal.mandatoryBy.hour
						whatToPrint = string.format("%02d", whatToPrint)
					end
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					lengthOfIt= lengthOfIt+12
					local whichIsBigger = nil
					if lengthOfIt < numberBox then
						love.graphics.setColor(50,50,50,170)
						love.graphics.rectangle('fill', xDistance, whereToY, numberBox, boxHeight)
						love.graphics.setColor(20,20,20,200)
						love.graphics.rectangle('line', xDistance, whereToY, numberBox, boxHeight)
						whichIsBigger = numberBox
					else
						love.graphics.setColor(50,50,50,170)
						love.graphics.rectangle('fill', xDistance, whereToY, lengthOfIt, boxHeight)
						love.graphics.setColor(20,20,20,200)
						love.graphics.rectangle('line', xDistance, whereToY, lengthOfIt, boxHeight)
						whichIsBigger = lengthOfIt
					end
					love.graphics.setColor(255,255,255,255)
					love.graphics.print(whatToPrint, xDistance+5, whereToY)
					love.graphics.setColor(0,0,0,255)

					if addClickingBoxes == true then
						local aNewClickingBox = { -- = +if not(popupTable.shown) and thisClickingBox.keyboardTable.mandatoryBy.year ~= 9999
							x1 = xDistance,
							x2 = whichIsBigger,--this will be just the additions to the 1s
							y1 = whereToY,
							y2 = boxHeight,--this will be just the additions to the 1s
							keyboardTarget = "hour",
							keyboardClipboard = theGoal.mandatoryBy.hour,
							keyboardTable = theGoal.mandatoryBy,
							somethingElse = "mandatoryByDate",
							where = "theGoalEditing"
						}
						table.insert(clickingBox,aNewClickingBox)
					end


					xDistance = xDistance+lengthOfIt

					local whatToPrint = ":"
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					love.graphics.print(whatToPrint, xDistance, whereToY)
					xDistance = xDistance + lengthOfIt

					if keyboardTarget == "min" then
						whatToPrint = keyboardClipboard.."_"
					else
						whatToPrint = theGoal.mandatoryBy.min
						whatToPrint = string.format("%02d", whatToPrint)
					end
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					lengthOfIt= lengthOfIt+12
					local whichIsBigger = nil
					if lengthOfIt < numberBox then
						love.graphics.setColor(50,50,50,170)
						love.graphics.rectangle('fill', xDistance, whereToY, numberBox, boxHeight)
						love.graphics.setColor(20,20,20,200)
						love.graphics.rectangle('line', xDistance, whereToY, numberBox, boxHeight)
						whichIsBigger = numberBox
					else
						love.graphics.setColor(50,50,50,170)
						love.graphics.rectangle('fill', xDistance, whereToY, lengthOfIt, boxHeight)
						love.graphics.setColor(20,20,20,200)
						love.graphics.rectangle('line', xDistance, whereToY, lengthOfIt, boxHeight)
						whichIsBigger = lengthOfIt
					end
					love.graphics.setColor(255,255,255,255)
					love.graphics.print(whatToPrint, xDistance+5, whereToY)
					love.graphics.setColor(0,0,0,255)

					if addClickingBoxes == true then
						local aNewClickingBox = { -- = +if not(popupTable.shown) and thisClickingBox.keyboardTable.mandatoryBy.year ~= 9999
							x1 = xDistance,
							x2 = whichIsBigger,--this will be just the additions to the 1s
							y1 = whereToY,
							y2 = boxHeight,--this will be just the additions to the 1s
							keyboardTarget = "min",
							keyboardClipboard = theGoal.mandatoryBy.min,
							keyboardTable = theGoal.mandatoryBy,
							somethingElse = "",
							where = "theGoalEditing"
						}
						table.insert(clickingBox,aNewClickingBox)
					end

	----------mandatory by ends being drawn here------------------------------------
					love.graphics.line(366-30, whereToY+55, 800, whereToY+55)

					if theGoal.mandatoryBy.year == 9999 then
						love.graphics.setColor (UI.color.mandatoryTill)
						love.graphics.line(366, whereToY, 800, whereToY+spaceY/1.5)
						love.graphics.line(366, whereToY+spaceY/1.5, 800, whereToY)
						love.graphics.setColor(0,0,0,255)
					end

	----------ticket drawing starts here--------------------------------------------
					xDistance = startingXDistance

					local whatToPrint = "Tickets: "
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					love.graphics.print(whatToPrint, xDistance, whereToY)
					xDistance = xDistance + lengthOfIt

					if keyboardTarget == "ticketAmount" then
						whatToPrint = keyboardClipboard.."_"
					else
						whatToPrint = theGoal.ticketAmount
					end
					local lengthOfIt = randomfont:getWidth(whatToPrint)
					lengthOfIt= lengthOfIt+12
					local whichIsBigger = nil
					if lengthOfIt < numberBox then
						love.graphics.setColor(50,50,50,170)
						love.graphics.rectangle('fill', xDistance, whereToY, numberBox, boxHeight)
						love.graphics.setColor(20,20,20,200)
						love.graphics.rectangle('line', xDistance, whereToY, numberBox, boxHeight)
						whichIsBigger = numberBox
					else
						love.graphics.setColor(50,50,50,170)
						love.graphics.rectangle('fill', xDistance, whereToY, lengthOfIt, boxHeight)
						love.graphics.setColor(20,20,20,200)
						love.graphics.rectangle('line', xDistance, whereToY, lengthOfIt, boxHeight)
						whichIsBigger = lengthOfIt
					end
					love.graphics.setColor(255,255,255,255)
					love.graphics.print(whatToPrint, xDistance+5, whereToY)
					love.graphics.setColor(0,0,0,255)

					if addClickingBoxes == true then
						local aNewClickingBox = { -- = +if not(popupTable.shown) and thisClickingBox.keyboardTable.mandatoryBy.year ~= 9999
							x1 = xDistance,
							x2 = whichIsBigger,--this will be just the additions to the 1s
							y1 = whereToY,
							y2 = boxHeight,--this will be just the additions to the 1s
							keyboardTarget = "ticketAmount",
							keyboardClipboard = theGoal.ticketAmount,
							keyboardTable = theGoal,
							somethingElse = "",
							where = "theGoalEditing"
						}
						table.insert(clickingBox,aNewClickingBox)
					end


					whereToY = whereToY + spaceY
	------------------ticket drawing ends here--------------------------------------

		if theGoal.type == "specific" then
	------------------time per session drawing starts here--------------------------
			xDistance = startingXDistance


			local whatToPrint = "Time per session: "
			local lengthOfIt = randomfont:getWidth(whatToPrint)
			love.graphics.print(whatToPrint, xDistance, whereToY)
			xDistance = xDistance + lengthOfIt

			if keyboardTarget == "amount" then
				whatToPrint = keyboardClipboard.."_"
			else
				whatToPrint = theGoal.aproxTime.amount
			end
			local lengthOfIt = randomfont:getWidth(whatToPrint)
			lengthOfIt= lengthOfIt+12
			local whichIsBigger = nil
			if lengthOfIt < numberBox then
				love.graphics.setColor(50,50,50,170)
				love.graphics.rectangle('fill', xDistance, whereToY, numberBox, boxHeight)
				love.graphics.setColor(20,20,20,200)
				love.graphics.rectangle('line', xDistance, whereToY, numberBox, boxHeight)
				whichIsBigger = numberBox
			else
				love.graphics.setColor(50,50,50,170)
				love.graphics.rectangle('fill', xDistance, whereToY, lengthOfIt, boxHeight)
				love.graphics.setColor(20,20,20,200)
				love.graphics.rectangle('line', xDistance, whereToY, lengthOfIt, boxHeight)
				whichIsBigger = lengthOfIt
			end
			love.graphics.setColor(255,255,255,255)
			love.graphics.print(whatToPrint, xDistance+5, whereToY)
			love.graphics.setColor(0,0,0,255)

			if addClickingBoxes == true then
				local aNewClickingBox = {
					x1 = xDistance,
					x2 = whichIsBigger,--this will be just the additions to the 1s
					y1 = whereToY,
					y2 = boxHeight,--this will be just the additions to the 1s
					keyboardTarget = "amount",
					keyboardClipboard = theGoal.aproxTime.amount,
					keyboardTable = theGoal.aproxTime,
					somethingElse = "smartphoneDown",
					where = "theGoalEditing"
				}
				table.insert(clickingBox,aNewClickingBox)
			end


			xDistance = xDistance + lengthOfIt + 10
			whatToPrint = theGoal.aproxTime.measurement
			local lengthOfIt = randomfont:getWidth(whatToPrint)
			lengthOfIt= lengthOfIt+12
			lengthOfIt = 120
			local whichIsBigger = nil

			love.graphics.setColor(30,30,30,200)
			love.graphics.rectangle('fill', xDistance, whereToY, 130, boxHeight)
			love.graphics.setColor(30,30,30,200)
			love.graphics.rectangle('line', xDistance, whereToY, 130, boxHeight)
			whichIsBigger = lengthOfIt

			love.graphics.setColor(UI.color.percentage)
			love.graphics.print(whatToPrint, xDistance+5, whereToY)
			love.graphics.setColor(0,0,0,255)

			if addClickingBoxes == true then

				local aNewClickingBox = {
					x1 = xDistance,
					x2 = whichIsBigger,--this will be just the additions to the 1s
					y1 = whereToY,
					y2 = boxHeight,--this will be just the additions to the 1s
					keyboardTarget = "name",
					keyboardClipboard = theGoal.name,
					keyboardTable = theGoal,
					somethingElse = "popup",
					where = "theGoalEditing"
				}
				table.insert(clickingBox,aNewClickingBox)

			end
	------------------time per session drawing ends here----------------------------



	------------------done per session drawing starts here--------------------------
			xDistance = startingXDistance
			whereToY = whereToY + spaceY

			local whatToPrint = "Done per session: "
			local lengthOfIt = randomfont:getWidth(whatToPrint)
			love.graphics.print(whatToPrint, xDistance, whereToY)
			xDistance = xDistance + lengthOfIt


			if keyboardTarget == "aproxAmountPerSession" then
				whatToPrint = keyboardClipboard.."_"
			else
				whatToPrint = theGoal.measurement.aproxAmountPerSession
			end
			local lengthOfIt = randomfont:getWidth(whatToPrint)
			lengthOfIt= lengthOfIt+12
			local whichIsBigger = nil
			if lengthOfIt < numberBox then
				love.graphics.setColor(50,50,50,170)
				love.graphics.rectangle('fill', xDistance, whereToY, numberBox, boxHeight)
				love.graphics.setColor(20,20,20,200)
				love.graphics.rectangle('line', xDistance, whereToY, numberBox, boxHeight)
				whichIsBigger = numberBox
			else
				love.graphics.setColor(50,50,50,170)
				love.graphics.rectangle('fill', xDistance, whereToY, lengthOfIt, boxHeight)
				love.graphics.setColor(20,20,20,200)
				love.graphics.rectangle('line', xDistance, whereToY, lengthOfIt, boxHeight)
				whichIsBigger = lengthOfIt
			end
			love.graphics.setColor(255,255,255,255)
			love.graphics.print(whatToPrint, xDistance+5, whereToY)
			love.graphics.setColor(0,0,0,255)

			if addClickingBoxes == true then
				local aNewClickingBox = {
					x1 = xDistance,
					x2 = whichIsBigger,--this will be just the additions to the 1s
					y1 = whereToY,
					y2 = boxHeight,--this will be just the additions to the 1s
					keyboardTarget = "aproxAmountPerSession",
					keyboardClipboard = theGoal.measurement.aproxAmountPerSession,
					keyboardTable = theGoal.measurement,
					somethingElse = "smartphoneDown",
					where = "theGoalEditing"
				}
				table.insert(clickingBox,aNewClickingBox)
			end


			xDistance = xDistance + lengthOfIt+10
			love.graphics.print("/", xDistance, whereToY)
			lengthOfIt = randomfont:getWidth("/")
			xDistance = xDistance + lengthOfIt+10

	--theGoal.measurement.amountTotal..theGoal.measurement.measurement
			if keyboardTarget == "amountTotal" then
				whatToPrint = keyboardClipboard.."_"
			else
				whatToPrint = theGoal.measurement.amountTotal
			end
			local lengthOfIt = randomfont:getWidth(whatToPrint)
			lengthOfIt= lengthOfIt+12
			local whichIsBigger = nil
			if lengthOfIt < numberBox then
				love.graphics.setColor(50,50,50,170)
				love.graphics.rectangle('fill', xDistance, whereToY, numberBox, boxHeight)
				love.graphics.setColor(20,20,20,200)
				love.graphics.rectangle('line', xDistance, whereToY, numberBox, boxHeight)
				whichIsBigger = numberBox
			else
				love.graphics.setColor(50,50,50,170)
				love.graphics.rectangle('fill', xDistance, whereToY, lengthOfIt, boxHeight)
				love.graphics.setColor(20,20,20,200)
				love.graphics.rectangle('line', xDistance, whereToY, lengthOfIt, boxHeight)
				whichIsBigger = lengthOfIt
			end
			love.graphics.setColor(255,255,255,255)
			love.graphics.print(whatToPrint, xDistance+5, whereToY)
			love.graphics.setColor(0,0,0,255)

			if addClickingBoxes == true then
				local aNewClickingBox = {
					x1 = xDistance,
					x2 = whichIsBigger,--this will be just the additions to the 1s
					y1 = whereToY,
					y2 = boxHeight,--this will be just the additions to the 1s
					keyboardTarget = "amountTotal",
					keyboardClipboard = theGoal.measurement.amountTotal,
					keyboardTable = theGoal.measurement,
					somethingElse = "smartphoneDown",
					where = "theGoalEditing"
				}
				table.insert(clickingBox,aNewClickingBox)
			end


			xDistance = xDistance + lengthOfIt + 10

			if keyboardTarget == "measurement" then
				whatToPrint = keyboardClipboard.."_"
			else
				whatToPrint = theGoal.measurement.measurement
			end
			local lengthOfIt = randomfont:getWidth(whatToPrint)
			lengthOfIt= lengthOfIt+12
			local whichIsBigger = nil
			if lengthOfIt < wordBox then
				love.graphics.setColor(50,50,50,170)
				love.graphics.rectangle('fill', xDistance, whereToY, wordBox, boxHeight)
				love.graphics.setColor(20,20,20,200)
				love.graphics.rectangle('line', xDistance, whereToY, wordBox, boxHeight)
				whichIsBigger = wordBox
			else
				love.graphics.setColor(50,50,50,170)
				love.graphics.rectangle('fill', xDistance, whereToY, lengthOfIt, boxHeight)
				love.graphics.setColor(20,20,20,200)
				love.graphics.rectangle('line', xDistance, whereToY, lengthOfIt, boxHeight)
				whichIsBigger = lengthOfIt
			end
			love.graphics.setColor(255,255,255,255)
			love.graphics.print(whatToPrint, xDistance+5, whereToY)
			love.graphics.setColor(0,0,0,255)

			if addClickingBoxes == true then
				local aNewClickingBox = {
					x1 = xDistance,
					x2 = whichIsBigger,--this will be just the additions to the 1s
					y1 = whereToY,
					y2 = boxHeight,--this will be just the additions to the 1s
					keyboardTarget = "measurement",
					keyboardClipboard = theGoal.measurement.measurement,
					keyboardTable = theGoal.measurement,
					somethingElse = "smartphoneDown",
					where = "theGoalEditing"
				}
				table.insert(clickingBox,aNewClickingBox)
			end

	------------------done per session drawing ends here----------------------------
	else
		-- you have to add up the missing Y space
		whereToY = whereToY + spaceY
	end

		whereToY = whereToY + spaceY
		xDistance = startingXDistance

		love.graphics.line(xDistance, whereToY-8, 800, whereToY-10)
		love.graphics.printf("*-TAP HERE TO EDIT THE DESCRIPTION!-*",
	xDistance, whereToY, 800, 'center')

	if addClickingBoxes == true then
		local aNewClickingBox = { -- = as long as yCursor > y1 only! others dont matter
															--editingDescription = true afterwards
			x1 = 0,
			x2 = 0,--this will be just the additions to the 1s
			y1 = whereToY-8,
			y2 = 0,--this will be just the additions to the 1s
			keyboardTarget = "description",
			keyboardClipboard = theGoal.description,
			keyboardTable = theGoal,
			somethingElse = "openDescription",
			where = "theGoalEditing"
		}
		table.insert(clickingBox,aNewClickingBox)
	end

	--==============================================================================
				elseif viewingGoals and editingGoals and editingDescription then
					--if editing description
					love.graphics.printf("*-TAP HERE TO GO BACK!-*", 0, 83+60, 800, 'center')

					if addClickingBoxes == true then
						local aNewClickingBox = { -- = only if it is < y1
						--[[
						this happens:
						keyboardTarget = ""
						keyboardInput = false
						editingDescription = false

						]]
							x1 = 0,
							x2 = 0,--this will be just the additions to the 1s
							y1 = 83+60+50,
							y2 = 0,--this will be just the additions to the 1s
							keyboardTarget = "name",
							keyboardClipboard = theGoal.description,
							keyboardTable = theGoal,
							somethingElse = "closeDescription",
							where = "theGoalEditing"
						}
						table.insert(clickingBox,aNewClickingBox)
					end


					love.graphics.setFont(smallerFont)
					love.graphics.printf(theGoal.description.."_", 0, 83+60+50+5, 800, 'center')
					love.graphics.setFont(randomfont)
	--==============================================================================
				elseif viewingGoals and not(editingGoals) then
					--if just viewing
	--==============================================================================

					local whereToX = 0
					local whereToY = 83+60
					local columnWidth = 266

					--this below is for drawing the labels of the columns
	--==============================================================================
					for theForInt = 1, 3, 1 do
						local whatToPrint = ""
						if theForInt == 1 then
							whatToPrint = "<placeholder>"
						elseif theForInt == 2 then
							whatToPrint = "Description"
						else
							whatToPrint = "Info"
						end

						love.graphics.setColor(0,0,0,140)
						if whatToPrint == viewingGoalPart then
							love.graphics.setColor(0,0,0,175)
							if whatToPrint == "<placeholder>" then
								love.graphics.rectangle('fill', columnWidth*(theForInt-1)+2, whereToY, columnWidth, 45)
							else
								love.graphics.rectangle('fill', columnWidth*(theForInt-1), whereToY, columnWidth, 45)
							end
							love.graphics.setColor(255,255,255,210)
						else
							love.graphics.setLineStyle('rough')
							love.graphics.setLineWidth(2)
							if whatToPrint == "<placeholder>" then
								love.graphics.line(columnWidth*(theForInt-1)+2, whereToY, columnWidth*(theForInt-1)+columnWidth, whereToY)
								love.graphics.line(columnWidth*(theForInt-1)+2, whereToY+45, columnWidth*(theForInt-1)+columnWidth, whereToY+45)
							else
								love.graphics.line(columnWidth*(theForInt-1), whereToY, columnWidth*(theForInt-1)+columnWidth, whereToY)
								love.graphics.line(columnWidth*(theForInt-1), whereToY+45, columnWidth*(theForInt-1)+columnWidth, whereToY+45)
							end
							love.graphics.setLineWidth(1)
							love.graphics.setLineStyle('smooth')
						end
						love.graphics.printf(whatToPrint, columnWidth*(theForInt-1), whereToY, columnWidth, 'center')

--[[
						--this below is temporarily disabled, not sure if necessary at all
						if xCursor >= columnWidth*(theForInt-1) and xCursor <= columnWidth*(theForInt-1)+columnWidth and
						yCursor >= whereToY and yCursor <= whereToY+45 and leftMousePressed == false
						and love.mouse.isDown(1) then
							leftMousePressed = true
							viewingGoalPart = whatToPrint
						end
]]

					end

					--this below is for drawing the column content
	--==============================================================================
					if viewingGoalPart == "Info" then

						local hourOfTheGoal = 0
						local minOfTheGoal = 0
						local mandatoryByString = ""
						local ticketString = ""
						if theGoal.mandatoryBy.year ~= 9999 then
							hourOfTheGoal = theGoal.mandatoryBy.hour
							hourOfTheGoal = string.format("%02d", hourOfTheGoal)
							minOfTheGoal = theGoal.mandatoryBy.min
							minOfTheGoal = string.format("%02d", minOfTheGoal)
							mandatoryByString =
							"You have to complete the goal by: "..hourOfTheGoal..":"..minOfTheGoal.." on the "..
							theGoal.mandatoryBy.day..". day of the "..
							theGoal.mandatoryBy.month..". month of the year ".. theGoal.mandatoryBy.year..
							", which is in approximately "..theGoal.mandatoryBy.roughlyIn.amount.." "..
							theGoal.mandatoryBy.roughlyIn.measurement..". "..newLineString..newLineString
						else
							mandatoryByString = newLineString..newLineString..newLineString
						end

						local sessionOrGoal = "session"
						if theGoal.type == "broad" then
							sessionOrGoal = "goal"
						end
						if theGoal.ticketAmount ~= 0 then
							if theGoal.ticketAmount ~= 1 then
								ticketString = "You will be awarded with ".. theGoal.ticketAmount.." tickets once you complete the "..sessionOrGoal.."."
							else
								ticketString = "You will be awarded with ".. theGoal.ticketAmount.." ticket once you complete the "..sessionOrGoal.."."
							end
						else
							ticketString = "You won't get any tickets from completing this "..sessionOrGoal.."."
						end

						local mainInfoString = ""

					--	local tehPercentage = string.format("%5.2f", theGoal.tracking.percentage)

					local tehPercentage = theGoal.tracking.percentage*100
					tehPercentage = math.floor(tehPercentage)

						if theGoal.type == "specific" then

							--local tehSessionPercentage = string.format("%5.2f", theGoal.measurement.sessionPercentage)

							local tehSessionPercentage = theGoal.measurement.sessionPercentage*100
							tehSessionPercentage = math.floor(tehSessionPercentage)

							mainInfoString = "Total amount to be done: "..
							theGoal.measurement.amountTotal.." "..theGoal.measurement.measurement.."; "..
							"approximate amount done per session of "..theGoal.aproxTime.amount..
							" "..theGoal.aproxTime.measurement..": "..theGoal.measurement.aproxAmountPerSession..
							" "..theGoal.measurement.measurement..", which is "..tehSessionPercentage..
							"% of the goal. So far you have done "..theGoal.measurement.doneSoFar.." "..
							theGoal.measurement.measurement..", which is "..tehPercentage..
							"% of the goal. ".."You'll have to do "..theGoal.tracking.sessionsTillFinished..
							" sessions in order to complete the goal."..newLineString..newLineString

						elseif theGoal.type == "broad" then

							mainInfoString = "This dumb goal consists of: "..
							#theGoal.goal.." goals. ".."You have completed "..tehPercentage..
							"% of this dumb goal. It will take you "..theGoal.tracking.sessionsTillFinished..
							" more sessions of the goals inside the goal until this goal is completed."..
							newLineString..newLineString..newLineString

						end

						whatToPrint = mainInfoString..mandatoryByString..ticketString

						love.graphics.setFont(smallerFont)
						love.graphics.setColor(0,0,0,160)
						love.graphics.printf(whatToPrint, 0, 83+60+50+5, 800, 'center')
						love.graphics.setColor(255,255,255,255)
						love.graphics.setFont(randomfont)

					elseif viewingGoalPart == "Description" then
						if theGoal.description ~= "" then
							love.graphics.setFont(smallerFont)
							love.graphics.setColor(0,0,0,160)
							love.graphics.printf(theGoal.description, 0, 83+60+50+5, 800, 'center')
							love.graphics.setColor(255,255,255,255)
							love.graphics.setFont(randomfont)
						else
							love.graphics.setFont(smallerFont)
							love.graphics.setColor(0,0,0,160)
							love.graphics.printf("<you can add goal descriptions in the edit mode>",
							0, 83+60+50, 800, 'center')
							love.graphics.setColor(255,255,255,255)
							love.graphics.setFont(randomfont)
						end
					elseif viewingGoalPart == "<placeholder>" then

					end
	--==============================================================================
				end
			end
			love.graphics.setCanvas()
		end

		if viewingGoals == false and editingGoals == false and ticketInventoryOpen == false
		and ticketVaultOpen == false then

			love.graphics.setCanvas(awesomecanvas)

			love.graphics.setFont(evenSmallerFont)

			local distanceFromCursor = 10
			local width, wrappedtext = evenSmallerFont:getWrap( descriptionTooltip, 200 )
			local tooltipBoxHeight = #wrappedtext*20

			love.graphics.setColor(0,0,0,160)
			love.graphics.rectangle('fill', xCursor-4+distanceFromCursor, yCursor-4+distanceFromCursor, 208, tooltipBoxHeight)

			love.graphics.setColor(255,255,255,160)
			love.graphics.printf(descriptionTooltip, xCursor+distanceFromCursor, yCursor+distanceFromCursor, 200, 'center')

			love.graphics.setColor(255,255,255,255)
			love.graphics.setFont(randomfont)
			love.graphics.setCanvas()
		end

		if completingAGoal == true then

			if remainingTickets == 0 and wonATicket == 0 then
				local theNewGoalDirectory = ""
				if goal[selectedGoal[1]] ~= nil then
					if goal[selectedGoal[1]].goal ~= nil then
						if goal[selectedGoal[1]].goal[selectedGoal[2]] ~= nil then
							if goal[selectedGoal[1]].goal[selectedGoal[2]].goal ~= nil then
								if goal[selectedGoal[1]].goal[selectedGoal[2]].goal[selectedGoal[3]] ~= nil then
									theNewGoalDirectory = goal[selectedGoal[1]].goal[selectedGoal[2]].goal[selectedGoal[3]]
								end
							end
						end
					end
				end

				if theNewGoalDirectory == "" then
					if goal[selectedGoal[1]] ~= nil then
						if goal[selectedGoal[1]].goal ~= nil then
							if goal[selectedGoal[1]].goal[selectedGoal[2]]~= nil then
								if goal[selectedGoal[1]].goal[selectedGoal[2]].type == "specific" then
									theNewGoalDirectory=goal[selectedGoal[1]].goal[selectedGoal[2]]
								end
							end
						end
					end
				end

				if theNewGoalDirectory == "" then
					if goal[selectedGoal[1]] ~= nil then
						if goal[selectedGoal[1]].type == "specific" then
							theNewGoalDirectory = goal[selectedGoal[1]]
						end
					end
				end

				if theNewGoalDirectory ~= "" then

					if theNewGoalDirectory.measurement.doneSoFar>=theNewGoalDirectory.measurement.amountTotal then

						theNewGoalDirectory.measurement.doneSoFar = 0
						theNewGoalDirectory.fullyCompleted = false
						youCanCheckForPercentageNow = 1
						completingAGoal = false
						save()

					elseif theNewGoalDirectory.partlyCompleted == true then
						theNewGoalDirectory.partlyCompleted = false
						keyboardInput = false
						completingAGoal = false
						save()

					else

						if notChosenTableForCompletion == true then
							notChosenTableForCompletion = false
							keyboardTable = theNewGoalDirectory
						end

						if keyboardInput == false then
							keyboardTarget = "completedAmount"
							keyboardClipboard = ""
							keyboardInput = true
							local rectWidth = 400
							local rectHeight = 300
							local theXOne = (800-rectWidth)/2
							local theXTwo = rectWidth
							local theYOne = ((480-83-rectHeight)/2+83)+8*30+15
							local theYTwo = 40
							love.keyboard.setTextInput(true, theXOne, theYOne , theXTwo, theYTwo)
						end


						love.graphics.setCanvas(awesomecanvas)
						local rectWidth = 400
						local rectHeight = 300
						local rectX = (800-rectWidth)/2
						local rectY = (480-83-rectHeight)/2+83


						love.graphics.setColor(UI.color.tickets)
						love.graphics.rectangle('fill', rectX, rectY, rectWidth, rectHeight)
						love.graphics.setColor(255,255,255,160)

						local whatToPrint = "Smart Doge is pleased that you have completed your task."..
						newLineString.."It is willing to reward you!"..
						newLineString.." But first, could you please input..."..newLineString

						love.graphics.setLineWidth(1)
						love.graphics.setFont(smallerFont)
						love.graphics.printf(whatToPrint, rectX, rectY, rectWidth, 'center')

						if completingAGoalWay == "total" then
							love.graphics.setColor(UI.color.percentage)
							local whatToPrint = "the new total amount of "..theNewGoalDirectory.measurement.measurement
							love.graphics.rectangle('line', rectX, rectY+5*30, rectWidth, 30)
							love.graphics.printf(whatToPrint, rectX, rectY+5*30, rectWidth, 'center')
							love.graphics.setColor(0,0,0,100)
							local whatToPrint = "the number of new "..theNewGoalDirectory.measurement.measurement.." added"
							love.graphics.rectangle('line', rectX, rectY+7*30, rectWidth, 30)
							love.graphics.printf(whatToPrint, rectX, rectY+7*30, rectWidth, 'center')
						elseif completingAGoalWay == "add" then
							love.graphics.setColor(0,0,0,100)
							local whatToPrint = "the new total amount of "..theNewGoalDirectory.measurement.measurement
							love.graphics.rectangle('line', rectX, rectY+5*30, rectWidth, 30)
							love.graphics.printf(whatToPrint, rectX, rectY+5*30, rectWidth, 'center')
							love.graphics.setColor(UI.color.percentage)
							love.graphics.rectangle('line', rectX, rectY+7*30, rectWidth, 30)
							local whatToPrint = "the number of new "..theNewGoalDirectory.measurement.measurement.." added"
							love.graphics.printf(whatToPrint, rectX, rectY+7*30, rectWidth, 'center')
						end

						love.graphics.setColor(255,255,255,255)
						love.graphics.printf(keyboardClipboard.."_ "..theNewGoalDirectory.measurement.measurement,
						 rectX, rectY+8*30+15, rectWidth, 'center')

						love.graphics.setLineWidth(4)
						love.graphics.setColor(UI.color.percentage)
						love.graphics.rectangle('line', rectX, rectY, rectWidth, rectHeight)
						love.graphics.setLineWidth(1)

						love.graphics.setColor(255,255,255,255)
						love.graphics.setCanvas()
					end

				else
					if completingAGoal == true then
						completingAGoal = false
					end
			end


			elseif remainingTickets ~= 0 and wonATicket ~= 0 then

				local rectWidth = 400
				local rectHeight = 300
				local rectX = (800-rectWidth)/2
				local rectY = (480-83-rectHeight)/2+83


				love.graphics.setCanvas(awesomecanvas)

				love.graphics.setLineWidth(4)
				love.graphics.setColor(UI.color.aproxTime)
				love.graphics.rectangle('line', rectX-2, rectY-2, rectWidth+4, rectHeight+3)

				love.graphics.setColor(UI.color.type)
				love.graphics.rectangle('fill', rectX, rectY, rectWidth, rectHeight)
				love.graphics.setColor(UI.color.aproxTime)

				local rarityHandicap = calculateTicketPercentage(wonATicket)
				rarityHandicap = tonumber(rarityHandicap)

				local howManyTickets = ""
				if remainingTickets == 1 then howManyTickets = "And that's all for now!"
				elseif remainingTickets == 2 then
					local actualyRemaining = remainingTickets - 1
					howManyTickets = actualyRemaining.." more ticket left."
				else
					local actualyRemaining = remainingTickets - 1
					howManyTickets = actualyRemaining.." more tickets left."
				end

				local whatToPrint = "You've won a ticket:"..newLineString..newLineString..
				ticketVault[wonATicket].allows.amount.." "..
				ticketVault[wonATicket].allows.measurement.." of "..
				ticketVault[wonATicket].name..", "..rarityHandicap.."%".."!"..
				newLineString..howManyTickets

				love.graphics.setLineWidth(1)
				love.graphics.setFont(randomfont)
				love.graphics.printf(whatToPrint, rectX, rectY, rectWidth, 'center')


				love.graphics.setColor(255,255,255,255)
				love.graphics.setCanvas()

			end

		end



	love.graphics.setColor(255,255,255,255)
	love.graphics.setLineWidth(1)

		end

	--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	if asIfReturnWasPressed and keyboardInput == false then
		asIfReturnWasPressed = false
	end

	if asIfReturnWasPressed == true and keyboardInput == true then
		local dontAllowDescription = false
		if asIfReturnWasPressed == true then
			asIfReturnWasPressed = false
			dontAllowDescription = true
		else
			enterPressed = true
		end

		local dontAllowDescription = false
			enterPressed = true


		if keyboardTarget == "completedAmount" and keyboardInput == true then
			keyboardInput = false
			if keyboardClipboard ~= nil and keyboardClipboard ~= "" then
				local theInputText = string.match(keyboardClipboard, '[0-9]')
				keyboardClipboard = tonumber(keyboardClipboard)
				if completingAGoalWay == "add" then
					keyboardTable.measurement.doneSoFar = keyboardTable.measurement.doneSoFar + keyboardClipboard
					if keyboardTable.measurement.doneSoFar>=keyboardTable.measurement.amountTotal then
						keyboardTable.fullyCompleted = true
						save()
					else
						keyboardTable.partlyCompleted = true
						save()
					end

					if keyboardTable.ticketAmount ~= 0 then
						if ticketVault[1] ~= nil then

							wonATicket = drawATicket()
							addTicketToInventory (wonATicket)

							if remainingTickets ~= 0 then
								remainingTickets = remainingTickets+keyboardTable.ticketAmount
							else
								remainingTickets = keyboardTable.ticketAmount
							end
							save()

						else
							completingAGoal = false
						end
					else
						completingAGoal = false
					end
				else
					keyboardTable.measurement.doneSoFar = keyboardClipboard
					if keyboardTable.measurement.doneSoFar>=keyboardTable.measurement.amountTotal then
						keyboardTable.fullyCompleted = true
						save()
					else
						keyboardTable.partlyCompleted = true
						save()
					end

					if keyboardTable.ticketAmount ~= 0 then
						if ticketVault[1] ~= nil then

							wonATicket = drawATicket()
							addTicketToInventory (wonATicket)

							if remainingTickets ~= 0 then
								remainingTickets = remainingTickets+keyboardTable.ticketAmount
							else
								remainingTickets = keyboardTable.ticketAmount
							end
							save()

						else
							completingAGoal = false
						end
					else
						completingAGoal = false
					end
				end
			end

		elseif keyboardTarget ~= "description" then

			if (keyboardTarget == "ticketAmount" or keyboardTarget =="amount" or
		keyboardTarget == "amountTotal" or keyboardTarget == "aproxAmountPerSession" or
		keyboardTarget == "month" or keyboardTarget == "year" or keyboardTarget == "rarityHandicap" or
		keyboardTarget == "day" or keyboardTarget == "hour" or keyboardTarget == "min") then
			if keyboardClipboard == "" then
				keyboardClipboard = 0
				if keyboardTarget == "month" or keyboardTarget == "day" or keyboardTarget == "rarityHandicap" then
					keyboardClipboard = 1
				end
			end

			keyboardClipboard = tonumber(keyboardClipboard)

		end

		keyboardTable[keyboardTarget] = keyboardClipboard

				keyboardTarget = ""

				keyboardInput = false
		else
			if dontAllowDescription == false then
				--if it is the description being changed
				keyboardTable[keyboardTarget] = keyboardTable[keyboardTarget]..newLineString
			end
		end

		if keyboardInput == true and editingDescription == false then
			love.keyboard.setTextInput(false)
			keyboardInput = false
		end
save()
clickingBox = {}
addClickingBoxes = true

end



	--------------------------------------------------------------------------------
	--keyboard controls-------------------------------------------------------------
	--------------------------------------------------------------------------------
	if not (love.keyboard.isDown( 'backspace' )) and firstBackspaceTimerDone==true then
		firstBackspaceTimerDone=false
		timer[1].free = true
	end


	if not(love.keyboard.isDown( 'return' )) and enterPressed ==true then
		enterPressed = false
	end

	if love.keyboard.isDown( 'escape' ) then
		save()
		love.event.quit(0)
	end


--this is for the android keyboard... currently not working properly


	if keyboardInput == true then
		local enabled = love.keyboard.hasTextInput( )
		if enabled == false then
			love.keyboard.setTextInput(true, 0, 0, 0, 0)
		end
	else
		local enabled = love.keyboard.hasTextInput( )
		if enabled == true then
			love.keyboard.setTextInput(false)
		end
	end

	if addClickingBoxes == true then
		addClickingBoxes = false
	end

	love.graphics.setColor(255,255,255,255)
	love.graphics.setLineWidth(1)
	love.graphics.setCanvas(awesomecanvas)
	popupDraw(xCursor, yCursor)
	love.graphics.setCanvas()




	if updateNotesShown == true then
		love.graphics.setCanvas(awesomecanvas)

		love.graphics.setColor(0,0,0,170)
		local w = love.graphics.getWidth()
		local h = love.graphics.getHeight()
		love.graphics.rectangle('fill', 0,0, w,h)
		love.graphics.setColor(255,255,255,255)

		local rectWidth = 400
		local rectHeight = 300+10
		local rectX = (800-rectWidth)/2
		local rectY = (480-83-rectHeight)/2+83


		love.graphics.setColor(UI.color.aproxGoal)
		love.graphics.rectangle('fill', rectX, rectY, rectWidth, rectHeight)


		love.graphics.setFont(introFont)
		love.graphics.setColor(0,0,0,255)
		local theXDrawn = rectX+10
		theXDrawn = math.floor(theXDrawn)
		local theYDrawn = rectY+10
		theYDrawn = math.floor(theYDrawn)
		love.graphics.printf(updateString, theXDrawn, theYDrawn, rectWidth-20, 'center')
		love.graphics.setFont(randomfont)
		love.graphics.setColor(255,255,255,255)

		love.graphics.draw(openingScreen, rectX-145, rectY)
		love.graphics.setCanvas()
	end



end--if not ticketInventoryOpen and ticketVaultOpen == true ends here


function love.keypressed(key, unicode)
    -- ignore non-printable characters (see http://www.ascii-code.com/)
		--printMeThis = unicode

--[[
		if keyboardInput == true then
			love.keyboard.setTextInput(false)
			keyboardInput = false
		end
		]]

		if unicode == "acback" then

			if updateNotesShown == true then
				updateNotesShown = false

			elseif editingTicket == true then

				addClickingBoxes = true
				clickingBox = {}--has to be emptied every tim

				ticketVaultOpen = true

				ticketInventoryOpen = false
				editingGoals = false
				editingTicket=false
				viewingGoals = false
				--keyboardInput = false
				completingAGoal = false
				asIfReturnWasPressed = true
				editingDescription = false

			elseif remainingTickets ~= 0 and remainingTickets ~= 1 then

				if remainingTickets >= 2 then
					remainingTickets = remainingTickets - 1
					wonATicket = drawATicket()
					addTicketToInventory (wonATicket)
					save()
				end

			elseif completingAGoal == true then
				completingAGoal = false

			elseif addingSmartGoal or addingDumbGoal then
				addingSmartGoal = false
				addingDumbGoal = false

			elseif ticketVaultOpen == true or ticketInventoryOpen == true then
				addClickingBoxes = true
				clickingBox = {}--has to be emptied every tim

				selectedTicket = {1,1,1}
				editingTicket=false
				ticketInventoryOpen = false
				ticketVaultOpen = false
				editingGoals = false
				viewingGoals = false
				keyboardInput = false
				completingAGoal = false
				asIfReturnWasPressed = true
				editingDescription = false

			elseif editingGoals == true then
				addClickingBoxes = true
				clickingBox = {}--has to be emptied every tim

				manuallyViewingGoalSelected = 0
				asIfReturnWasPressed = true
				editingGoals = false
				editingTicket=false
				editingDescription = false
				viewingGoals = false

			elseif viewingGoals == true then
				addClickingBoxes = true
				clickingBox = {}--has to be emptied every tim

				manuallyViewingGoalSelected = 0
				asIfReturnWasPressed = true
				viewingGoals = false
				editingGoals = false
				editingTicket=false
				editingDescription = false

			else
				save()
				love.event.quit()
			end

		end

		if unicode == 'backspace' and keyboardInput == true and timer[1].free == true then
			if love.keyboard.hasKeyRepeat() == false then
				love.keyboard.setKeyRepeat(true)
			end
				if firstBackspaceTimerDone == false then
					timer[1].start(0.5)
					firstBackspaceTimerDone = true
				else
					timer[1].start(0.03)
				end

				if keyboardClipboard ~= "" then
					keyboardClipboard = string.sub (keyboardClipboard, 1, -2)
				end
				if keyboardTarget == "description" then
					if keyboardTable[keyboardTarget] ~= "" then
						keyboardTable[keyboardTarget] = string.sub (keyboardTable[keyboardTarget], 1, -2)
					end
				end

		end

		if unicode == 'return' and keyboardInput == true then

			if love.keyboard.hasKeyRepeat() == true then
				love.keyboard.setKeyRepeat(false)
			end

				local dontAllowDescription = false
					enterPressed = true


				if keyboardTarget == "completedAmount" and keyboardInput == true then
					keyboardInput = false
					--completingAGoal = false
					if keyboardClipboard ~= nil and keyboardClipboard ~= "" then
						local theInputText = string.match(keyboardClipboard, '[0-9]')
						keyboardClipboard = tonumber(keyboardClipboard)
						if completingAGoalWay == "add" then
							keyboardTable.measurement.doneSoFar = keyboardTable.measurement.doneSoFar + keyboardClipboard
							if keyboardTable.measurement.doneSoFar>=keyboardTable.measurement.amountTotal then
								keyboardTable.fullyCompleted = true
								save()
							else
								keyboardTable.partlyCompleted = true
								save()
							end

							if keyboardTable.ticketAmount ~= 0 then
								if ticketVault[1] ~= nil then

									wonATicket = drawATicket()
									addTicketToInventory (wonATicket)

									if remainingTickets ~= 0 then
										remainingTickets = remainingTickets+keyboardTable.ticketAmount
									else
										remainingTickets = keyboardTable.ticketAmount
									end
									save()
								else
									completingAGoal = false
								end
							else
								completingAGoal = false
							end
						else
							keyboardTable.measurement.doneSoFar = keyboardClipboard
							if keyboardTable.measurement.doneSoFar>=keyboardTable.measurement.amountTotal then
								keyboardTable.fullyCompleted = true
								save()
							else
								keyboardTable.partlyCompleted = true
								save()
							end

							if keyboardTable.ticketAmount ~= 0 then
								if ticketVault[1] ~= nil then

									wonATicket = drawATicket()
									addTicketToInventory (wonATicket)

									if remainingTickets ~= 0 then
										remainingTickets = remainingTickets+keyboardTable.ticketAmount
									else
										remainingTickets = keyboardTable.ticketAmount
									end
									save()
								else
									completingAGoal = false
								end
							else
								completingAGoal = false
							end
						end
					end

				elseif keyboardTarget ~= "description" then

					if (keyboardTarget == "ticketAmount" or keyboardTarget =="amount" or
				keyboardTarget == "amountTotal" or keyboardTarget == "aproxAmountPerSession" or
				keyboardTarget == "month" or keyboardTarget == "year" or keyboardTarget == "rarityHandicap" or
				keyboardTarget == "day" or keyboardTarget == "hour" or keyboardTarget == "min") then
				 	if keyboardClipboard == "" then
						keyboardClipboard = 0
						if keyboardTarget == "month" or keyboardTarget == "day" or keyboardTarget == "rarityHandicap" then
							keyboardClipboard = 1
						end
					end

					keyboardClipboard = tonumber(keyboardClipboard)

				end

				keyboardTable[keyboardTarget] = keyboardClipboard

						keyboardTarget = ""

						keyboardInput = false
				else
					if dontAllowDescription == false then
						--if it is the description being changed
						keyboardTable[keyboardTarget] = keyboardTable[keyboardTarget]..newLineString
					end
				end

				if keyboardInput == true and editingDescription == false then
					love.keyboard.setTextInput(false)
					keyboardInput = false
				end
		save()
		clickingBox = {}
		addClickingBoxes = true
		end

end





function love.textinput( theInputText )
	if keyboardInput == true then
		if theInputText ~= "~" then
			if keyboardTarget == "name" then
				if editingTicket == false then
					local testingWidth = keyboardClipboard..theInputText
					local lengthOfIt = smallerFont:getWidth(testingWidth)
					if lengthOfIt <= 150 then
						keyboardClipboard = keyboardClipboard..theInputText
					end
				else
					keyboardClipboard = keyboardClipboard..theInputText
				end
			elseif keyboardTarget == "measurement" then
					local testingWidth = keyboardClipboard..theInputText
					local lengthOfIt = evenSmallerFont:getWidth(testingWidth)
					if lengthOfIt <= 55 then
						keyboardClipboard = keyboardClipboard..theInputText
					end
			elseif keyboardTarget == "completedAmount" or keyboardTarget == "rarityHandicap" then
				theInputText = string.match(theInputText, '[0-9]')
				theInputText = tonumber(theInputText)
				if theInputText ~= nil and theInputText ~= " " and theInputText ~= "" then
					keyboardClipboard=keyboardClipboard..theInputText
					keyboardClipboard = tonumber(keyboardClipboard)
					if keyboardClipboard == 0 then keyboardClipboard = 1 end
				end
			elseif keyboardTarget == "amount" or keyboardTarget == "amountTotal" or
			keyboardTarget == "aproxAmountPerSession" then
				theInputText = string.match(theInputText, '[0-9]')
				theInputText = tonumber(theInputText)
				if theInputText ~= nil then
					if keyboardClipboard ~= "" then
					keyboardClipboard = tonumber(keyboardClipboard)
					local testingNumber = keyboardClipboard..theInputText
					testingNumber = tonumber(testingNumber)
						if testingNumber < 999999 then
							keyboardClipboard = keyboardClipboard..theInputText
							keyboardClipboard=tonumber(keyboardClipboard)
						end
					else
						keyboardClipboard = keyboardClipboard..theInputText
						keyboardClipboard=tonumber(keyboardClipboard)
					end
				end
			elseif keyboardTarget == "day" then
				theInputText = string.match(theInputText, '[0-9]')
				theInputText = tonumber(theInputText)
				if theInputText ~= nil then
					if keyboardClipboard ~= "" then
					keyboardClipboard = tonumber(keyboardClipboard)
					local testingNumber = keyboardClipboard..theInputText
					testingNumber = tonumber(testingNumber)
						if testingNumber < 32 then
							keyboardClipboard = keyboardClipboard..theInputText
							keyboardClipboard=tonumber(keyboardClipboard)
						end
					else
						keyboardClipboard = keyboardClipboard..theInputText
						keyboardClipboard=tonumber(keyboardClipboard)
					end
				end
			elseif keyboardTarget == "month" then
				theInputText = string.match(theInputText, '[0-9]')
				theInputText = tonumber(theInputText)
				if theInputText ~= nil then
					if keyboardClipboard ~= "" then
						keyboardClipboard = tonumber(keyboardClipboard)
						local testingNumber = keyboardClipboard..theInputText
						testingNumber = tonumber(testingNumber)
						if testingNumber < 13 then
							keyboardClipboard = keyboardClipboard..theInputText
							keyboardClipboard=tonumber(keyboardClipboard)
						end
					else
						keyboardClipboard = keyboardClipboard..theInputText
						keyboardClipboard=tonumber(keyboardClipboard)
					end
				end
			elseif keyboardTarget == "year" then
				theInputText = string.match(theInputText, '[0-9]')
				theInputText = tonumber(theInputText)
				if theInputText ~= nil then
					if keyboardClipboard ~= "" then
						keyboardClipboard = tonumber(keyboardClipboard)
						local testingNumber = keyboardClipboard..theInputText
						testingNumber = tonumber(testingNumber)
						if testingNumber < 9999 then
							keyboardClipboard = keyboardClipboard..theInputText
							keyboardClipboard=tonumber(keyboardClipboard)
						end
					else
						keyboardClipboard = keyboardClipboard..theInputText
						keyboardClipboard=tonumber(keyboardClipboard)
					end
				end
			elseif keyboardTarget == "hour" then
				theInputText = string.match(theInputText, '[0-9]')
				theInputText = tonumber(theInputText)
				if theInputText ~= nil then
					if keyboardClipboard ~= "" then
					keyboardClipboard = tonumber(keyboardClipboard)
					local testingNumber = keyboardClipboard..theInputText
					testingNumber = tonumber(testingNumber)
						if testingNumber < 25 then
							keyboardClipboard = keyboardClipboard..theInputText
							keyboardClipboard=tonumber(keyboardClipboard)
						end
					else
						keyboardClipboard = keyboardClipboard..theInputText
						keyboardClipboard=tonumber(keyboardClipboard)
					end
				end
			elseif keyboardTarget == "min" then
				theInputText = string.match(theInputText, '[0-9]')
				theInputText = tonumber(theInputText)
				if theInputText ~= nil then
					if keyboardClipboard ~= "" then
					keyboardClipboard = tonumber(keyboardClipboard)
					local testingNumber = keyboardClipboard..theInputText
					testingNumber = tonumber(testingNumber)
						if testingNumber < 60 then
							keyboardClipboard = keyboardClipboard..theInputText
							keyboardClipboard=tonumber(keyboardClipboard)
						end
					else
						keyboardClipboard = keyboardClipboard..theInputText
						keyboardClipboard=tonumber(keyboardClipboard)
					end
				end
			elseif keyboardTarget == "ticketAmount" then
				theInputText = string.match(theInputText, '[0-9]')
				theInputText = tonumber(theInputText)
				if theInputText ~= nil then
					keyboardClipboard = theInputText
					keyboardClipboard=tonumber(keyboardClipboard)
				end
			elseif keyboardTarget == "description" then
				keyboardTable[keyboardTarget] = keyboardTable[keyboardTarget]..theInputText
				save()
			else
				keyboardClipboard = keyboardClipboard..theInputText
			end
		end
	end

	if youCanCheckForPercentageNow == 1 then
		youCanCheckForPercentageNow = 2
	elseif youCanCheckForPercentageNow == 2 then
		youCanCheckForPercentageNow = 0
	end

end


function love.draw()
	drawStuff()
end
