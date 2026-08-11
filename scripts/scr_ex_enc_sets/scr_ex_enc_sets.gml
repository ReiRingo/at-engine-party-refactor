function ex_enc_set_duo() : enc_set() constructor{
	name = "duo"
	flavor = "* Froggit and Whimsun drew near!"
	
	enemies = [
		new ex_enc_enemy_froggit(),
		new ex_enc_enemy_whimsun(),
	]
	
	bgm = mus_battle
	bg_type = BG_TYPE.DEFAULT
}
