on run {input, parameters}
	
	-- Make sure a presentation is opened in Keynote. If not, notify the user and stop.
	tell application "Keynote"
		if (front document exists) = false then
			display alert "Unable to proceed." message "Please open a presentation in Keynote."
			return
		end if
		
		set dialogResult to display dialog ¬
			"Are you sure you want to remove presenter notes from all slides? You should duplicate this presentation if you want to maintain a copy of your presenter notes. This action cannot be undone." with icon caution ¬
			buttons {"No", "Yes"} ¬
			default button "No"
		
		-- Target the front presentation.
		if button returned of dialogResult is "Yes" then
			tell front document
				-- Remove all presenter notes
				set presenter notes of every slide to ""
			end tell
		end if
	end tell
	
	return input
end run
