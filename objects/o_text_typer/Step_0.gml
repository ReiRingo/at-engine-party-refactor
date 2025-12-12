if (can_skip && InputPressed(INPUT.CANCEL))
{
    pos = string_length(text_raw);
    finished = true;
}

if (!finished)
{
    cur_char = string_char_at(text_raw, pos);

    if (cur_char == "," || cur_char == "!") {

        var wait_frames = 15 * 0.15;

        if (comma_wait < wait_frames) {
            comma_wait++;
            exit;
        }

        comma_wait = 0;
    }
}

if (!finished)
{
    pos += spd;
	audio_play_sound(voice, 0, false);

    if (pos >= string_length(text_raw)) {
        pos = string_length(text_raw);
        finished = true;
    }
}

if (InputPressed(INPUT.CONFIRM))
{
    if (!finished)
    {
        pos = string_length(text_raw);
        finished = true;
    }
    else{
        line++;
        process_line();
    }
}