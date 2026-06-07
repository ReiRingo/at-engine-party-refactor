// follower logic is somehow smoother on endstep
event_inherited();

var old_pos_x = x;
var old_pos_y = y;

if (following && instance_exists(target_inst)) {
	var t_inst     = target_inst;
	var target_pos = pointer_null;
	
	party_make_leader(t_inst);
	
	with(t_inst) {
		_List[other.follow_index] = other;
		target_pos = __pos_list__;
		if (__timer__ == o_world.frames) break;
		__timer__ = o_world.frames;
		
		var _can_add = false;
		var _dist_threshold = 2; // low threshold means smooth
		
		if (ds_list_empty(__pos_list__)) {
			_can_add = true;
		} else {
			var _last = __pos_list__[| 0];
			if (point_distance(x, y, _last[0], _last[1]) >= _dist_threshold) {
				_can_add = true;
			}
		}
		
		if (_can_add) {
			var pos_queue = [x, y, 0x00];
			
			var auto_face   = other.auto_face;
			
			if (auto_face && object_childof(object_index, o_actor_mainpl)) {
				pos_queue[2] = global.facing;
			}
			
			ds_list_insert(__pos_list__, 0, pos_queue);
			if (ds_list_size(__pos_list__) > 500) {
				ds_list_delete(__pos_list__, ds_list_size(__pos_list__) - 1);
			}
		}
	}
	
	var index = (follow_index + 1) * move_gap;
	
	if (ds_list_size(target_pos) > index) {
		var pos  = target_pos[| index];
		var l    = 0.90 / (follow_index + 1); // the deltarune follower somehow lerps?
		x = lerp(x, floor(pos[0]), l);
		y = lerp(y, floor(pos[1]), l);
		
		if (auto_anim) {
			if (x != old_pos_x || y != old_pos_y) {
				image_speed = 1;
			} else {
				image_index = 0;
				image_speed = 0;
			}
			
			sprite_index = sprite[pos[2]];
		}
	}
}