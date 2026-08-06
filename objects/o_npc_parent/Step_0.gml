var old_pos_x = x;
var old_pos_y = y;

if (!following) {
	// NPC BEHAVIOUR
	for (var i = 0; i < 360; i += 90) {
		if (move[$ i]) {
			move[$ i] -= 1;

			var ms = move_speed;
			var hspd = lengthdir_x(ms, i);
			var vspd = lengthdir_y(ms, i);
			var col_targ = collision_targ;

			if (place_meeting(x + hspd, y, col_targ)) {
				while (!place_meeting(x + sign(hspd), y, col_targ)) {
					x += sign(hspd);
				}
				hspd = 0; // stop ze horizontal movement
			}
			x += hspd;
			if (place_meeting(x, y + vspd, col_targ)) {
				while (!place_meeting(x, y + sign(vspd), col_targ)) {
					y += sign(vspd);
				}
				vspd = 0; // stop the vertical movement :^
			}
			y += vspd;

			if (!dir_locked) dir = i;
		}
	}

	if (auto_anim) {
		if (x != old_pos_x || y != old_pos_y) {
			image_speed = 1;
		} else {
			image_speed = 0;
			image_index = 0;
		}
		
		switch(dir) {
			// jambly jambled magic numbers
			case 0   : sprite_index = sprite[1]; break;
			case 90  : sprite_index = sprite[2]; break;
			case 180 : sprite_index = sprite[3]; break;
			
			// 270 bias
			default  :
			case 270 : sprite_index = sprite[0]; break;
		}
	}
}