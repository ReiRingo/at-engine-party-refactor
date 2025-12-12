draw_set_font(loc_getfontmono(font_main));

var draw_count = pos;
var xx = x;
var yy = y;

for (var i = 0; i < draw_count; i++)
{
    var ch = string_char_at(text_raw, i+1);

    if (ch == "\n")
    {
        xx = x;
        yy += 18;
        continue;
    }

    var c = get_run_color(runs, i);
    draw_set_color(c);

	var ox = 0;
	var oy = 0;

	if (shake_enabled)
	{
		ox += wavy_offset(i)[0];
		oy += wavy_offset(i)[1];
	}

	if (wave_enabled)
	{
		ox += wavy_offset(i)[0];
		oy += wavy_offset(i)[1];
	}

    draw_text(xx + ox, yy + oy, ch);

    xx += string_width(ch) * loc(0.89,0.94);
}

draw_set_color(c_white);

if instance_exists(o_dialog){
	if (sprite_exists(face_sprite)){
		draw_sprite(face_sprite, face_index, xstart - 119, ystart + 7);
	}
}