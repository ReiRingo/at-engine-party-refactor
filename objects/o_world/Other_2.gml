{ // resolution fix
	window_set_size(intw*windowsize,inth*windowsize);
	window_center();
	application_surface_draw_enable(false);
}

global.lang = "en"
global.time = 245*60

// stats
global.name = "CHARA"
global.lv=1
global.maxhp=20
global.hp=global.maxhp
global.gold = 0
global.items = []

global.inventory = []

global.weapon = ""
global.armor = ""

room_goto_next()