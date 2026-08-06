function determine_sprite(buttonname){
	return asset_get_index("spr_enc_button_"+buttonname)
}
function enc_button(){
	name = "undefined"
	selectable = true // is it selectable?
	press = function(){
		// what will happen upon pressing it?
	}
	determine_sprite(name) // determines the sprite lang based on the "name" variable
}

function enc_button_fight() : enc_button() constructor{
	name = "fight"
	selectable = true
	press = function(){
		o_enc.set_menu(BATTLE_MENU.CHOOSE_ENEMY)
        o_enc.menu.subcurrent=BATTLE_MENU.FIGHT
	}
	sprite = determine_sprite(name)
}
function enc_button_act() : enc_button() constructor{
	name = "act"
	selectable = true
	press = function(){
		o_enc.set_menu(BATTLE_MENU.CHOOSE_ENEMY,0)
        o_enc.menu.subcurrent=BATTLE_MENU.ACT
	}
	sprite = determine_sprite(name)
}
function enc_button_item() : enc_button() constructor{
	name = "item"
	selectable = true
	press = function(){
		o_enc.set_menu(BATTLE_MENU.ITEM)
	}
	sprite = determine_sprite(name)
}
function enc_button_mercy() : enc_button() constructor{
	name = "mercy"
	selectable = true
	press = function(){
		o_enc.set_menu(BATTLE_MENU.CHOOSE_ENEMY)
        o_enc.menu.subcurrent=BATTLE_MENU.MERCY
	}
	sprite = determine_sprite(name)
}
