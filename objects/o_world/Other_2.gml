global.debug = false

if (global.debug)
	instance_create(o_dev_debug)

{ // resolution fix
	window_set_size(intw*windowsize,inth*windowsize);
	window_center();
	application_surface_draw_enable(false);
}

global.time = 0

// stats
global.name = "CHARA"
global.lv = 1

global.maxhp = global.lv < 20 ? 16 + 4 * global.lv : 99;
global.hp = global.maxhp

global.att = 0
global.def = 0

global.attack = 0
global.defense = 0

global.exp = 0
global.nextexp = 10

global.gold = 0

global.items = []
global.inventory = []

global.weapon = "Stick"
global.armor = "Bandage"

room_goto_next()