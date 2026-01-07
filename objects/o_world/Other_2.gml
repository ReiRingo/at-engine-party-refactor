global.debug = false

if (global.debug)
	instance_create(o_dev_debug)

{ // resolution fix
	window_set_size(intw*windowsize,inth*windowsize);
	window_center();
	application_surface_draw_enable(false);
}

ini_open("config.ini")

global.lang = ini_read_string("config","lang","en")
global.time = ini_read_real("config","time",0)

// stats
global.name = ini_read_string("config","name","")
global.lv = ini_read_real("config","lv",1)

global.maxhp = global.lv<20?16+4*global.lv:99
global.hp = global.maxhp

global.att = ini_read_real("config","att",0)
global.def = ini_read_real("config","def",0)

global.attack = ini_read_real("config","attack",0)
global.defense = ini_read_real("config","defense",0)

global.exp = ini_read_real("config","exp",0)
global.nextexp = (global.lv<= 1)?10:10+(global.lv-1)*10

global.gold = ini_read_real("config","gold",0)

global.weapon = ini_read_string("config","weapon","Stick")
global.armor = ini_read_string("config","armor","Bandage")

global.items = [
		"item0",
		"item1",
		"moreitems?",
	]

global.inventory = [""]

//save by default
ini_write_string("config","lang",global.lang)
ini_write_string("config","time",global.time)
ini_write_string("config","name",global.name)
ini_write_string("config","lv",global.lv)
ini_write_string("config","att",global.att)
ini_write_string("config","def",global.def)
ini_write_string("config","attack",global.attack)
ini_write_string("config","defense",global.defense)
ini_write_string("config","exp",global.exp)
ini_write_string("config","gold",global.gold)
ini_write_string("config","weapon",global.weapon)
ini_write_string("config","armor",global.armor)

ini_close()

room_goto_next()