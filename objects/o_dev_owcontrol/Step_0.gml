if (can_move()){
	if (InputPressed(INPUT.SPECIAL)){
		if (!instance_exists(o_ui_menu))
			audio_play_sound(snd_ui_move,1,false)
			instance_create(o_ui_menu)
	}
}