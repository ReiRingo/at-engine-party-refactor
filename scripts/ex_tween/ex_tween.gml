//------------------
//example 1
//------------------
DISPLAY_CODE {
	// function style
	
	var _t = tween_init(0.0, function(n) { show_debug_message(n); });
	
	tween_add(_t, 10.0, sec_to_frames(2), e_tween.EASE_IN);
	
	tween_start(_t);
}

//------------------
//example 2
//------------------
DISPLAY_CODE {
	// immediate mode ( IM ) style
	
	im_tween_begin(0.0, function(n) { show_debug_message(n); });
	
	im_tween_add(10.0, sec_to_frames(2), e_tween.EASE_IN);
	
	im_tween_start();
}