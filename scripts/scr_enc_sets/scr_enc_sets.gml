function enc_set(){
	name = "undefined"
	flavor = "undefined"
	
	enemies = [
	]
	
	bgm = mus_battle
	bg_type = BG_TYPE.DEFAULT
}

function enc_set_test() : enc_set() constructor{
	name = "testenemy"
	flavor = "* TESTENEMY Blocks the way!"
	
	enemies = [
		new enc_enemy_test(),
        new enc_enemy_test2(),
	]
	
	bgm = mus_stronger
	bg_type = BG_TYPE.DEFAULT
}
