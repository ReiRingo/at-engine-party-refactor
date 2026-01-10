interact = function(){
	if (text!=-1){
		Dialogue_Create(text)
		o_dialog.save=true
	}else{
		instance_create(o_ui_save)
	}
}