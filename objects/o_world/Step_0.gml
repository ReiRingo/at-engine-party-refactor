frames ++

if keyboard_check_pressed(vk_f2)
	room_restart()
	
if keyboard_check_pressed(vk_f3){
	if global.lang="en"
		global.lang="ja"
	else
		global.lang="en"
		room_restart()
}

if keyboard_check_pressed(vk_f4) {
	window_set_fullscreen(!window_get_fullscreen())
    if !window_get_fullscreen()
        window_center()
}

if frames % 30 == 0
	global.time ++
	
global.room_name=room_get_name(room)