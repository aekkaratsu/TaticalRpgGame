if (current_alpha <= 0.01) exit;

draw_set_font(DialogueFonts);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _blink_effect = (sin(blink_timer) + 1) / 2;
draw_set_alpha(current_alpha * _blink_effect);

draw_set_color(c_black);
draw_text_transformed(x + 2, y + 2, my_text, text_scale, text_scale, 0);
draw_set_color(c_white);
draw_text_transformed(x, y, my_text, text_scale, text_scale, 0);

draw_set_alpha(1);
draw_set_halign(fa_left);