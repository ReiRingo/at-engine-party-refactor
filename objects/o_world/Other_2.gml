global.debug = false

instance_create(o_cutscene_manager)

{ // resolution fix
    gpu_set_tex_filter(false)
}

ini_open("config.ini")

global.lang      = ini_read_string("config","lang","en")
global.time      = ini_read_real("config","time",0)
global.room_save = ini_read_string("config","room",room_get_name(room))

// stats
global.name = ini_read_string("config","name","CHARA")
global.lv   = ini_read_real("config","lv",1)

global.maxhp = global.lv<20?16+4*global.lv:99
global.hp    = global.maxhp

global.att = ini_read_real("config","att",0)
global.def = ini_read_real("config","def",0)

global.attack  = ini_read_real("config","attack",0)
global.defense = ini_read_real("config","defense",0)

global.exp     = ini_read_real("config","exp",0)
global.nextexp = (global.lv<=1)?10:10+(global.lv-1)*10

global.gold = ini_read_real("config","gold",0)

global.fun_value = ini_read_real("config", "fun_value", irandom(99) + 1);

global.items = []
ItemAdd(new STICK())
ItemAdd(new RIBBON())
ItemAdd(new MONSTERCANDY())
ItemAdd(new PUNCHCARD())
ItemAdd(new STICK())
ItemAdd(new MONSTERCANDY())
ItemAdd(new MONSTERCANDY())
ItemAdd(new MONSTERCANDY())

global.inventory = [""]

ini_close()

//save by default
save_game()

room_goto_next()