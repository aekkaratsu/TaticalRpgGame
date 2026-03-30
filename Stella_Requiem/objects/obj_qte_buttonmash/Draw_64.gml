var cx = display_get_gui_width() * 0.5;
var cy = display_get_gui_height() * 0.5;

draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_text(cx, cy -40, "PRESS [SPACE]!");

//Progress bar
var bar_w = 300;
var bar_h = 30;
var progress = current_presses / required_presses;

draw_set_colour(c_dkgray);
draw_rectangle(cx - bar_w*0.5, cy, cx+bar_w*0.5, cy + bar_h, false);

draw_set_color(c_lime);
draw_rectangle(cx-bar_w*0.5, cy, cx-bar_w*0.5 + bar_w*progress, cy + bar_h, false);

draw_set_colour(c_white);
draw_text(cx,cy+bar_h+10, string(current_presses) + " / " + string(required_presses));
