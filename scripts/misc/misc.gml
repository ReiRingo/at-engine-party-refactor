function instance_create(obj, xx = 0, yy = 0, dpth = 0, post_var_struct = {}) {
    var inst = instance_create_depth(xx, yy, dpth, obj);

    if (is_struct(post_var_struct)) {
        var keys = variable_struct_get_names(post_var_struct);
        var count = array_length(keys);
        for (var i = 0; i < count; i++) {
            var key = keys[i];
            var val = variable_struct_get(post_var_struct, key);
            variable_instance_set(inst, key, val);
        }
    }
    return inst;
}

function get_run_color(runs, index) {
    var col = c_white;
    for (var i = 0; i < array_length(runs); i++) {
        if (index >= runs[i].start) {
            col = runs[i].color;
        } else break;
    }
    return col;
}

function string_pos_from(substr, str, start_pos)
{
    var len = string_length(str);
    for (var n = start_pos; n <= len; n++) {
        if (string_char_at(str, n) == substr) {
            return n;
        }
    }
    return 0;
}

function parse_text(txt)
{
    var out = "";
    var runs = [];
    
    var current_color = c_white;
    var i = 1;
    var len = string_length(txt);

    array_push(runs, { start: 0, color: current_color });

    while (i <= len)
    {
        var ch = string_char_at(txt, i);
        if (ch == "\\" && i < len)
        {
            var code = string_char_at(txt, i+1);

            var changed = true;

            switch (code)
            {
                case "W":
					current_color = c_white;
					break;
                case "Y":
					current_color = c_yellow;
					break;
                case "R":
					current_color = c_red;
					break;
                case "B":
					current_color = c_blue;
					break;
                default:
					changed = false;
					break;
            }

            if (changed)
            {
                array_push(runs, { start: string_length(out), color: current_color });

                i += 2;
                continue;
            }
        }

        out += ch;
        i++;
    }

    return { text: out, runs: runs };
}

function dialogue_preprocess(raw)
{
    var out = raw;
    var skip = skip_enabled;
    var wavy = false;
    var shaky = false;
    var face_sprite = undefined;
    var face_index = -1;

    if (string_pos("{can_skip(false)}", out) > 0) {
        skip = false;
        out = string_replace(out, "{can_skip(false)}", "");
    }
    if (string_pos("{can_skip(true)}", out) > 0) {
        skip = true;
        out = string_replace(out, "{can_skip(true)}", "");
    }

    if (string_pos("{wavy(true)}", out) > 0) {
        wavy = true;
        out = string_replace(out, "{wavy(true)}", "");
    }
    if (string_pos("{wavy(false)}", out) > 0) {
        wavy = false;
        out = string_replace(out, "{wavy(false)}", "");
    }

    if (string_pos("{shaky(true)}", out) > 0) {
        shaky = true;
        out = string_replace(out, "{shaky(true)}", "");
    }
    if (string_pos("{shaky(false)}", out) > 0) {
        shaky = false;
        out = string_replace(out, "{shaky(false)}", "");
    }

    if (string_pos("{face(", out) > 0)
    {
        var p1 = string_pos("{face(", out) + string_length("{face(");
        var p2 = string_pos(")}", out);

        var inside = string_copy(out, p1, p2 - p1);
        var comma = string_pos(",", inside);

        face_sprite = real(string_copy(inside, 1, comma - 1));
        face_index  = real(string_copy(inside, comma + 1, string_length(inside)));

        out = string_delete(out, string_pos("{face(", out), (p2 + 2) - string_pos("{face(", out));
    }

    out = string_replace_all(out, "{nl}", loc("\n  ","\n　 "));
    out = string_trim(out);

    return {
        text: out,
        skip: skip,
        wavy: wavy,
        shaky: shaky,
        face_sprite: face_sprite,
        face_index: face_index
    };
}

function string_contains(substring, fullString) {
    return string_pos(substring, fullString) > 0;
}

function ui_dialoguebox_create(xx, yy, width, height){
	draw_sprite_ext(spr_pixel, 0, xx, yy, width, height, 0, c_white, 1);
	draw_sprite_ext(spr_pixel, 0, xx + 3, yy + 3, width - 6, height - 6, 0, c_black, 1);
}

function time_to_mmss(seconds) {
    var mm = seconds div 60;
    var ss = seconds mod 60;
    if (ss < 10) {
        return string(mm) + ":0" + string(ss);
    } else {
        return string(mm) + ":" + string(ss);
    }
}