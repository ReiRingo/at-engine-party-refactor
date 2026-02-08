text = "";
pos = 1;
spd = 1;
finished = false;
face_sprite = noone;
face_index = 0;
line_length = infinity
voice = snd_text

line = 0;
can_skip = true;
cur_char = 0;
last_pos = -1;

wait = 0
rainbow_time = 0
text_surface = 0;
function shaky_offset(i,intensity=1)
{
	var p = 0.5*intensity
    var ox = random_range(-p, p);
    var oy = random_range(-p, p);

    return [ox, oy];
}

function wavy_offset(i)
{
    var amp = 2.5;
    var freq = 0.25;
    var wspd = 0.15;

    var t = (current_time*.05) * wspd;

    var ox = 0;
    var oy = cos((i * freq) - t) * amp;

    return [ox, oy];
}

on_gui = false

depth=DEPTH_UI.DIALOGUE_UI-1

