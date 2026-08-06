var _n = array_length(scenes);

if (_n > 0) {
	for (var i=0; i<_n; ++i) {
		var _cur_scene = scenes[i];
		with(_cur_scene) {
			event();
		}
	}
}