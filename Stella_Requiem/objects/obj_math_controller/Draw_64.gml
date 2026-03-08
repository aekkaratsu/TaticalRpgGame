if (state == MATH_STATE.PLAYING)
{
    var w = display_get_gui_width();
    var h = display_get_gui_height();

    var box_w = 400;
    var box_h = 200;

    var left   = w*0.5 - box_w*0.5;
    var right  = w*0.5 + box_w*0.5;
    var top    = h*0.5 - box_h*0.5;
    var bottom = h*0.5 + box_h*0.5;

    draw_set_alpha(0.8);
    draw_set_color(c_black);
    draw_rectangle(left, top, right, bottom, false);

    draw_set_alpha(1);
}

if (state == MATH_STATE.PLAYING)
{
    var cx = display_get_gui_width() * 0.5;
    var cy = display_get_gui_height() * 0.5;

    draw_set_color(c_yellow);
    draw_set_halign(fa_center);

    draw_text(cx, cy + 20, "Your Answer: " + player_input);
}

if (state == MATH_STATE.PLAYING)
{
    var cx = display_get_gui_width() * 0.5;
    var cy = display_get_gui_height() * 0.5;
    
    if (instance_exists(obj_math_generator))
        {
        var gen = obj_math_generator;
        var op_string = "";


        if (gen.operator == 0) op_string = "+";
        if (gen.operator == 1) op_string = "-";
        if (gen.operator == 2) op_string = "*";

        draw_set_font(-1);
        draw_set_color(c_white);

        draw_set_halign(fa_center);
        draw_text(cx, cy-20, string(gen.a) + " " + op_string + " " + string(gen.b) + " = ?");
    }
}

if (state == MATH_STATE.FAIL || state == MATH_STATE.SUCCESS) {
    if (instance_exists(obj_math_generator))
    {
        with (obj_math_generator) instance_destroy() //this is generator
    }
    
    instance_destroy() //This is controller
}