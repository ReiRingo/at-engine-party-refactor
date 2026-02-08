function Dialogue_Create(text) {
    var d = instance_create(o_dialog);
	if (is_array(text)) {
		d.text = text;
	} else {d.text = [text]}
	return d
}