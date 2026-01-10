if (InputPressed(INPUT.CONFIRM)){
	var action=item_actions[item_action_selection].name
	switch (action) {
		case "USE":
			global.items[item_selection].execute()
			array_delete(global.items,item_selection,1)
			instance_destroy()
		break;
		case "INFO":
			var d = instance_create(o_dialog)
			d.text=[
				global.items[item_selection].desc
			]
			instance_destroy()
		break;
		case "DROP":
			var d = instance_create(o_dialog)
			d.text=[
				"* The "+global.items[item_selection].name+" was\nsthrown away."
			]
			array_delete(global.items,item_selection,1)
			instance_destroy()
		break;
	}
}