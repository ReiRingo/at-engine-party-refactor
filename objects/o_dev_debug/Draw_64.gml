draw_set_font(loc_getfont(font_main))
if !screenshot{
var debug_lines = []

array_push(debug_lines, "UNDERTALE: AT ENGINE")
array_push(debug_lines, "DEBUG MODE")
array_push(debug_lines, "")
array_push(debug_lines, "TIME: " + string(global.time))
array_push(debug_lines, "ROOM: " + string(global.room_name))
array_push(debug_lines, "")
array_push(debug_lines, "PLAYER FACING: " + string(global.facing))
array_push(debug_lines, "PLAYER NAME: " + string(global.name))
array_push(debug_lines, "LV: " + string(global.lv))
array_push(debug_lines, "HP: " + string(global.hp) + "/" + string(global.maxhp))
array_push(debug_lines, "GOLD: " + string(global.gold))
array_push(debug_lines, "")
array_push(debug_lines, "LANG: " + string(global.lang))

if (instance_exists(o_ui_save)) {
	array_push(debug_lines, "")
	array_push(debug_lines, "SAVE SECTION: " + string(o_ui_save.section))
	array_push(debug_lines, "SAVE SELECTION: " + string(o_ui_save.selection))
}

var debug_text = "";

for (var i = 0; i < array_length(debug_lines); i++) {
    debug_text += debug_lines[i]
	
    if (i < array_length(debug_lines) - 1)
		debug_text += "\n"
}

draw_set_alpha(0.5);
draw_text_transformed(x, y, debug_text, 0.5, 0.5, 0)
draw_set_alpha(1);

draw_sprite_ext(spr_refsavel1x, 0, 0, 0, 1, 1, 0, c_white, alpha_dialog)
draw_set_alpha(alphascreen);
draw_rectangle(0,0,320,240,false)
draw_set_alpha(1);
}