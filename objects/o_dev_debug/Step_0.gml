var scroll = mouse_wheel_up() - mouse_wheel_down()

if (scroll != 0) {
	alpha_dialog += scroll * 0.3
	alpha_dialog = clamp(alpha_dialog, 0, 1)
}

if instance_exists(o_dev_owcontrol)
	o_dev_owcontrol.image_alpha=1
	
if instance_exists(o_dev_music)
	o_dev_music.image_alpha=1