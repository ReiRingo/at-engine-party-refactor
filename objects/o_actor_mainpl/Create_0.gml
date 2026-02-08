state = PLAYER_STATES.free;
image_speed = 0;
facing = global.facing;
moving = 0;
movement = 1;
moveable = true;

dsprite = spr_actor_mainpl_d;
rsprite = spr_actor_mainpl_r;
usprite = spr_actor_mainpl_u;
lsprite = spr_actor_mainpl_l;

hsp = 0;
vsp = 0;
spd = 3;

if (global.facing == FACES.DOWN)
	sprite_index = dsprite;
if (global.facing == FACES.RIGHT)
	sprite_index = rsprite;
if (global.facing == FACES.UP)
	sprite_index = usprite;
if (global.facing == FACES.LEFT)
	sprite_index = lsprite;

inwater = 0;
h_skip = 0;
uncan = 0;
m_override = 0;

collision = function(object=o_solidparent) {

	if (place_meeting(x+hsp,y,object)) {
		while (!place_meeting(x+sign(hsp),y,object)) {x += sign(hsp);}
		hsp = 0;
	}

	if (place_meeting(x,y+vsp,object)) {
		while (!place_meeting(x,y+sign(vsp),object)) {y += sign(vsp)}
		vsp = 0
	}
}

direction_animation_fuck = function() { //Namu
	if (hsp != 0 || vsp != 0) {
		if (vsp == 0) {
			if (hsp < 0) {global.facing = FACES.LEFT};
			if (hsp > 0) {global.facing = FACES.RIGHT};
		}

		if (hsp == 0) {
			if (vsp < 0) {global.facing = FACES.UP};
			if (vsp > 0) {global.facing = FACES.DOWN};
		}
	
		if (global.facing = FACES.RIGHT && hsp < 0) {global.facing = FACES.LEFT}	
		if (global.facing = FACES.LEFT && hsp > 0) {global.facing = FACES.RIGHT}
		if (global.facing = FACES.DOWN && vsp < 0) {global.facing = FACES.UP}		
		if (global.facing = FACES.UP && vsp > 0) {global.facing = FACES.DOWN}
	}
}
	
frisk_dance = function() { //Namu
	if (instance_place(x,y-spd,o_solidparent)) {
		if (InputPressedCheck(INPUT.DOWN) && InputPressedCheck(INPUT.UP)) {
			if (global.facing == FACES.LEFT || global.facing == FACES.RIGHT) {global.facing = FACES.DOWN}
			vsp += spd;
		}
	}
}