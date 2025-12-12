if ((x % 3) == 2)
	x += 1;
if ((x % 3) == 1)
	x -= 1;
if ((y % 3) == 2)
	y += 1;
if ((y % 3) == 1)
	y -= 1;

lastfacing = 0;
nnn = 0;
oldx = x;
oldy = y;
image_speed = 0;
facing = global.facing;
moving = 0;
movement = 1;

dsprite = spr_actor_mainpl_d;
rsprite = spr_actor_mainpl_r;
usprite = spr_actor_mainpl_u;
lsprite = spr_actor_mainpl_l;
spritespd = 0.4;

if (global.facing == 0)
	sprite_index = dsprite;
if (global.facing == 1)
	sprite_index = rsprite;
if (global.facing == 2)
	sprite_index = usprite;
if (global.facing == 3)
	sprite_index = lsprite;

inwater = 0;
h_skip = 0;
uncan = 0;
m_override = 0;