var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

draw_set_color(c_black);
draw_set_alpha(1);
draw_rectangle(0, 0, _gw, _gh, false);
draw_set_color(c_white);

if (current_scene < array_length(cg_sequence)) {
    draw_sprite_stretched_ext(cg_sequence[current_scene], 0, 0, 0, _gw, _gh, c_white, cg_alpha);
}

draw_set_alpha(1);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(_gw - 20, _gh - 20, "Press SPACE to Skip");

draw_set_halign(fa_left);
draw_set_valign(fa_top);