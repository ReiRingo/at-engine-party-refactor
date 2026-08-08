var oldsel =selection

if (InputPressed(INPUT.DOWN)){
    selection++
}

if (InputPressed(INPUT.UP)){
    selection--
}

selection = clamp(selection,0,array_length(filtered)-1)

if (selection != oldsel){
    audio_play_sound(snd_ui_move,1,false)
}

if (InputPressed(INPUT.CONFIRM)){
    if (array_length(filtered)>0){
		if (array_contains(cant_use,rooms[filtered[selection]])){
			audio_play_sound(snd_ui_deny,1,false)
		}
		else{
	        audio_stop_all()
			audio_play_sound(snd_save,1,false)
	        room_goto(rooms[filtered[selection]])
		}
    }
}