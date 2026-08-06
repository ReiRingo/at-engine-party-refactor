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

function object_childof(obj, parent) {
	__proc_inline;
	
	while(instance_exists(obj)) {
		if (obj == parent) return true;
		
		obj = object_get_parent(obj);
	}
	
	return false;
}

function object_force(obj_or_inst) {
	__proc_inline;
	var thing = obj_or_inst;
	with(obj_or_inst) { thing = object_index; break; }
	return thing;
}