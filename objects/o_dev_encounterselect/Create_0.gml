encounters = [
				new enc_set_test(),
				new ex_enc_set_duo(),
			]
cant_use   = [] // in-case you want a encounter not to be able to be started for some reason?
list       = array_concat(cant_use,encounters)

selection      = 0
scroll_current = 0
soul_y         = 0
menu_surface   = -1

if instance_exists(o_actor_mainpl)
	o_actor_mainpl.moveable=false
	
depth = DEPTH_UI.CONSOLE