state=0
prev_state=state
sub_state=0
item_selection=0
item_action_selection=0

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

item_actions = [
	{
		name: "USE",
		selectable: true
	},
	{
		name: "INFO",
		selectable: true
	},
	{
		name: "DROP",
		selectable: true
	},
]

cell_selection = 0;

cells = [
	{
		name: "Toriel",
		selectable: true
	},
	{
		name: "Undyne and Papyrus",
		selectable: true
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