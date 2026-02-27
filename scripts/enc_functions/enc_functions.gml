function enc_start(encounterset){
	var inst = instance_create(o_enc,0,0,DEPTH_ENCOUNTER.UI)
	inst.init(encounterset)
}

function enc_dialogue(text){
    var d = instance_create(o_enc_dialog,0,0,DEPTH_ENCOUNTER.UI);
	if (is_array(text)) {
		d.text = text;
	} else {d.text = [text]}
	return d
}
