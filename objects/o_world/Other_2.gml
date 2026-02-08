global.debug = false


{ // resolution fix
	window_set_size(intw*windowsize,inth*windowsize);
	window_center();
	application_surface_draw_enable(false);
}

ini_open("config.ini")

global.lang = ini_read_string("config","lang","en")
global.time = ini_read_real("config","time",0)
global.room_save = ini_read_string("config","room",room_get_name(room))

// stats
global.name = ini_read_string("config","name","CHARA")
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
	{
		name: "item0",
		desc: "* item0 - Heals HP...\n* I guess that's it",
		execute: function(){
			var amount=irandom_range(1,20)
			Dialogue_Create([
				"* You recovered " + string(amount) + " HP!"
			])
			audio_play_sound(snd_heal,1,false)
			global.hp=clamp(global.hp+amount,0,global.maxhp)
		}
	},
	{
		name: "poison",
		desc: "* poison - i think it's\na bit obvious...",
		execute: function(){
			var amount=irandom_range(1,20)
			Dialogue_Create([
				"* You lost " + string(amount) + " HP!"
			])
			audio_play_sound(snd_damage,1,false)
			global.hp=clamp(global.hp-amount,0,global.maxhp)
		}
	},
	{
		name: "item1",
		desc: "* item1 - idk.",
		execute: function () {
			Dialogue_Create([
				"* as I said, idk but\ni want to fill the\nother lines..."
			])
		}
	}
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