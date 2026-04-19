function Dialogue_Create(text) {
    var d = instance_create(o_ow_dialog,0,0,DEPTH_UI.DIALOGUE_UI);
	if (is_array(text)) {
		d.text = text;
	} else {d.text = [text]}
	return d
}
