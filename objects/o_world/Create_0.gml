frames = 0

<<<<<<< Updated upstream
global.borders = true
=======
global.borders = false
>>>>>>> Stashed changes

global.lang = ""

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
global.phonelist = []

global.inventory = [""]

global.weapon = ""
global.armor = ""

global.input_delay = 0;

border_surface =surface_create(window_get_width(),window_get_height());	

BASE_WIDTH = 320
BASE_HEIGHT = 240
WINDOW_WIDTH = 640
WINDOW_HEIGHT = 480
if (global.borders){
    WINDOW_WIDTH = 1920/2
    WINDOW_HEIGHT = 1080/2
}
RESOLUTION = 2

window_set_size(WINDOW_WIDTH,WINDOW_HEIGHT)
surface_resize(application_surface,BASE_WIDTH*RESOLUTION,BASE_HEIGHT*RESOLUTION)
application_surface_draw_enable(false)
display_reset(0,true)
window_center()