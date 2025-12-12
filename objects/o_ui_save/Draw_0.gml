draw_set_font(loc_getfont(font_main));
ui_dialoguebox_create(54,59,212,87)

if (section==1)
	draw_set_color(c_yellow)

draw_text_transformed(54+20.5-4,106+74-20-80-10,string(global.name),1,1,0)
draw_text_transformed(54+20.5-4+75.75+8,106+74-20-80-10,"LV "+string(global.lv),1,1,0)
draw_text_transformed(54+20.5+75.75+62,53+37-20,timereg,1,1,0)
draw_text_transformed(54+20.5-4,53+74/2,"Waterfall - Crystal",1,1,0)

if (section==1)
	draw_text_transformed(54+35-4,53+67.5,"File saved.",1,1,0)

if (section==0){
	draw_text_transformed(54+35-4,53+67.5,"Save",1,1,0)
	draw_text_transformed(54+70+90-39,53+67.5,"Return",1,1,0)
	if (selection==0)
		draw_sprite_ext(spr_ui_soul,0,54+35-4-20+6,53+67.5+3,1,1,0,c_red,1)
	else
		draw_sprite_ext(spr_ui_soul,0,54+35-4-20+6+80+10,53+67.5+3,1,1,0,c_red,1)
}

if (section==1)
	draw_set_color(c_white)