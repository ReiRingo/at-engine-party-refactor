interact = function(){
	if (text!=-1){
		var i = Dialogue_Create(text)
		if (array_length(choices) > 0) {
			i.choices = choices	
		}
	}
}