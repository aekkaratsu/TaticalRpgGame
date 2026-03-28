if (current_scene < array_length(cg_sequence)) {
    var _cg_sprite = cg_sequence[current_scene].img;
    
    var _gw = display_get_gui_width();
    var _gh = display_get_gui_height();
    
    var _sw = _gw * current_zoom;
    var _sh = _gh * current_zoom;
    var _sx = (_gw - _sw) / 2;
    var _sy = (_gh - _sh) / 2;
    
    draw_sprite_stretched_ext(_cg_sprite, 0, _sx, _sy, _sw, _sh, c_white, cg_alpha);
}

if (skip_timer > 0) {
    var _gw = display_get_gui_width();
    var _gh = display_get_gui_height();
    
    var _bar_w = 150;
    var _bar_h = 8;
    var _pad_x = 20;
    var _pad_y = 20;
    
    var _x1 = _gw - _bar_w - _pad_x;
    var _y1 = _gh - _bar_h - _pad_y;
    var _x2 = _gw - _pad_x;
    var _y2 = _gh - _pad_y;
    
    var _ratio = clamp(skip_timer / skip_duration, 0, 1);
    var _fill = _bar_w * _ratio;
    
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(_x1 - 2, _y1 - 2, _x2 + 2, _y2 + 2, false);
    
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_rectangle(_x1, _y1, _x1 + _fill, _y2, false);
}