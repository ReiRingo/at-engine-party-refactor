state=0

options = [
	{
		name: "ITEM",
		selectable: array_length(global.items) > 0,
		state: 1,
	},
	{
		name: "STAT",
		selectable: true,
		state: 2,
	},
	{
		name: "CELL",
		selectable: true,
		state: 3,
	},
]

selection = -1

for (var i=0; i<array_length(options); i++){
	if (options[i].selectable)
	{
		selection=i
		break
	}
}

depth=DEPTH_UI.MENU_UI
o_actor_mainpl.moveable = false