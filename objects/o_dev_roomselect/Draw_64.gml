draw_set_font(loc_getfont(font_main));
draw_set_color(c_black);

var xx = 320/3;
var yy = 240/4;

draw_set_alpha(0.5);
draw_rectangle(0,0,320,240,false)
draw_set_alpha(1);
draw_set_color(c_white);

draw_text(xx, yy, "UT:\\Rooms\\" + search + ((blink_state) ? "|" : ""));

var yoff = yy + 32;

for (var i = 0; i < array_length(filtered); i++){
	var name = room_get_name(rooms[filtered[i]]);
	if (i == selection){
		draw_set_colour(c_yellow)
		draw_text(xx, yoff + i * 16, " " + name);
	}else{
		draw_set_colour(c_white)
		draw_text(xx, yoff + i * 16, " " + name);
	}
}

if (array_length(filtered) == 0)
	draw_text(10, 10, "(no results)");
else
	draw_text(10, 10, "("+string(array_length(filtered))+" results)");
	
draw_set_colour(c_white)