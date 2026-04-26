if (instance_exists(target_inst)) {
	var target = target_inst[$ "__pos_list__"] ?? -1;
	if (ds_exists(target, ds_type_list)) ds_list_destroy(target);
}