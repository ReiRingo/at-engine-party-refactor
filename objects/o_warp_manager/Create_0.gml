destiny = {
	room: room_next(room),
	object: o_actor_mainpl,
	x: 0,
	y: 0
}

transitioner = instance_create(o_transition);
transitioner.switched_event = function () {
	room_goto(o_warp_manager.destiny.room)
}
