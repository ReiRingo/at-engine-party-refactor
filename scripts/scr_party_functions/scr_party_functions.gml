//--------------
//defines
//--------------

#macro PARTY_NONE -1
#macro PARTY_LAST_SPAWN global._Party_last_spawn

//--------------
//globals
//--------------

PARTY_LAST_SPAWN = noone;

//--------------
//functions
//--------------

/**
 * Initialises an instance as a party leader by setting up position tracking and member lists.
 * @param {Id.Instance} t_inst The instance to transform into a party leader.
 */
function party_make_leader(t_inst) {
	if (!variable_instance_exists(t_inst, "__pos_list__")) {
		with(t_inst) {
			__pos_list__ = ds_list_create();
			__timer__    = 0;
			_List = []; // for helpers?
		}
	}
}

/**
 * Checks if the given instance is registered as a party leader.
 * @param {Id.Instance} leader The instance to check.
 * @return {Bool} True if the instance is a leader, false otherwise.
 */
function party_is_leader(leader) {
	return (
		variable_instance_exists(leader, "__pos_list__") &&
		ds_exists(leader.__pos_list__, ds_type_list)
	);
}

/**
 * This unitialises a leader instance
 * @param {Id.Instance} leader The instance to un-leader
 * @return {Bool}
 */
function party_remove_leader(leader) {
	if (party_is_leader(leader)) {
		ds_list_destroy(leader.__pos_list__);
		return true;
	}
	return false;
}

/**
 * Adds a member to a leader's party, optionally creating the member instance if it doesn't exist.
 * @param {Id.Instance|Asset.GMObject} member The instance or object asset to add to the party.
 * @param {Id.Instance} [leader] The leader instance to attach this member to.
 * @param {Bool} [make] Whether you want to create a party instead of modify one.
 * @param {Real} [xx] The X coordinate to spawn the member at (defaults to leader's X).
 * @param {Real} [yy] The Y coordinate to spawn the member at (defaults to leader's Y).
 * @return {Bool} True if the member was successfully added, false otherwise.
 */
function party_add_member(member, leader = o_actor_mainpl, auto_make = false, xx = undefined, yy = undefined) {
	if (!instance_exists(leader))
		return false;
	
	xx = xx == undefined ? leader.x : xx;
	yy = yy == undefined ? leader.y : yy;
	
	var to_add_obj = object_force(member);
	
	if (auto_make) {
		member = instance_create(to_add_obj, xx, yy);
		PARTY_LAST_SPAWN = member;
	}
	
	if (!instance_exists(member))
		return false;
	
	
	if (party_is_leader(leader)) {
		with(member) {
			following    = true;
			follow_index = array_length(leader._List);
			target_inst  = leader;
		}
	} else {
		party_make_leader(leader);
		
		with(member) {
			following    = true;
			follow_index = 0;
			target_inst  = leader;
			leader._List[0] = self;
		}
	}
	
	return true;
}

/**
 * Removes a member from a leader's party.
 * @param {Id.Instance} member The instance of the member to remove.
 * @param {Id.Instance} [leader] The leader instance to remove the member from.
 * @param {Bool} [reorder] Whether to shift subsequent members up and update their follow_index.
 * @return {Bool} True if the member was successfully removed, false otherwise.
 */
function party_remove_member(member, leader = o_actor_mainpl, reorder = false) {
	if (!instance_exists(leader) || !instance_exists(member))
		return false;
		
	if (!variable_instance_exists(leader, "_List"))
		return false;
		
	var party_list = leader._List;
	var list_size  = array_length(party_list);
	var target_idx = member.follow_index;
	
	// Find the exact instance index in the leader's party list
//	for (var i = 0; i < list_size; i++) {
//		if (party_list[i] == member) {
//			target_idx = i;
//			break;
//		}
//	}
	
	if (target_idx == -1)
		return false;
		
	with(member) {
		following    = false;
		follow_index = PARTY_NONE;
	}
	
	array_delete(party_list, target_idx, 1);
	
	if (reorder) {
		var new_size = array_length(party_list);
		for (var i = target_idx; i < new_size; i++) {
			var remaining_member = party_list[i];
			if (instance_exists(remaining_member)) {
				remaining_member.follow_index = i;
			}
		}
	}
	
	return true;
}

function party_get_last_spawned() { return PARTY_LAST_SPAWN; }

/**
 * Checks if a leader has a specific party member and returns their follow index.
 * @param {Id.Instance|Asset.GMObject} has The member instance or object type to look for.
 * @param {Id.Instance} [who] The leader instance to search within.
 * @param {Bool} [check_exists] (Unused in logic) Checks if specified member exists.
 * @param {Real} [skip] The index array position where you want to start searching.
 * @return {Real} The index of the member in the party, or PARTY_NONE (-1) if not found/not a leader.
 */
function party_has_i(has, who = o_actor_mainpl, check_exists = true, skip = 0, ceiling_i = undefined) {
	var leader = object_force(who);
	
	if (!variable_instance_exists(who, "_List")) {
		show_debug_message("ERROR - party_has_i :: {0} is not a leader yet!", object_get_name(leader));
		return PARTY_NONE;
	}
	
	var targ = object_force(has);
	
	var who_list = who._List;
	// _List is dynamically inserted, it's best we check who instead of leader
	
	var n = array_length(who_list);
	for(var i = skip; i < n; i++) {
		var current = who_list[i];
		if (current == noone)
			continue;
		if (current.object_index == targ) return i;
	}
	
	show_debug_message("party_has_i :: Leader {0} does not have member {1}!", object_get_name(leader), object_get_name(targ));
	return PARTY_NONE;
}