if (menu==0){
	if (InputPressed(INPUT.DOWN))
		selection++
	if (InputPressed(INPUT.UP))
		selection--

	selection = clamp(selection,0,2)

	if (InputPressed(INPUT.CONFIRM)){
		menu = selection+1
	}
	if (InputPressed(INPUT.CANCEL))
	instance_destroy()
}

if (menu==2){
	if (InputPressed(INPUT.DOWN))
		stats_selection++
	if (InputPressed(INPUT.UP))
		stats_selection--

	stats_selection = clamp(stats_selection,0,array_length(stats_options)-1)

	var option    = stats_options[stats_selection]
	var value     = option.get()
	var min_value = option.min()
	var max_value = option.max()

	if (InputPressedCheck(INPUT.LEFT))
		option.set(value-1)
	if (InputPressedCheck(INPUT.RIGHT))
		option.set(value+1)
}

if (menu!=0){
	if (InputPressed(INPUT.CANCEL)){
		menu            = 0
		stats_selection = 0
	}
}