can_repeat = false;

event = function() {
	party_add_member(o_npc_doppleganger_green, undefined, true);
	var inst = party_get_last_spawned();
};