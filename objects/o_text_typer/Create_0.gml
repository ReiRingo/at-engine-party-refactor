text = "";
text_raw = "";
runs = [];
pos = 0;
spd = 1;
finished = false;
wave_enabled = false;
shake_enabled = false;
face_sprite = noone;
face_index = 0;

if instance_exists(o_dialog)
	voice = o_dialog.voice;
else
	voice = snd_text
text_list = [];
line = 0;
can_skip = true;
comma_wait = 0;
cur_char = 0;

function process_line()
{
    if (line >= array_length(text_list)) {
        instance_destroy();
        exit;
    }

    var raw = text_list[line];

    if (string_pos("{can_skip(false)}", raw) > 0) {
        can_skip = false;
        raw = string_replace(raw, "{can_skip(false)}", "");
    }
    if (string_pos("{can_skip(true)}", raw) > 0) {
        can_skip = true;
        raw = string_replace(raw, "{can_skip(true)}", "");
    }

    if (string_pos("{wavy(true)}", raw) > 0) {
        wave_enabled = true;
        raw = string_replace(raw, "{wavy(true)}", "");
    }
    if (string_pos("{wavy(false)}", raw) > 0) {
        wave_enabled = false;
        raw = string_replace(raw, "{wavy(false)}", "");
    }

    if (string_pos("{shaky(true)}", raw) > 0) {
        shake_enabled = true;
        raw = string_replace(raw, "{shaky(true)}", "");
    }
    if (string_pos("{shaky(false)}", raw) > 0) {
        shake_enabled = false;
        raw = string_replace(raw, "{shaky(false)}", "");
    }

    if (string_pos("{face(", raw) > 0)
    {
        var start = string_pos("{face(", raw) + string_length("{face(");
        var send = string_pos(")}", raw);

        var inside = string_copy(raw, start, send - start);

        var spr = real(string_copy(inside, 1, string_pos(",", inside) - 1));
        var idx = real(string_copy(inside, string_pos(",", inside) + 1, string_length(inside)));

        face_sprite = spr;
        face_index = idx;

        raw = string_delete(raw, string_pos("{face(", raw), (send + 2) - string_pos("{face(", raw));
    }

    raw = string_replace_all(raw, "{nl}", loc("\n  ","\n　 "));

    text_raw = raw;
    pos = 0;
    finished = false;
}

function shaky_offset(i)
{
    var ox = random_range(-0.5, 0.5);
    var oy = random_range(-0.5, 0.5);

    return [ox, oy];
}

function wavy_offset(i)
{
    var amp = 2.5;
    var freq = 0.25;
    var wspd = 0.15;

    var t = o_world.frames * wspd;

    var ox = 0;
    var oy = sin((i * freq) + t) * amp;

    return [ox, oy];
}

depth=DEPTH_UI.DIALOGUE_UI-1