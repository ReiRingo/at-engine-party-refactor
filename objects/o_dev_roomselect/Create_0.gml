rooms = []
room_names = []
cant_use = [rm_init,rm_battle,rm_shop]

selection = 0
scroll_current = 0
soul_y = 0
menu_surface = -1

filtered = []

var current = room_first
while (current!=-1){
	if (room_exists(current)){
		array_push(rooms,current)
		array_push(room_names,string_lower(room_get_name(current)))
	}
	current = room_next(current)
}

var count = array_length(room_names)
for (var i=0; i<count; i++){
    if (string_pos("",room_names[i])==1){
        array_push(filtered,i)
    }
}

if instance_exists(o_actor_mainpl)
	o_actor_mainpl.moveable=false
	
depth = DEPTH_UI.CONSOLE