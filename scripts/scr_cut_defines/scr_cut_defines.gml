//--------------------------------
// Definitions go here!
//--------------------------------

#macro __cutscene_free_indices global.__free_cutscenes
#macro __cutscene_pool         o_cutscene_manager.scenes

#macro __cut_clear_all for (var i=0, n=array_length(__cutscene_pool); i<n; ++i) { \
	var _c = __cutscene_pool[i];                                                  \
	if (time_source_exists(_c)) { call_cancel(_c); time_source_destroy(_c); }     \
}

#macro C_EVENT_AUTO function() { return true; }
#macro C_INIT_AUTO  0x00 /*this is pretty much null*/

#macro C_FORCELOCK  false