var _win_w = window_get_width();
var _win_h = window_get_height();

var _target_w = (global.borders ? 960 : 640);
var _target_h = (global.borders ? 540 : 480);
var _ratio    = min(_win_w / _target_w, _win_h / _target_h);

var _border_x = (_win_w - (_target_w * _ratio)) * 0.5;
var _border_y = (_win_h - (_target_h * _ratio)) * 0.5;

var _game_w = 640 * _ratio;
var _game_h = 480 * _ratio;

var _game_x = _border_x + (global.borders ? 160 * _ratio : 0);
var _game_y = _border_y + (global.borders ? 30 * _ratio : 0);

display_set_gui_maximise(1, 1, 0, 0);

var _border_spr;
if (global.borders) {
    _border_spr = border_spr;
    if (!is_ptr(_border_spr) && sprite_exists(_border_spr)) {
        draw_sprite_stretched_ext(_border_spr, 0, _border_x, _border_y, 960 * _ratio, 540 * _ratio, c_white, border_alpha);
    }
    else if (_border_spr == B_PILLARBOX) {
        var _bg_w = 960 * _ratio;
        var _bg_h = 720 * _ratio;
        
        var _bg_y_offset = ((540 * _ratio) - _bg_h) / 2;

        draw_surface_stretched_ext(application_surface, _border_x, _border_y + _bg_y_offset, _bg_w, _bg_h, BORDER_PB_COL, border_alpha);
        draw_sprite_stretched_ext(spr_ui_border_outline, 0, _border_x, _border_y, 960 * _ratio, 540 * _ratio, c_white, border_alpha);
    }
}

gpu_set_blendenable(false);
draw_surface_stretched(application_surface, _game_x, _game_y, _game_w, _game_h);
gpu_set_blendenable(true);

display_set_gui_size(BASE_WIDTH, BASE_HEIGHT);
display_set_gui_maximise(_ratio * 2, _ratio * 2, _game_x, _game_y);