function sec_to_frames(sec, fps = 30) {
	__proc_inline;
	return sec * fps;
}

function object_get_base(obj) {
	__proc_inline;
	static _parent = -1;
	
	_parent = object_get_parent(obj);
	while(instance_exists(_parent)) {
		obj = _parent;
		_parent = object_get_parent(obj);
	}
	
	return obj;
}