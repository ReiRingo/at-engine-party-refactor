 

draw_set_font(loc_getfont(font_main));

var addy = 136;
if (!top){
	addy = 0;
}
{ // box
	ui_dialoguebox_create(16,26+4-5+addy,71,55)
	if array_length(options)>3{ // makes so if you don't have a PHONE the ui don't resizes
		ui_dialoguebox_create(16,84 + 4-5,71,35 + (array_length(options) - 1) * 18 + 3)
	}
	else{
		ui_dialoguebox_create(16,84 + 4-5,71,35 + 2 * 18 + 3)
	}
}
{ // top box
	draw_text(23,30+4-5+addy,string(global.name))
	
<<<<<<< Updated upstream:objects/o_ui_menu/Draw_64.gml
	draw_set_font(font_menu)
	draw_text(23,50-3+4+4-5+addy,"lv")
	draw_text(41,50-3+4+4-5+addy,string(global.lv))
	draw_text(23,59-3+4+4-5+addy,"hp")
	draw_text(41,59-3+4+4-5+addy,$"{string(global.hp)}/{string(global.maxhp)}")
	draw_text(23,68-3+4+4-5+addy,"G")
	draw_text(41,68-3+4+4-5+addy,string(global.gold))
=======
	draw_set_font(font_mars)
	draw_text(23,50-3+4+4-5,"lv")
	draw_text(41,50-3+4+4-5,string(global.lv))
	draw_text(23,59-3+4+4-5,"hp")
	draw_text(41,59-3+4+4-5,$"{string(global.hp)}/{string(global.maxhp)}")
	draw_text(23,68-3+4+4-5,"G")
	draw_text(41,68-3+4+4-5,string(global.gold))
>>>>>>> Stashed changes:objects/o_ui_menu/Draw_0.gml
}
{ // options
	draw_set_font(loc_getfont(font_main));
	for (var i = 0; i < array_length(options); ++i) {
		
		if (selection == i && state == 0)
			if (!instance_exists(o_dialog))
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
	if (state==1) {
		for (var i=0; i<array_length(global.items); i++){
			if (sub_state==0&&i==item_selection)
				draw_sprite_ext(spr_ui_soul,0,104,44+i*16,1,1,0,c_red,1)
			draw_text(116,40+i*16,global.items[i].name.normal)
		}

		for (var i=0; i<array_length(item_actions); i++){
				var xx=116+i*48
				if (!item_actions[i].selectable)
					draw_set_color(c_gray)
				draw_text(xx,180,item_actions[i].name)
		}
	}
	if (state==1&&sub_state==1){
		for (var i=0; i<array_length(item_actions); i++){
			var xx=116+i*48
			if (i==item_action_selection)
				draw_sprite_ext(spr_ui_soul,0,xx-12,184,1,1,0,c_red,1)
			draw_set_color(c_white)
		}
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
	
		draw_text(108, 166-1, $"WEAPON: {is_struct(global.weapon) ? global.weapon.name.normal : "(NONE)"}")
		draw_text(108, 182-1, $"ARMOR: {is_struct(global.armor) ? global.armor.name.normal : "(NONE)"}")
		draw_text(108, 202-1, $"GOLD: {global.gold}")
	}
}
{ // state 3 (CELL)
	if (state==3){
		for (var i=0; i<array_length(cells); i++) {
			if (i==cell_selection)
				draw_sprite_ext(spr_ui_soul,0,104,44+i*16,1,1,0,c_red,1)
			draw_text(116,40+i*16,cells[i].name)
		}
	}
}
draw_set_color(c_white)
