function enc_start(encounterset){
	var inst = instance_create(o_enc,0,0,DEPTH_ENCOUNTER.UI)
	inst.init(encounterset)
}

function enc_dialogue(text){
    var d = instance_create(o_dialog,0,0,DEPTH_ENCOUNTER.UI);
    d.width  = o_enc.board_w;
    d.height = o_enc.board_h;
    d.xx = o_enc.txt.x
    d.yy = o_enc.txt.y
	if (is_array(text)) {
		d.text = text;
	} else {d.text = [text]}
	return d
}
