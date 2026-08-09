if (!can_move() || in_cutscene) {
	state = PLAYER_STATES.froozen	
} else {state = PLAYER_STATES.free}

if (state == PLAYER_STATES.free) { //checking if the player is in control
	hsp = (InputPressedCheck(INPUT.RIGHT)-InputPressedCheck(INPUT.LEFT))*spd;
	vsp = (InputPressedCheck(INPUT.DOWN)-InputPressedCheck(INPUT.UP))*spd;

	if (InputPressedCheck(INPUT.LEFT) && InputPressedCheck(INPUT.RIGHT)) {hsp = 0}
	if (InputPressedCheck(INPUT.UP)  && InputPressedCheck(INPUT.DOWN))  {vsp = -1*spd}

	direction_animation() //face the direction that i go
	
	// Smooth corner sliding for orthogonal movement
	var _slide_amount = spd * 2; // Leniency in pixels for sliding around corners

	if (hsp != 0 && vsp == 0) { // Sliding horizontally
		if (place_meeting(x + hsp, y, o_solidparent)) {
			for (var i = 1; i <= _slide_amount; i++) {
				if (!place_meeting(x + hsp, y - i, o_solidparent)) {
					y -= i;
					break;
				}
				if (!place_meeting(x + hsp, y + i, o_solidparent)) {
					y += i;
					break;
				}
			}
		}
	} else if (vsp != 0 && hsp == 0) { // Sliding vertically
		if (place_meeting(x, y + vsp, o_solidparent)) {
			for (var i = 1; i <= _slide_amount; i++) {
				if (!place_meeting(x - i, y + vsp, o_solidparent)) {
					x -= i;
					break;
				}
				if (!place_meeting(x + i, y + vsp, o_solidparent)) {
					x += i;
					break;
				}
			}
		}
	}

	var _inst_npcs;
	
	_inst_npcs = instance_place(x + hsp, y, o_npc_parent);
	if (instance_exists(_inst_npcs) && !_inst_npcs.following) {
		if (!place_meeting(x, y, _inst_npcs)) {
			hsp = 0;
		}
	}
	
	_inst_npcs = instance_place(x, y + vsp, o_npc_parent);
	if (instance_exists(_inst_npcs) && !_inst_npcs.following) {
		if (!place_meeting(x, y, _inst_npcs)) {
			vsp = 0;
		}
	}
	
	collision(o_solidparent)
	frisk_dance();
	direction_animation() //just making that look correctly again if i'm in a wall, it's important for frisk dance! :DDDDDD

	x += hsp;
	y += vsp;
	
	if (!instance_exists(o_dev_debug)){
		if (InputPressed(INPUT.CONFIRM)){
			if (movement==1){
				var obj=noone
				switch (global.facing){
					case 1:
						obj=collision_rectangle(x + (sprite_width / 2) - sprite_width+10, y + (sprite_height / 2) - sprite_height, x + sprite_width + 15 - sprite_width+10, y + sprite_height - sprite_height,interactables,false,true)
					break
					case 3:
						obj=collision_rectangle(x + (sprite_width / 2) - sprite_width+10, y + 3 + (sprite_height / 2) - sprite_height, x - 15 - sprite_width+10, y + sprite_height + 3 - sprite_height,interactables,false,true)
					break
					case 0:
						obj=collision_rectangle(x + 4 - sprite_width+10, y + 20 - sprite_height, (x + sprite_width) - 4 - sprite_width+10, y + sprite_height + 15 - sprite_height,interactables,false,true)
					break
					case 2:
						obj=collision_rectangle(x + 4 - sprite_width+10, (y + sprite_height) - 5 -sprite_height, (x + sprite_width) - 4 - sprite_width+10, y + 8 - sprite_height,interactables,false,true)
					break
				}
				if (obj!=noone){
					if (!object_childof(obj.object_index, o_npc_parent)) {
						with (obj){
							interact()
						}
					} else {
						if (!obj.following) with(obj) {
							interact();
							var d = round(point_direction(x, y, other.x, other.y) / 90) * 90;
							dir = d;
						}
					}
				}
			}
		}
	}
}
if !(s_override){
    	if (global.facing == 0)
    		sprite_index = dsprite;
    	if (global.facing == 1)
    		sprite_index = rsprite;
    	if (global.facing == 2)
    		sprite_index = usprite;
	    if (global.facing == 3)
	    	sprite_index = lsprite;
}