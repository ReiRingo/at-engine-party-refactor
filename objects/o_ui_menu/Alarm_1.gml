if (InputPressed(INPUT.CONFIRM)){
	var action=item_actions[item_action_selection].name
	switch (action) {
		case "USE":
			global.items[item_selection].execute()
			array_delete(global.items,item_selection,1)
		break;

		case "INFO":
			var d = instance_create(o_dialog)
			d.text=[
				global.items[item_selection].desc
			]
		break;

		case "DROP":
			var i = instance_create(o_dialog)
			i.text=[
				"* The "+global.items[item_selection].name+" was\nthrown away."
			]
			array_delete(global.items,item_selection,1)
		break;
	}
	if (array_length(global.items) <= 0) {
		options[selection].selectable = false;
	}
	
	state = 0; sub_state=0;
}