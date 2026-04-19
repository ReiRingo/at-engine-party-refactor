if (!can_move()) {
	state = PLAYER_STATES.froozen	
} else {state = PLAYER_STATES.free}

if (state == PLAYER_STATES.free) { //checking if the player is in control
	hsp = (InputPressedCheck(INPUT.RIGHT)-InputPressedCheck(INPUT.LEFT))*spd;
	vsp = (InputPressedCheck(INPUT.DOWN)-InputPressedCheck(INPUT.UP))*spd;

	if (InputPressedCheck(INPUT.LEFT) && InputPressedCheck(INPUT.RIGHT)) {hsp = 0}
	if (InputPressedCheck(INPUT.UP)  && InputPressedCheck(INPUT.DOWN))  {vsp = -1*spd}

	direction_animation() //face the direction that i go
	
	if (place_meeting(x + hsp, y, o_solidparent)) {
		if(!place_meeting(x+hsp,y-spd,o_solidparent)) {y-=spd}
		if(!place_meeting(x+hsp,y+spd,o_solidparent)) {y+=spd}
	}
	if (place_meeting(x, y+vsp, o_solidparent)) {
		if(!place_meeting(x-spd,y+vsp,o_solidparent)) {x-=spd}
		if(!place_meeting(x+spd,y+vsp,o_solidparent)) {x+=spd}
	}

	
	collision(o_solidparent)
	frisk_dance();
	direction_animation() //just making that look correctly again if i'm in a wall, it's important for frisk dance! :DDDDDD

	x += hsp;
	y += vsp;

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

	if (InputPressed(INPUT.CONFIRM)){
		if (movement==1){
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