draw_set_font(loc_getfont(font_main));
draw_set_color(c_black);

var xx = 10;
var yy = 10;

draw_set_alpha(0.5);
draw_rectangle(0,0,320,240,false)
draw_set_alpha(1);
draw_set_color(c_white);

draw_text_outline(xx, yy, "AT-Engine/rooms");

var yoff = yy + 32;
var max_visible = 7;
var scroll = clamp(selection-max_visible+4,0,max(0,array_length(filtered)-max_visible));

for (var i = 0; i < array_length(filtered); i++){
    if (i<scroll)
        continue;
    if (i>=scroll+max_visible)
        break;
    
    var name = room_get_name(rooms[filtered[i]]);
    var draw_y = yoff+(i-scroll)*16;

    if (i == selection){
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }

    draw_text_outline(xx,draw_y," "+name)
}

draw_set_colour(c_white)
draw_set_halign(fa_right)

if (array_length(filtered) == 0)
	draw_text_outline(310, 10, "(no results)");
else
	draw_text_outline(310, 10, "("+string(array_length(filtered))+" results)");

draw_set_halign(fa_left)
draw_set_color(c_white)