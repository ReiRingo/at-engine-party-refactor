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
if (InputPressed(INPUT.UP)){
	if (state==0){
		var old_sel = selection
		var new_sel = selection-1

		while (new_sel >= 0){
			if (options[new_sel].selectable){
				selection = new_sel;
				break;
			}
			new_sel--;
		}

		if (selection != old_sel){
			audio_play_sound(snd_menumove, 1, false);
		}
	}
}

if (InputPressed(INPUT.DOWN)){
	if (state==0){
		var old_sel = selection;
		var new_sel = selection + 1;
		var mx = array_length(options) - 1;

		while (new_sel <= mx){
			if (options[new_sel].selectable){
				selection = new_sel;
				break;
			}
			new_sel++;
		}

		if (selection != old_sel){
			audio_play_sound(snd_menumove, 1, false);
		}
	}
}

if (InputPressed(INPUT.CONFIRM)){
	if (state==0){
		audio_play_sound(snd_select, 1, false);
		state=options[selection].state
	}
}

if (InputPressed(INPUT.CANCEL)){
	if (state==0){
		o_actor_mainpl.moveable = true;
		instance_destroy();
	}else{
		if (sub_state==0)
			state=0
	}
}

if (state==1&&sub_state==0){
	if (InputPressed(INPUT.UP)){
		item_selection=max(0,item_selection-1)
		audio_play_sound(snd_menumove,1,false)
	}
	if (InputPressed(INPUT.DOWN)){
		item_selection=min(array_length(global.items)-1,item_selection+1)
		audio_play_sound(snd_menumove,1,false)
	}
	alarm[0]=1
	if (InputPressed(INPUT.CANCEL)){
		state=0
		item_selection=0
	}
}
if (state==1&&sub_state==1){
	if (InputPressed(INPUT.LEFT)){
		var old_sel=item_action_selection
		var new_sel=item_action_selection-1
		while (new_sel>=0){
			if (item_actions[new_sel].selectable){
				item_action_selection=new_sel
				break
			}
			new_sel--
		}
		if (item_action_selection!=old_sel)
			audio_play_sound(snd_menumove,1,false)
	}
	if (InputPressed(INPUT.RIGHT)) {
		var old_sel=item_action_selection
		var new_sel=item_action_selection+1
		var mx=array_length(item_actions)-1
		while (new_sel<=mx){
			if (item_actions[new_sel].selectable){
				item_action_selection=new_sel
				break
			}
			new_sel++
		}
		if (item_action_selection!=old_sel)
			audio_play_sound(snd_menumove,1,false)
	}
	if (InputPressed(INPUT.CONFIRM)){
		var action=item_actions[item_action_selection].name
		switch (action) {
			case "USE":
			break;
			case "INFO":
			break;
			case "DROP":
			break;
		}
	}
	if (InputPressed(INPUT.CANCEL)){
		sub_state=0
		item_action_selection=0
	}
}
if (state==3){
	if (InputPressed(INPUT.UP)){
		cell_selection=max(0,cell_selection-1)
		audio_play_sound(snd_menumove,1,false)
	}
	if (InputPressed(INPUT.DOWN)){
		cell_selection=min(array_length(cells)-1,cell_selection+1)
		audio_play_sound(snd_menumove,1,false)
	}
	if (InputPressed(INPUT.CONFIRM)){
		var target=cells[cell_selection].name
		audio_play_sound(snd_select,1,false)
	}
	if (InputPressed(INPUT.CANCEL)){
		state=0
	}
}