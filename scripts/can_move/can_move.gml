function can_move(){
    var box = instance_exists(o_dialog) ? o_dialog.player_free : true
    var moveable = instance_exists(o_actor_mainpl) ? o_actor_mainpl.moveable : false
    return box && !instance_exists(o_ui_save) && !instance_exists(o_ui_menu) && moveable //If this returns true, in simple words, it means the player can move!
}