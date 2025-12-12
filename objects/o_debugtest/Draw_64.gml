draw_set_font(loc_getfont(font_main))
var txttyper = ""
var txtface = ""
var txtfaceid = ""
if instance_exists(o_text_typer){
	var txttyper = "\nTEXTPOS: "+string(o_text_typer.pos)
}
if instance_exists(o_dialog){
	if (o_dialog.face!=undefined){
		var txtface = "\nFACE: "+string(sprite_get_name(o_dialog.face))
	}
	if (o_dialog.faceid!=undefined){
		var txtfaceid = "\nFACEID: "+string(o_dialog.faceid)
	}
}
draw_set_alpha(0.5)
draw_text_transformed(x,y,"UNDERTALE: TECHO ENGINE"+"\nDEBUG MODE"+"\nTIME: "+string(global.time)+"\nROOM: "+string(global.room_name)+"\nPLAYERNAME: "+string(global.name)+"\nPLAYERLV: "+string(global.lv)+"\nPLAYERHP: "+string(global.hp)+"\nPLAYERHPMAX: "+string(global.maxhp)+"\nPLAYERGOLD: "+string(global.gold)+"\nLANGUAGE: "+string(global.lang)+txttyper+txtface+txtfaceid,0.5,0.5,0)
draw_set_alpha(1)
draw_sprite_ext(spr_refsaved1x,0,0,0,1,1,0,c_white,alpha_dialog)