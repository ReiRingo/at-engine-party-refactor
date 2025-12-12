draw_set_font(loc_getfont(font_main))

var debug_lines = []

array_push(debug_lines, "UNDERTALE: TECHO ENGINE")
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

if (instance_exists(o_text_typer)) {
	array_push(debug_lines, "")
	array_push(debug_lines, "TEXTPOS: " + string(o_text_typer.pos))
}

if (instance_exists(o_dialog)) {
	if (o_dialog.face != undefined) {
		array_push(debug_lines, "FACE: " + string(sprite_get_name(o_dialog.face)))
	}
	if (o_dialog.faceid != undefined) {
		array_push(debug_lines, "FACE ID: " + string(o_dialog.faceid))
	}
}

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

draw_sprite_ext(spr_refsaver1x, 0, 0, 0, 1, 1, 0, c_white, alpha_dialog)