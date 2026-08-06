var _par = target; //object_get_base(target);

if (_par == o_actor_mainpl) {
	if (!move_touch && (!target.moveable || target.state == PLAYER_STATES.froozen)) exit;
}

if (place_meeting(x, y, _par) && !triggered) {
	show_debug_message(_par);
	triggered = true;
	event();
	if (!can_repeat) {
		instance_destroy();
		exit;
	}
}
if (!place_meeting(x, y, _par) && triggered && can_repeat) {
	triggered = false;
}