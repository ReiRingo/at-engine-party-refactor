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
		if (!instance_exists(o_dialog)) {
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
			
			alarm[0]=1
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
			alarm[1]=1
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
				else if (is_array(target.result) || is_string(target.result)) {
					var cd = call_dialogue("(sound,snd_ring)* Dialing...",target.result,"(face)* Click")
					Dialogue_Create(cd)
				}
				audio_play_sound(snd_ui_select,1,false)
				state = 0;
				cell_selection=0;
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