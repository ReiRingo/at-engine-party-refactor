draw_set_font(loc_getfont(font_main));
ui_dialoguebox_create(54,59,212,87)

if (section==1)
	draw_set_color(c_yellow)

draw_text_transformed(54+20.5-4-loc(0,6),106+74-20-80-10,string(global.name),1,1,0)
draw_text_transformed(54+20.5-4+75.75+8-loc(0,4),106+74-20-80-10,"LV "+string(global.lv),1,1,0)
draw_set_halign(fa_right)
draw_text_transformed(54+20.5+75.75+62+38+loc(0,2),53+37-20,timereg,1,1,0)
draw_set_halign(fa_left)

if (global.lang=="ja")
	draw_set_halign(fa_center)
	
draw_text_transformed(54+20.5-4+loc(0,90),53+74/2,loc("Waterfall - Crystal","クリスタルのへや"),1,1,0)
draw_set_halign(fa_left)
if (section==1)
	draw_text_transformed(54+35-4,53+67.5,loc("File saved.","セーブしました。"),1,1,0)

if (section==0){
	draw_text_transformed(54+35-4+loc(0,7),53+67.5,loc("Save","セーブ"),1,1,0)
	draw_text_transformed(54+70+90-39+loc(0,12),53+67.5,loc("Return","もどる"),1,1,0)
	if (selection==0)
		draw_sprite_ext(spr_ui_soul,0,54+35-4-20+6+loc(0,7),53+67.5+3,1,1,0,c_red,1)
	else
		draw_sprite_ext(spr_ui_soul,0,54+35-4-20+6+80+10+loc(0,7),53+67.5+3,1,1,0,c_red,1)
}

if (section==1)
	draw_set_color(c_white)