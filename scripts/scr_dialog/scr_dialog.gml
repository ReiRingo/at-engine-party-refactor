function Dialogue_Create(text) {
    var d = instance_create(o_ow_dialog,0,0,DEPTH_UI.DIALOGUE_UI);
	if (is_array(text)) {
		d.text = text;
	} else {d.text = [text]}
	return d
}
function Dialogue_CheckLine(){
    if instance_exists(o_ow_dialog)
        return o_ow_dialog.line
    else
        return -1
}
function Dialogue_CheckEnd(){
    if (o_world.dialogue_destroywarn==true){
        return true
    }
    else{
        return false
    }
}
function Dialogue_CheckText(_text){
    if instance_exists(o_ow_dialog){
        if (o_ow_dialog.text==_text){
            return true
        }
        else {
            return false
        }
    }
    else{
        return false
    }
}






