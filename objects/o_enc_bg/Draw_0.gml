{ // bg
	if (o_enc.encounterbg!=BG_TYPE.NOONE){
		if (o_enc.encounterbg==BG_TYPE.DEFAULT)
			draw_sprite_ext(spr_enc_ui_bg,0,320/2-1,122,0.5,0.5,0,c_white,1)
		if (o_enc.encounterbg==BG_TYPE.BOSS)
			draw_sprite_ext(spr_enc_ui_bg,1,320/2-1,122,0.5,0.5,0,c_white,1)
	}
}