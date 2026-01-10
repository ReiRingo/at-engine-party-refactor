if (!instance_exists(t)){
	if (line>=array_length(text)){
		o_actor_mainpl.moveable=true
		if (save)
			instance_create(o_ui_save)
		instance_destroy()
		exit
	}

	var raw=text[line]
	var pr=dialogue_preprocess(raw)
	skip_enabled=pr.skip
	var p=parse_text(pr.text)
	if (face!=undefined)
		t=instance_create(o_text_typer,xx+72,yy+11.5)
	else
		t=instance_create(o_text_typer,xx+14,yy+11.5)

	t.text_raw=p.text
	t.runs=p.runs
}else
{
	if (skip_enabled&&InputPressed(INPUT.CANCEL)){
		t.pos=string_length(t.text_raw)
		t.finished=true
	}
	if (InputPressed(INPUT.CONFIRM)){
		if (!t.finished){
			t.pos=string_length(t.text_raw)
			t.finished=true
		}else
		{
			instance_destroy(t)
			line++
		}
	}
}