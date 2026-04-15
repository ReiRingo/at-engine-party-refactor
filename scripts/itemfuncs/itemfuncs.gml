<<<<<<< Updated upstream
//By namu
=======
//by namuframes
>>>>>>> Stashed changes
enum ITEMTYPES {
	ARMOR,
	WEAPON,
	CONSUMEABLE,
	SPECIAL
}
<<<<<<< Updated upstream
function item() constructor { //Template struct for items
=======
function item() constructor { //template struct for items
>>>>>>> Stashed changes
	name = {}
	name.normal = "";
	name.short = name.normal;
	name.joke = name.normal
	name.joke_short = name.short
    sellable = true
    sell_cost = 1 // default
	description = {
		check: "",
		shop: ""
	}
	type = ITEMTYPES.SPECIAL;
}

<<<<<<< Updated upstream
function itemWeapon() : item() constructor {type = ITEMTYPES.WEAPON; atk = 0} //Template struct for Weapons
function itemArmor() : item() constructor {type = ITEMTYPES.ARMOR; def = 0} //Template struct for Armor
function itemConsumeable() : item() constructor {type = ITEMTYPES.CONSUMEABLE; amount = 0;} //Template struct for Consumeables
=======
function itemWeapon() : item() constructor {type = ITEMTYPES.WEAPON; atk = 0} //template struct for Weapons
function itemArmor() : item() constructor {type = ITEMTYPES.ARMOR; def = 0} //template struct for Armor
function itemConsumeable() : item() constructor {type = ITEMTYPES.CONSUMEABLE; amount = 0;} //template struct for Consumeables
>>>>>>> Stashed changes
function itemSpecial() : item() constructor {
	type = ITEMTYPES.SPECIAL;
	removeable = true
	execute = function() {
		Dialogue_Create("* Somehow, you messed up")	
	}
}

//Usefull
function ItemIsValid(ITEM) {
	if (!is_struct(ITEM)) {
		show_debug_message($"{ITEM} not found!")
		return false
	} else {
		return true
	}
}

function ItemAdd(ITEM) {
	if (ItemIsValid(ITEM)) {array_push(global.items,ITEM);	}
}

function ItemGetName(ITEM,WICH="normal") {
    if (ItemIsValid(ITEM)) {
        var output = struct_get(ITEM.name,"normal")
        if (struct_exists(ITEM.name,WICH)) {
            var nm = struct_get(ITEM.name,WICH)
            if (string_length(nm) > 0) {output = nm};
        }
        return output
    }
}
//Example Items
function STICK() : itemWeapon() constructor {
	name.normal = "Stick"
	description.check = "* STICK - AT 2\n(rainbow)I don't know what to write down, just filling the lines lol"
	atk = 2
}

function RIBBON() : itemArmor() constructor {
	name.normal = "Ribbon"
	description.check = "* RIBBON - DEF 2\n(rainbow)I don't know what to write down, just filling the lines lol"
	def = 2
}

function MONSTERCANDY() : itemConsumeable() constructor {
	name.normal = "Monster Candy"
	description.check = "* \"Monster Candy\" - Heals 10 HP\n* Has a distinct,\nnon-licorice flavor."
	amount = 10
}

function PUNCHCARD() : itemSpecial() constructor {
	name.normal = "Punch Card"
	removeable = false
	execute = function() {
		if (!instance_exists(o_ui_image)) {
			var i = instance_create(o_ui_image,320/2,240/2,DEPTH_UI.MENU_UI-2);
			i.sprite_index = spr_punch_card
			i.image_index = loc(0,1)
		}
	}
	description.check = "* \"Punch Card\" - Use to make punching attacks stronger in\none battle."
<<<<<<< Updated upstream
}
=======
}
>>>>>>> Stashed changes
