if (instance_exists(t)){
	t.x = xx+14+camerachangex;
    t.y = yy+11
	on_choice = line >= array_length(text)-1 && array_length(choices) > 0 && t.finished
	t.line_length = width+14
	if (asset_get_type(face) == asset_sprite) {
		t.line_length -= 14
	}
	
	if (on_choice) {
		ch_index += (InputPressed(INPUT.RIGHT)-InputPressed(INPUT.LEFT))
		ch_index = clamp(ch_index,0,array_length(choices)-1)
		
		if (InputPressed(INPUT.CONFIRM)) {
			if (choices[ch_index].result!=noone){
                var result = choices[ch_index].result
                if (is_method(result)) {
                    script_execute(result)
                    instance_destroy(t)
                    instance_destroy(id,false)
                }
                else{
                    Dialogue_Create(choices[ch_index].result) 
                    instance_destroy(t)
                    instance_destroy(id,false)
                } 
            }
            else{
				instance_destroy(t)
				instance_destroy(id,false)
            }
        }
	} else if (InputPressed(INPUT.CONFIRM) && t.finished){
		line++
		instance_destroy(t)
	}
	
} else {
	if (line>=array_length(text)){
		if (save)
			instance_create(o_ui_save)
		instance_destroy()
		exit
	}
	
	t=instance_create(o_text_typer,xx+14,yy+11);
	t.on_gui = false
	t.text = text[line];
}