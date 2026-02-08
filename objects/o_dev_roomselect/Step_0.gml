blink_timer++;

if (blink_timer>=blink_speed)
{
    blink_timer = 0;
    blink_state = !blink_state
}


if (keyboard_string != "")
{
    search += string_lower(keyboard_string);
    keyboard_string = "";
    update_filter();
}

if (keyboard_check(vk_backspace))
{
    backspace_hold+=10;
    if (keyboard_check_pressed(vk_backspace) || (backspace_hold > backspace_delay && backspace_hold mod backspace_rate == 0)){
		if (string_length(search) > 0){
            search = string_delete(search, string_length(search), 1)
            update_filter()
            blink_timer = 0
			blink_state = true
		}
	}
}
else
{
	backspace_hold = 0
}
var oldsel =selection

if (InputPressed(INPUT.DOWN)){
    selection++
}

if (InputPressed(INPUT.UP)){
    selection--
}

selection = clamp(selection,0,array_length(filtered)-1)

if (selection != oldsel){
    audio_play_sound(snd_ui_move,1,false)
}

if (InputPressed(INPUT.CONFIRM)){
    if (array_length(filtered)>0){
		audio_play_sound(snd_save,1,false)
        room_goto(rooms[filtered[selection]])
    }
}