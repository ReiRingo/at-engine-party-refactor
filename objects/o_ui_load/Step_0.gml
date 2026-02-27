if (InputPressed(INPUT.LEFT)||InputPressed(INPUT.RIGHT)){
	audio_play_sound(snd_ui_move,1,false)
	if (selection!=0)
		selection = 0 // Left
	else
		selection = 1 // Right
}
if (InputPressed(INPUT.CONFIRM)){
	if (section==0){
		if (selection==0){
			time_reg=time_to_mmss(global.time)
			section = 1 // File saved.
			audio_play_sound(snd_save,1,false)
		}else{
			file_delete("config.ini");
			audio_play_sound(snd_damage,1,false)
			section = 2 // Close menu. (Return)
		}
	}else if (section==1){
		instance_destroy()
	}
}
if (InputPressed(INPUT.CANCEL)){
	instance_destroy()
}
if (section == 1 && !loaded_once) {
    var target_room = asset_get_index(global.room_save);
    if (target_room != -1)
		audio_stop_all()
        room_goto(target_room);
    loaded_once = true;
}
if (section != 1) {
    loaded_once = false;
}
