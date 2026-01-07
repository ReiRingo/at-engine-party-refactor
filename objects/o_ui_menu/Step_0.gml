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
			audio_play_sound(snd_squeak, 1, false);
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
			audio_play_sound(snd_squeak, 1, false);
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
		state=0
	}
}