draw_set_font(loc_getfont(font_main));

{ // box
	ui_dialoguebox_create(16,26+4-5,71,55)
	ui_dialoguebox_create(16,84 + 4-5,71,35 + (array_length(options) - 1) * 18 + 3)
}
{ // top box
	draw_text(23,30+4-5,string(global.name))
	
	draw_set_font(font_menu)
	draw_text(23,50-3+4+4-5,"lv")
	draw_text(41,50-3+4+4-5,string(global.lv))
	draw_text(23,59-3+4+4-5,"hp")
	draw_text(41,59-3+4+4-5,$"{string(global.hp)}/{string(global.maxhp)}")
	draw_text(23,68-3+4+4-5,"G")
	draw_text(41,68-3+4+4-5,string(global.gold))
}
{ // options
	draw_set_font(loc_getfont(font_main));
	for (var i = 0; i < array_length(options); ++i) {
		
		if (selection == i && state == 0)
			draw_sprite_ext(spr_ui_soul,0,28,98+18*i+4-5,1,1,0,c_red,1)
			
		if (!options[i].selectable)
            draw_set_color(c_gray)
			
		draw_text_transformed(42,98+18*i+4-4-5,options[i].name,1,1,0)
		draw_set_color(c_white)
	}
}
{ // box for each state
	if (state==1){
		ui_dialoguebox_create(94, 26, 173, 181)
	}else
		if (state==2){
			ui_dialoguebox_create(94, 26-1, 173, 209)
	}else
		if (state==3){
			ui_dialoguebox_create(94, 26, 173, 181)
	}
}
{ // state 1 (ITEM)
	if (state==1){
		var iarr = global.items
		
		for (var i = 0; i < array_length(iarr); ++i) {
				draw_sprite_ext(spr_ui_soul, 0, 116-12, 44 + i*16, 1, 1, 0, c_red, 1)
				draw_text(116, 40 + i*16, iarr[i])
		}
		
		draw_text(116, 180, "USE")
		draw_text(164, 180, "INFO")
		draw_text(221, 180, "DROP")
	}
}
{ // state 2 (STAT)
	if (state==2){
		draw_text(108, 42-1, $"\"{global.name}\"")
		draw_text(108, 72-1, "LV")
		draw_text(128, 72-1, $"{global.lv}")
		draw_text(108, 88-1, "HP")
		draw_text(128, 88-1, $"{global.hp} / {global.maxhp}")
	
		draw_text(108, 120-1, "AT")
		draw_text(128, 120-1, $"{global.att} ({global.attack})")
		draw_text(108, 136-1, "DF")
		draw_text(128, 136-1, $"{global.def} ({global.defense})")
	
		draw_text(192, 120-1, $"EXP: {global.exp}")
		draw_text(192, 136-1, $"NEXT: {global.nextexp}")
	
		draw_text(108, 166-1, $"WEAPON: {global.weapon}")
		draw_text(108, 182-1, $"ARMOR: {global.armor}")
		draw_text(108, 202-1, $"GOLD: {global.gold}")
	}
}
{ // state 3 (CELL)
	if (state==3){
		var iarr = [
			"Toriel",
			"Undyne and Papyrus",
		]
		
		for (var i = 0; i < array_length(iarr); ++i) {
				draw_sprite_ext(spr_ui_soul, 0, 116-12, 44 + i*16, 1, 1, 0, c_red, 1)
				draw_text(116, 40 + i*16, iarr[i])
		}
	}
}