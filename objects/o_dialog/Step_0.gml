if(!instance_exists(t))
{
	if(line>=array_length(text)){
		global.console = false;
		instance_destroy()
		exit
	}

	var raw=text[line]
	var pr=dialogue_preprocess(raw)
	skip_enabled=pr.skip

	var p=parse_text(pr.text)
	
	if (face!=undefined)
		t=instance_create_depth(xx+72,yy+11.5,-1,o_text_typer)
	else
		t=instance_create_depth(xx+14,yy+11.5,-1,o_text_typer)
	
	t.text_raw=p.text
	t.runs=p.runs
}
else
{
	if(skip_enabled&&InputPressed(INPUT.CANCEL)){
		t.pos=string_length(t.text_raw)
		t.finished=true
	}

	if(InputPressed(INPUT.CONFIRM)){
		if(!t.finished){
			t.pos=string_length(t.text_raw)
			t.finished=true
		}else{
			global.console = false;
			instance_destroy(t)
			line++
			if(line>=array_length(text)){
				global.console = false;
				instance_destroy()
				instance_create_depth(0,0,0,o_ui_save)
				exit
			}
		}
	}
}