frames ++
if (keyboard_check_pressed(vk_f1)) {
	global.debug = !global.debug
	if (global.debug) {
		instance_create(o_dev_debug)	
	} else {instance_destroy(o_dev_debug)}
}

if keyboard_check_pressed(vk_f2) {
	game_restart()
}
	
if (keyboard_check_pressed(vk_f3)) {
	room_restart()
	audio_stop_all()
	global.time=0
	if (global.lang == "en"){
		global.lang = "ja"
	}else
	{
		global.lang = "en"
	}
}

if keyboard_check_pressed(vk_f4) {
	window_set_fullscreen(!window_get_fullscreen())
    if !window_get_fullscreen()
        window_center()
}

if (keyboard_check_pressed(vk_f5)) {
	if (!instance_exists(o_dev_roomselect)) {
		instance_create(o_dev_roomselect,0,0,-9999)
	} else {instance_destroy(o_dev_roomselect)}
}

if (keyboard_check_pressed(vk_f7)){
    file_delete("config.ini")
    audio_play_sound(snd_damage,1,false)
}

if (frames % 30 == 0) {global.time++}

global.room_name=room_get_name(room)
if (global.input_delay > 0) global.input_delay--
