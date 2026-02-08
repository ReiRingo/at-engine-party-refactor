var final_x = destiny.x;
var final_y = destiny.y;

if (instance_exists(destiny.object)) {
	final_x += 	destiny.object.x;
	final_y += 	destiny.object.y;
}
show_debug_message($"x: {final_x} - y: {final_y}")
if (instance_exists(o_actor_mainpl)) {
	o_actor_mainpl.x = final_x;
	o_actor_mainpl.y = final_y;
}