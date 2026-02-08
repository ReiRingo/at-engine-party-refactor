if (!instance_exists(w)) {w = instance_create(o_warp_manager)}
if (asset_get_type(target_room) == asset_room) {
	w.destiny.room = target_room
}
if (asset_get_type(target_object) == asset_object) {
	w.destiny.object = target_object
}
w.destiny.x = target_x
w.destiny.y = target_y
