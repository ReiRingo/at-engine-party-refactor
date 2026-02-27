if (live_call()) return live_result;
if (!finished){
	var txt_len = string_length(text)
	while (string_char_at(text,pos) == CMD_START) {
		var end_index = string_pos_ext(CMD_END,text,pos)
		if (string_char_at(text,pos+1) == CMD_START) {
			pos++;
			break;
		} else {
			var arg = string_split(string_lower(string_copy(text, pos+1, (end_index - pos)-1)),",")
			var arg_count = array_length(arg)-1
			switch(arg[0]) {
				case "spd": case "speed":
					if (arg_count > 0) {
						spd = real(arg[1])
					} else {spd = 1}
				break;
				
				case "w": case "wait": case ",":
					if (arg_count >= 1) {
						wait = real(arg[1])	
					} else {wait = 10}
				break;
				
				case "snd": case "sound":
					if (arg_count >= 1) {
						var asset = asset_get_index(arg[1])
						var loops = arg_count >= 3 ? real(arg[3]) : 0
						var pri = arg_count >= 2 ? real(arg[2]) : 0
						var gain = arg_count >= 4 ? real(arg[4]) : 1
						var pitch = arg_count >= 5 ? real(arg[5]) : 1
						if (asset_get_type(asset) == asset_sound) {
							audio_play_sound(asset,pri,loops,gain,0,pitch)	
						}
					}
				break;
            
                case "esnd": case "esound":
					if (arg_count >= 1) {
						var asset = asset_get_index(arg[1])
						if (asset_get_type(asset) == asset_sound) {
							audio_stop_sound(asset)	
						}
					}
				break;
			}
			pos += (end_index-pos)+1;
		}
	}	
	if (wait <= 0) {
		pos+=spd
	} else {wait--}

	var current_index = floor(pos)
	if (current_index != last_pos){
		cur_char=string_char_at(text,current_index)
		if (string_count(cur_char,".,") >= 1){
			wait=10
		}
		if (string_count(cur_char," .,:;!?-=+[]()<>{}@#$%¨&*´`~^/\"'") <= 0){
			audio_play_sound(voice,0,false)
		}
		last_pos = current_index;
	}
	
	if (pos >= txt_len){
		finished = true
	}
}

if (InputPressed(INPUT.CONFIRM)){
	if (finished){
		line++
	}
}
if (can_skip && InputPressed(INPUT.CANCEL))
	pos = string_length(text)
