if (state!=prev_state) {
	switch (state) {
		case 1:
			sub_state=0
			item_selection=0
			item_action_selection=0
		break

		case 3:
			cell_selection=0
		break
	}
	prev_state=state
}


switch(state) {
	case 0:
		if (!instance_exists(o_dialog) && !instance_exists(o_ui_image)) {
			var old_sel = selection;
			if (InputPressed(INPUT.UP)){selection = max(0,selection-1);}
		
			if (InputPressed(INPUT.DOWN)){selection = min(array_length(options)-1,selection+1);}
			if (selection != old_sel){
				audio_play_sound(snd_ui_move, 1, false);
			}
	
			if (InputPressed(INPUT.CONFIRM)){
				if (options[selection].selectable) {
					audio_play_sound(snd_ui_select, 1, false);
					state=options[selection].state
				} else {
					audio_play_sound(snd_ui_deny, 1, false)
				}
			}
			if (InputPressed(INPUT.CANCEL) || InputPressed(INPUT.SPECIAL)) {instance_destroy()}
		}
	break
	
	case 1: // ITEMS
		if (sub_state <= 0) {
			var old_sel = item_selection;
			if (InputPressed(INPUT.UP)){item_selection = max(0,item_selection-1);}
			
			if (InputPressed(INPUT.DOWN)){item_selection = min(array_length(global.items)-1,item_selection+1);}
			if (item_selection != old_sel){
				audio_play_sound(snd_ui_move, 1, false);
			}
			
			if (InputPressed(INPUT.CONFIRM)){
				sub_state=1
				item_action_selection=0
				audio_play_sound(snd_ui_select,1,false)
			}
			
			if (InputPressed(INPUT.CANCEL)){
				state=0
				item_selection=0
			}	
		} else if (sub_state >= 1) {
			var old_sel = item_action_selection;
			if (InputPressed(INPUT.LEFT)){item_action_selection = max(0,item_action_selection-1);}
			
			if (InputPressed(INPUT.RIGHT)){item_action_selection = min(array_length(item_actions)-1,item_action_selection+1);}
			if (item_action_selection != old_sel){
				audio_play_sound(snd_ui_move, 1, false);
			}
			
			if (InputPressed(INPUT.CONFIRM)) {
				var can_procced = true
				var action=item_actions[item_action_selection].name
				var equip_item = function(ITEM) {
					if (ITEM.type == ITEMTYPES.ARMOR) {global.armor = ITEM;}
					if (ITEM.type == ITEMTYPES.WEAPON) {global.weapon = ITEM;}
				}
				switch (action) {
					case "USE":
						if (item_actions[item_action_selection].selectable){
							var ITEM = global.items[item_selection]
							switch(ITEM.type) {
								case ITEMTYPES.ARMOR: case ITEMTYPES.WEAPON:
									if (ITEM.type == ITEMTYPES.ARMOR && is_struct(global.armor))  {array_insert(global.items,item_selection,global.armor)}
									if (ITEM.type == ITEMTYPES.WEAPON && is_struct(global.weapon)) {array_insert(global.items,item_selection,global.weapon)}
	
									equip_item(ITEM)
									Dialogue_Create($"* You equipped the {ItemGetName(ITEM)}.")
						
									array_delete(global.items,item_selection,1)
								break;
					
								case ITEMTYPES.CONSUMEABLE:
									audio_play_sound(snd_heal,0,0)
									global.hp = min(global.hp+ITEM.amount,global.maxhp)
									var t = global.hp >= global.maxhp ? "* Your HP was maxed out." : ""
									Dialogue_Create($"* You ate the {ItemGetName(ITEM)}.\n{t}")
						
									array_delete(global.items,item_selection,1)
								break;
					
								case ITEMTYPES.SPECIAL:
									ITEM.execute();	
									if (ITEM.removeable) {
										array_delete(global.items,item_selection,1)	
									}
								break;
							}
							dialogmade = 1; state = 0; sub_state=0;
						}
						else{
							audio_play_sound(snd_ui_deny,1,false)
						}
					break;

					case "INFO":
						if (item_actions[item_action_selection].selectable){
							Dialogue_Create(global.items[item_selection].description.check)
							dialogmade = 1; state = 0; sub_state=0;
						}
						else{
							audio_play_sound(snd_ui_deny,1,false)
						}
					break;

                
					case "DROP":
						if (item_actions[item_action_selection].selectable){
							Dialogue_Create("* The "+global.items[item_selection].name.normal+" was\nthrown away.")
							array_delete(global.items,item_selection,1)
							dialogmade = 1; state = 0; sub_state=0;
						}
						else{
							audio_play_sound(snd_ui_deny,1,false)
						}
					break;
				}
				if (array_length(global.items) <= 0) {
					options[selection].selectable = false;
				}
			}
			
			
			
			if (InputPressed(INPUT.CANCEL)){
				sub_state=0
				item_action_selection=0
			}
		}
	break;
	

	case 3: // CELL
		var old_sel = cell_selection;
		if (InputPressed(INPUT.UP)){cell_selection=max(0,cell_selection-1)}
		if (InputPressed(INPUT.DOWN)){cell_selection=min(array_length(cells)-1,cell_selection+1)}
		
		if (cell_selection != old_sel) {audio_play_sound(snd_ui_move,1,false)}
		
		if (InputPressed(INPUT.CONFIRM)){
			var target=cells[cell_selection];
			if (target.result != undefined) {
				if (is_method(target.result)) {script_execute(target.result)}
				else {
					Dialogue_Create(target.result)
				}
				audio_play_sound(snd_ui_select,1,false)
				state = 0;
				cell_selection=0;
				dialogmade=1;
			} else {audio_play_sound(snd_ui_deny,1,false)}
		}
		if (InputPressed(INPUT.CANCEL)){
			state=0
		}
	break;
	
	default:
		if (InputPressed(INPUT.CANCEL)){state = 0;}
	break;
}

if (dialogmade)
	if (!instance_exists(o_dialog))
		instance_destroy()
