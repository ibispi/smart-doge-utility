function checkPage (aBook, pageContentAmount)
	--it is used for calculating the amount of pages of some table
	--pageContentAmount is amount of things on a page of a table
	--aBook is the name of the table or a number of a page
	--the algorythm can be also used for calculating which page an item belongs to
	local wantedResult = aBook/pageContentAmount
	local roundedAmount = math.floor(wantedResult)
	if roundedAmount < wantedResult then
		wantedResult = roundedAmount+1
	end

	return wantedResult

end

return checkPage
