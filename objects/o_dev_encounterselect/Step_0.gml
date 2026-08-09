var oldsel =selection

if (InputPressed(INPUT.DOWN)){
    selection++
}

if (InputPressed(INPUT.UP)){
    selection--
}

selection = clamp(selection,0,array_length(list)-1)

if (selection != oldsel){
    audio_play_sound(snd_ui_move,1,false)
}

if (InputPressed(INPUT.CONFIRM)){
	if array_contains(cant_use,list[selection]){
		audio_play_sound(snd_ui_deny,1,false)
	}
	else{
		audio_stop_all()
		enc_start(list[selection])
		instance_destroy()
	}
}
if (InputPressed(INPUT.CANCEL))
	instance_destroy()