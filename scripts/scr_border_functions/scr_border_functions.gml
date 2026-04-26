//-----------------------
// definitions
//-----------------------
#macro border_manager o_world

//-----------------------
// functions
//-----------------------
/**
 * Toggle the border
 * @param   {bool}    Toggle
 * @returns {bool}
 */
function border_set_state(tog) {
	with(global) {
		borders = tog;
		return true;
	}
	return false;
}

/**
 * Retrieves the border's current state (true / false)
 * @returns {bool}
 */
function border_get_state() {
	return /*(bool)*/global.borders; // WHAT THE FUCK LMAO I TRIED TO CAST IT TO A BOOLEAN TYPE-
}

/**
 * Forces to reset the game view
 * @returns {bool}
 */
function border_force_reset() {
	with(border_manager) {
		__window_update();
		return true;
	}
	return false;
}

/**
 * Changes the border sprite for the letterboxing
 * @param   {Asset.GMSprite | Constant.SpecialBorders} Sprite
 * @returns {bool}
 */
function border_set_sprite(spr) {
    with(border_manager) {
        border_spr   = spr;
        border_wait  = false;
        border_alpha = 1.0;
	    return true;
    }
    return false;
}

/**
 * Retrieves the border's current sprite
 * @returns {Asset.GMSprite | Constant.SpecialBorders}
 */
function border_get_sprite(spr) {
	return border_manager.border_spr;
}