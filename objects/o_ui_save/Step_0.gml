
if (section==0)
	timereg = time_to_mmss(global.time);

if (InputPressed(INPUT.LEFT)||InputPressed(INPUT.RIGHT)){
	if (selection!=0)
		selection = 0 // Left
	else
		selection = 1 // Right
}
if (InputPressed(INPUT.CONFIRM)){
	if (section==0){
		if (selection==0)
			section = 1 // File saved.
		else
			section = 2 // Close menu. (Return)
	}else if ((section==1)||(section==2)){
		instance_destroy()
		global.console=false
	}
}