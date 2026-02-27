  
var window_w = WINDOW_WIDTH
var window_h = WINDOW_HEIGHT
var game_width = BASE_WIDTH*2 
var game_height = BASE_HEIGHT*2

if (window_get_fullscreen()){
    window_w = WINDOW_WIDTH*2.05
    window_h = WINDOW_HEIGHT*1.87
    game_width = BASE_WIDTH*1.8
    game_height = BASE_HEIGHT*2
}

if (global.borders){
    if (window_get_fullscreen()){
        window_w = WINDOW_WIDTH*2.25
        window_h = WINDOW_HEIGHT*1.87
        game_width = BASE_WIDTH*2
        game_height = BASE_HEIGHT*2
    }
}

var gui_width = window_h
var gui_height = window_h
var offset = {
	x: 0,
	y: 0,
}
if (global.borders){
    offset = {
	   x: 160,
	   y: 30,
    }
}
else{
    if (window_get_fullscreen()){
        offset = {
	       x: 30,
	       y: 0,
        }
    }
}
display_set_gui_size(WINDOW_WIDTH,WINDOW_HEIGHT)
draw_surface_stretched(application_surface,offset.x,offset.y,game_width,game_height)
if (global.borders)
    draw_sprite_ext(spr_ui_border,0,0,0,.5,.5,0,c_white,1)

var _w = (window_w/BASE_WIDTH)
var _h = (window_h/BASE_HEIGHT)
if (global.borders){
    _w = (window_w/BASE_WIDTH)/1.5
    _h = (window_h/BASE_HEIGHT)/1.125
}

var _x=	(offset.x/2)*_w;
var _y= (offset.y/2)*_h;

display_set_gui_maximise(_w,_h,_x,_y)