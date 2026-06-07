//-------------------------
// defines
//-------------------------

// really want to point out that velvetclover made this WHOLE system!! tysm
// velvetclover / rei: no problem dude

#macro __tween_manager global.__tween_ts
#macro __tween_pool    global.__tpool

#macro TW_PURGE_ROOM   "rm_init"
#macro TW_ROOM_REF     global.__tween_reset_room

// Global initialisation
__tween_pool = [];
__tween_manager = -1;
TW_ROOM_REF = asset_get_index(TW_PURGE_ROOM);

//-------------------------
// an enum for the masses
//-------------------------
enum e_tween {
	LINEAR,
	EASE_IN,
	EASE_OUT,
	EASE_IN_OUT,
	SINE_IN,
	SINE_OUT,
	SINE_IN_OUT,
	ELASTIC_IN,
	ELASTIC_OUT,
	ELASTIC_IN_OUT
};

//-------------------------
// the functions (pointer style... and somewhat oop)
//-------------------------
function tween_init(_initial, _func) {
	__proc_inline;
	return {
		__cursor : 0,
		__cur_f  : 0,
		__init   : _initial,
		__val    : _initial,
		__timer  : [],
		__queue  : [],
		__type   : [],
		__proc   : _func
	};
}

function tween_add(_t, _val, _time, _tween_type) {
	__proc_inline;
	with(_t) {
		array_push(__queue, _val);
		array_push(__timer, _time);
		array_push(__type,  _tween_type);
		return true;
	}
	return false;
}

function tween_start(_t) {
	__proc_inline;
	if (!time_source_exists(__tween_manager)) {
		__tween_init();
	}
	array_push(__tween_pool, _t);
}

function tween_stop(_t) {
	__proc_inline;
	var _idx = array_get_index(__tween_pool, _t);
	if (_idx >= 0) array_delete(__tween_pool, _idx, 1);
}

//-------------------------
// immediate mode tween
//-------------------------
function __imtween() {
	static storage = noone;
}

__imtween(); // initialise

function im_tween_begin(initial, func) {
	__proc_inline;
	__imtween.storage = tween_init(initial, func);
}

function im_tween_add(val, time, tween) {
	__proc_inline;
	tween_add(__imtween.storage, val, time, tween);
}

function im_tween_start() {
	__proc_inline;
	tween_start(__imtween.storage);
	__imtween.storage = noone;
}

function im_tween_get_struct() {
	__proc_inline;
	return __imtween.storage;
}

function im_tween_stop() {
	__proc_inline;
	tween_stop(__imtween.storage);
}

//-------------------------
// easing formulas
//-------------------------
function __tween_get_ease(_type, _percent) {
	__proc_inline;
	switch(_type) {
		case e_tween.LINEAR:
			return _percent;
			
		case e_tween.EASE_IN:
			return _percent * _percent * _percent;
			
		case e_tween.EASE_OUT: {
			var _p = _percent - 1.0;
			return (_p * _p * _p) + 1.0;
		}
			
		case e_tween.EASE_IN_OUT: {
			if (_percent < 0.5) {
				return 4.0 * _percent * _percent * _percent;
			} else {
				var _p = (2.0 * _percent) - 2.0;
				return 0.5 * (_p * _p * _p) + 1.0;
			}
		}
			
		case e_tween.SINE_IN:
			return 1.0 - cos(_percent * (pi * 0.5));
			
		case e_tween.SINE_OUT:
			return sin(_percent * (pi * 0.5));
			
		case e_tween.SINE_IN_OUT:
			return -(cos(pi * _percent) - 1.0) * 0.5;
			
		case e_tween.ELASTIC_IN: {
			if (_percent == 0.0) return 0.0;
			if (_percent == 1.0) return 1.0;
			
			var _p = 0.3;
			var _s = _p / 4.0;
			var _perc = _percent - 1.0;
			var _fix = power(2.0, 10.0 * _perc);
			
			return -(_fix * sin((_perc - _s) * (2.0 * pi) / _p));
		}
			
		case e_tween.ELASTIC_OUT: {
			if (_percent == 0.0) return 0.0;
			if (_percent == 1.0) return 1.0;
			
			var _p = 0.3;
			var _s = _p / 4.0;
			
			return power(2.0, -10.0 * _percent) * sin((_percent - _s) * (2.0 * pi) / _p) + 1.0;
		}
			
		case e_tween.ELASTIC_IN_OUT: {
			if (_percent == 0.0) return 0.0;
			if (_percent == 1.0) return 1.0;
			
			var _perc = _percent * 2.0;
			var _p = 0.3 * 1.5;
			var _s = _p / 4.0;
			
			_perc -= 1.0;
			if (_perc < 0.0) {
				var _fix = power(2.0, 10.0 * _perc);
				return -0.5 * (_fix * sin((_perc - _s) * (2.0 * pi) / _p));
			} else {
				var _fix = power(2.0, -10.0 * _perc);
				return _fix * sin((_perc - _s) * (2.0 * pi) / _p) * 0.5 + 1.0;
			}
		}
	}
	
	return _percent;
}

//-------------------------
// system logic
//-------------------------
function __tween_init() {
	__tween_manager = time_source_create(time_source_game, 1, time_source_units_frames, function() {
		var _pool_size = array_length(__tween_pool);
		
		for (var i = _pool_size - 1; i >= 0; --i) {
			var _inst = __tween_pool[i];
			
			if (room == TW_ROOM_REF) {
				array_delete(__tween_pool, i, 1); // no no u not persist bitch
				continue;
			}
			
			with(_inst) {
				if (__cursor < array_length(__queue)) {
					var _dur    = __timer[__cursor];
					var _target = __queue[__cursor];
					var _type   = __type[__cursor];
					
					++__cur_f;
					
					var _percent = clamp(__cur_f / _dur, 0.0, 1.0);
					var _final   = __tween_get_ease(_type, _percent);
					
					// apply interpolated value
					__val = __init + ((_target - __init) * _final);
					__proc(__val);
					
					if (_percent >= 1.0) {
						__init   = _target;
						__cur_f  = 0;
						__cursor++;
					}
				} else {
					array_delete(__tween_pool, i, 1);
				}
			}
		}
	}, [], -1);
	
	time_source_start(__tween_manager);
	
	return true;
}