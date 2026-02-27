function check_line_break(text,number,line_length, char_spacing=0, space, return_length=false) {
	var j = number, length = 0;
	var text_length = string_length(text);

	while (j <= text_length) {
		var cj = string_char_at(text, j);
		if (cj == " " || cj == "　"|| cj == "\n") break;

		if (cj == CMD_START) {
			var e = string_pos_ext(CMD_END, text, j);
			if (e > 0) {
			    j = e + 1;
			    continue;
			}
		}

		length += (string_width(cj)*char_spacing);

		j++;
	}
	return !return_length ? (space + length > line_length) : length 
}

function draw_each_letter(_x,_y,text,spacing=1,line_length=infinity,draw_count=string_length(text)){
	var font = draw_get_font() != -1 ? draw_get_font() : loc_getfont(font_main)
	if (spacing <= 1 && font = loc_getfont(font_main)) {
		spacing = loc(0.89,0.94);	
	}
	var xx = _x;
	var yy = _y;
	var shake = false;
	var wave = false;
	var shake_intensity = 1;
	var rainbow = false
	static rainbow_time = 0

	for (var i = 1; i < draw_count+1; i++)
	{
	    var ch = string_char_at(text, i);
		if (string_char_at(text,i-1) == " " || string_char_at(text,i-1) == "　") {
			if (check_line_break(text,i,line_length,spacing,xx,false)) {
				xx = _x;
				yy += 18;
			}
		}
	
		if (ch == CMD_START) {
			var end_index = string_pos_ext(CMD_END,text,i)
			if (string_char_at(text,i+1) == CMD_START) {
				i++;
			} else {
				var arg = string_split(string_lower(string_copy(text, i+1, (end_index - i)-1)),",")
				var arg_count = array_length(arg)-1
				switch(arg[0]) {
					case "red": case "c_red":
						draw_set_colour(c_red)
					break;
				
					case "blue": case "c_blue":
						draw_set_colour(c_blue)
					break;
                
					case "yellow": case "c_yellow":
						draw_set_colour(c_yellow)
					break;
				
					case "rainbow": case "c_rainbow":
						rainbow = !rainbow
						if (rainbow == false) {draw_set_colour(c_white)}
					break;
				
					case "c":
						rainbow = false;
						draw_set_colour(c_white)
					break;
				
					case "voice":
						if (arg_count>=1){
							voice = asset_get_index(arg[1]);
						}
					break;
				
					case "instant":
						pos = string_length(text)
					break;
				
					case "shake":
						shake = !shake
						if (arg_count >= 1) {
							shake_intensity = real(arg[1]);
						}
					break;
				
					case "wave":
						wave = !wave
					break;
				
				}

				if instance_exists(o_dialog) {
					switch(arg[0]) {
						case "face":
							if (wait <= 0 || pos >= string_length(text)-1) { //Only execute if the text isn't paused!
								if (arg_count >= 1) {
									var asset = asset_get_index(arg[1]);
									if (asset_get_type(asset) == asset_sprite) {
										o_dialog.face = asset
										if (sprite_get_speed(asset) <= 0 && arg_count >= 2) {
											o_dialog.faceid = real(arg[2])
										}
									} else if (is_numeric(real(arg[1]))) {
										o_dialog.faceid = real(arg[1])
									}
								} else {o_dialog.face = undefined}
							}
						break;
					}
				}

				i = end_index;
				continue;
			}
		}

	    if (ch == "\n")	{
	        xx = _x;
	        yy += 18;
	        continue;
	    }
		if (xx = _x && string_count("*",text) > 0 && ch != "*") {
			xx += string_width("* ")*spacing	
		}

		var ox = 0;
		var oy = 0;

		if (shake)
		{
			ox += shaky_offset(i,shake_intensity)[0];
			oy += shaky_offset(i,shake_intensity)[1];
		}

		if (wave)
		{
			ox += wavy_offset(i)[0];
			oy += wavy_offset(i)[1];
		}
		if (rainbow) {
			var s = abs(rainbow_time) % 290
			draw_set_colour(make_colour_hsv(s-(i*.5),255,255))	
		}
	    draw_text(xx + ox, yy + oy, ch);

	    xx += string_width(ch) * spacing;
	}
	rainbow_time += 2
	draw_set_color(c_white);
}
