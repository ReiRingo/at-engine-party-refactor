if (!instance_exists(o_ui_save)&&!instance_exists(o_dialog)){
	if (InputPressed(INPUT.SPECIAL)){
		if (instance_exists(o_ui_menu)){
			instance_destroy(o_ui_menu)
		}else{
			audio_play_sound(snd_squeak,1,false)
			instance_create(o_ui_menu)
		}
	}
}