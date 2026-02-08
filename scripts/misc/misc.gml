function instance_create(obj, xx = 0, yy = 0, dpth = depth-1, post_var_struct = {}) {
    var inst = instance_create_depth(xx, yy, dpth, obj);

    if (is_struct(post_var_struct)) {
        var keys = variable_struct_get_names(post_var_struct);
        var count = array_length(keys);
        for (var i = 0; i < count; i++) {
            var key = keys[i];
            var val = variable_struct_get(post_var_struct, key);
            variable_instance_set(inst, key, val);
        }
    }
    return inst;
}

function ui_dialoguebox_create(xx, yy, w, h)
{
	draw_sprite_ext(spr_pixel, 0, xx, yy, w, h, 0, c_white, 1);
	draw_sprite_ext(spr_pixel, 0, xx + 3, yy + 3, w - 6, h - 6, 0, c_black, 1);
}

function string_pos_from(substr, str, start_pos)
{
    var len = string_length(str);
    for (var n = start_pos; n <= len; n++) {
        if (string_char_at(str, n) == substr) {
            return n;
        }
    }
    return 0;
}

function time_to_mmss(seconds){
	var mm=seconds div 60
	var ss=seconds mod 60
	if (ss<10){
		return string(mm)+":0"+string(ss)
    } else {
		return string(mm)+":"+string(ss)
	}
}

function get_roomname(room_name) {
    switch (room_name) {
        case "room_test0":
            return "Waterfall - Crystal";
        default:
            return "undefined";
    }
}

function can_move(){
    var box = instance_exists(o_dialog) ? o_dialog.player_free : true
    var moveable = instance_exists(o_actor_mainpl) ? o_actor_mainpl.moveable : false
	//If this returns true, in simple words, it means the player can move!
    return box 
	&& !instance_exists(o_ui_save) && 
	!instance_exists(o_ui_menu) && 
	moveable &&
	!instance_exists(o_warp_manager) &&
	!instance_exists(o_ui_image)

}

function is_top(){
	if (instance_exists(o_actor_mainpl)){
		var top=false
		if (o_actor_mainpl.y > (o_cam.y - 240/2 + 130)){
			top=true
		}
		else{
			top=false
		}
		return top
	}
	else{
		return false
	}
}