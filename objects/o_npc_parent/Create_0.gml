target_inst  = noone;
move_gap     = 12;      // only follow if THIS far away
follow_index = 0;      // 0 being the first, and 1 being the second follower, etc

auto_anim    = true;

auto_face    = true;
sprite       = array_create(4, sprite_exists(sprite_index) ? sprite_index : spr_default);

set_sprite = function(up, down, left, right) {
	sprite[0] = down;
	sprite[1] = right;
	sprite[2] = up;
	sprite[3] = left;
	return true;
}

following = false;

// NPC BEHAVIOUR
move       = {};
move_speed = 3;

dir        = 270;
dir_locked = false;

for (var i = 0; i++ < 4;) { // move struct init
	move[$ (i * 90)] = 0;
}

collision_targ = o_solidparent;

interact = function() {}; // change me