can_repeat = true;

event = function() {
	if (party_has_i(I_RED_ENTITY) == PARTY_NONE) {
		party_add_member(I_RED_ENTITY);
	} else {
		party_remove_member(I_RED_ENTITY);
	}
};