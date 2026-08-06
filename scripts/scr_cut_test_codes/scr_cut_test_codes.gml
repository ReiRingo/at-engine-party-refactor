// Functions
DISPLAY_CODE {
	var _c = cutscene_init();
	
	cutscene_wait(_c, 120);
	cutscene_run(_c,  function() { show_message("Hello, World!"); });
	cutscene_dialogue(_c, "It works, doesn't it?");
	
	cutscene_play(_c);
}

// OOP
DISPLAY_CODE {
	var _c = new cutscene_t();
	
	_c.wait(120)
		.run(function() { show_message("Hello, World!"); })
		.dialogue("It works, doesn't it?")
		.play();
}