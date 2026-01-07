if (can_skip && InputPressed(INPUT.CANCEL))
{
    pos = string_length(text_raw);
    finished = true;
}

if (!finished)
{
	var current_index = floor(pos)
	if (current_index != last_pos){
		cur_char = string_char_at(text_raw, current_index)
        if (cur_char==","||cur_char=="!"){
			var wait_frames=15*0.15

			if (comma_wait < wait_frames){
				comma_wait++
				exit
			}
				comma_wait = 0
		}else
			if (cur_char!=" "){
				audio_play_sound(voice, 0, false)
			}
		last_pos = current_index;
	}
}

if (!finished)
{
    pos += spd;

    if (pos = string_length(text_raw)) {
        pos = string_length(text_raw);
        finished = true;
    }
}

if (InputPressed(INPUT.CONFIRM))
{
    if (finished){
        line++;
        process_line();
    }
}