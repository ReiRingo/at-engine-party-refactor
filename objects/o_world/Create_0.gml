frames = 0
intw = 640
inth = 480
windowsize = 1

ini_open("config.ini");
global.lang = ini_read_string("config", "lang", "en");
ini_close();

global.console = false

global.time = 0
global.room_name = ""

global.name = ""
global.lv = 0
global.maxhp = 0
global.hp = 0
global.att = 0
global.def = 0
global.attack = 0
global.defense = 0
global.exp = 0
global.nextexp = 0

global.facing = 0

global.items = []

global.inventory = [""]

global.weapon = ""
global.armor = ""