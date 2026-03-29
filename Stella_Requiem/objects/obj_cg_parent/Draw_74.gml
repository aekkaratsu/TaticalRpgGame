var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

draw_set_color(c_black);
draw_set_alpha(1);
draw_rectangle(0, 0, _gw, _gh, false);
draw_set_color(c_white);

if (current_scene < array_length(cg_sequence)) {
    var _cg_sprite = cg_sequence[current_scene].img;
    
    var _sw = _gw * current_zoom;
    var _sh = _gh * current_zoom;
    var _sx = (_gw - _sw) / 2;
    var _sy = (_gh - _sh) / 2;
    
    draw_sprite_stretched_ext(_cg_sprite, 0, _sx, _sy, _sw, _sh, c_white, cg_alpha);
}