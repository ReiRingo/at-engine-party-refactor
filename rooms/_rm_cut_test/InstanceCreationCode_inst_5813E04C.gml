event = function() {
	var _c = cutscene_init();
	
	cutscene_dialogue(_c, "* ...");
	cutscene_wait(_c, 60);
	cutscene_dialogue(_c, ["* You uhh...", "* Okay?"]);
	cutscene_wait(_c, 60);
	cutscene_dialogue(_c, "* Okay, I stop.");
	
	cutscene_play(_c);
};