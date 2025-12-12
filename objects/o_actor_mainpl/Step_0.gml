if (global.facing == 0)
	sprite_index = dsprite;
if (global.facing == 1)
	sprite_index = rsprite;
if (global.facing == 2)
	sprite_index = usprite;
if (global.facing == 3)
	sprite_index = lsprite;

if (collision_point(bbox_left - 3, bbox_top - 3, o_solidparent, 0, 1) == -4)
    crumpet = 1;
else
    crumpet = 2;

strumpet = bbox_top;
trumpet = bbox_left;

if (InputPressedCheck(INPUT.LEFT))
{
    if (movement == 1)
    {
        turned = 1;

		var nx = x - 3;

		if (!place_meeting(nx, y, o_solidparent)) {
			x = nx;
		} else {
			if (!place_meeting(nx, y - 3, o_solidparent) && InputPressedCheck(INPUT.UP))
				y -= 3;
			else if (!place_meeting(nx, y + 3, o_solidparent) && InputPressedCheck(INPUT.DOWN))
				y += 3;
		}

        if (moving != 1)
			image_index = 1;

        moving = 1;
        image_speed = spritespd;

        if (InputPressedCheck(INPUT.UP) && global.facing == 2)
			turned = 0;
        if (InputPressedCheck(INPUT.DOWN) && global.facing == 0)
			turned = 0;

        if (turned == 1)
			global.facing = 3;
    }
}

if (InputPressedCheck(INPUT.RIGHT))
{
    if (movement == 1)
    {
        if (!InputPressedCheck(INPUT.LEFT))
        {
            turned = 1;

            var nx = x - 3;

		if (!place_meeting(nx, y, o_solidparent)) {
			x = nx;
		} else {
			if (!place_meeting(nx, y - 3, o_solidparent) && InputPressedCheck(INPUT.UP))
				y -= 3;
			else if (!place_meeting(nx, y + 3, o_solidparent) && InputPressedCheck(INPUT.DOWN))
				y += 3;
		}

            moving = 1;
            image_speed = spritespd;

            if (moving != 1)
				image_index = 1;

            if (InputPressedCheck(INPUT.UP) && global.facing == 2)
				turned = 0;
            if (InputPressedCheck(INPUT.DOWN) && global.facing == 0)
				turned = 0;

            if (turned == 1)
				global.facing = 1;
        }
    }
}

if (InputPressedCheck(INPUT.UP) && InputPressedCheck(INPUT.DOWN))
{
    var col_bottom = collision_rectangle(bbox_left,bbox_top-5,bbox_right,bbox_top-1,o_solidparent,false,true) > 0
	
    var col_top = collision_rectangle(bbox_left,bbox_bottom-3,bbox_right,bbox_bottom+3,o_solidparent,false,true) > 0

    if (col_bottom && !col_top)
    {
        moving = 1;
        image_speed = spritespd;

        if (global.facing == 0)
            global.facing = 2;
        else
            global.facing = 0;

        exit;
    }
}
if (InputPressedCheck(INPUT.UP))
{
    if (movement == 1)
    {
        turned = 1;

        if !(collision_rectangle(bbox_left, bbox_top - 3, bbox_right, bbox_top - 1, o_solidparent, false, true) > 0)
            y -= 3;

        if (moving != 1)
			image_index = 1;

        moving = 1;
        image_speed = spritespd;

        if (InputPressedCheck(INPUT.RIGHT) && global.facing == 1)
			turned = 0;
        if (InputPressedCheck(INPUT.LEFT) && global.facing == 3)
			turned = 0;

        if (turned == 1)
			global.facing = 2;
    }
}

if (InputPressedCheck(INPUT.DOWN))
{
    if (movement == 1)
    {
        if (!InputPressedCheck(INPUT.UP))
        {
            turned = 1;

            if !(collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 3, o_solidparent, false, true) > 0)
                y += 3;

            if (moving != 1)
				image_index = 1;

            moving = 1;
            image_speed = spritespd;

            if (InputPressedCheck(INPUT.RIGHT) && global.facing == 1)
				turned = 0;
            if (InputPressedCheck(INPUT.LEFT) && global.facing == 3)
				turned = 0;

            if (turned == 1)
				global.facing = 0;
        }
    }
}

if (o_actor_mainpl.moveable == false)
	movement = 0;
else
	movement = 1;