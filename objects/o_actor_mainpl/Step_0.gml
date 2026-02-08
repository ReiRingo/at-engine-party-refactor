if (!can_move()) {
	state = PLAYER_STATES.froozen	
} else {state = PLAYER_STATES.free}

if (state == PLAYER_STATES.free) { //Checking if the player is in control
	if (collision_point(bbox_left - 3, bbox_top - 3, o_solidparent, 0, 1) == -4)
	    crumpet = 1;
	else
	    crumpet = 2;

	strumpet = bbox_top;
	trumpet = bbox_left;

	hsp = (InputPressedCheck(INPUT.RIGHT)-InputPressedCheck(INPUT.LEFT))*spd;
	vsp = (InputPressedCheck(INPUT.DOWN)-InputPressedCheck(INPUT.UP))*spd;

	if (InputPressedCheck(INPUT.LEFT) && InputPressedCheck(INPUT.RIGHT)) {hsp = -1*spd}
	if (InputPressedCheck(INPUT.UP)  && InputPressedCheck(INPUT.DOWN))  {vsp = -1*spd}

	direction_animation_fuck() //Face the direction that i go
	collision(o_solidparent)
	frisk_dance();
	direction_animation_fuck() //Just making that look correctly again if i'm in a wall, shitty detail but, ya, and it's important for frisk dance! :DDDDDD

	x += hsp;
	y += vsp;


	if (global.facing == 0)
		sprite_index = dsprite;
	if (global.facing == 1)
		sprite_index = rsprite;
	if (global.facing == 2)
		sprite_index = usprite;
	if (global.facing == 3)
		sprite_index = lsprite;

	if (InputPressed(INPUT.CONFIRM)){
		if (movement==1&&uncan==0){
			var obj=noone
			switch (global.facing){
				case 1:
					obj=collision_rectangle(x + (sprite_width / 2) - sprite_width+10, y + (sprite_height / 2) - sprite_height, x + sprite_width + 15 - sprite_width+10, y + sprite_height - sprite_height,o_interactparent,false,true)
				break
				case 3:
					obj=collision_rectangle(x + (sprite_width / 2) - sprite_width+10, y + 3 + (sprite_height / 2) - sprite_height, x - 15 - sprite_width+10, y + sprite_height + 3 - sprite_height,o_interactparent,false,true)
				break
				case 0:
					obj=collision_rectangle(x + 4 - sprite_width+10, y + 20 - sprite_height, (x + sprite_width) - 4 - sprite_width+10, y + sprite_height + 15 - sprite_height,o_interactparent,false,true)
				break
				case 2:
					obj=collision_rectangle(x + 4 - sprite_width+10, (y + sprite_height) - 5 -sprite_height, (x + sprite_width) - 4 - sprite_width+10, y + 8 - sprite_height,o_interactparent,false,true)
				break
			}
			if (obj!=noone){
				with (obj){
					interact()
				}
			}
		}
	}
	
}