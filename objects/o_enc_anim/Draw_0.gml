if (clap < 3)
	if instance_exists(o_actor_mainpl)
	    o_actor_mainpl.depth = depp;

if (heartdraw == 1)
	if instance_exists(o_actor_mainpl)
		draw_sprite(spr_heartsmall, 0, o_actor_mainpl.x - 5, o_actor_mainpl.y - 13);
	else
		draw_sprite(spr_heartsmall, 0, 0,0);