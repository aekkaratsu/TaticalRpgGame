// Draw GUI - obj_qte_sequence
var cx = display_get_gui_width()  * 0.5;
var cy = display_get_gui_height() * 0.5;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_white);
draw_set_font(fnt_large); 
draw_text(cx, cy - 80, "Press the sequence!");

var btn_size = 60;  
var spacing  = 70;  // ระยะห่างระหว่างปุ่ม
var total_w  = seq_length * spacing;
var start_x  = cx - total_w * 0.5 + spacing * 0.5;

for (var i = 0; i < seq_length; i++) {
    var label = key_labels[sequence[i]];
    var bx    = start_x + i * spacing;
    var by    = cy + 10;

    // วาดกล่องพื้นหลัง
    if (i < current_index) {
        draw_set_color(c_lime);
    } else if (i == current_index) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_dkgray);
    }
    draw_rectangle(bx - btn_size*0.5, by - btn_size*0.5,
                   bx + btn_size*0.5, by + btn_size*0.5, false);

    // วาดตัวอักษรลูกศร
    draw_set_color(c_black);
    draw_set_font(fnt_large); 
    draw_text(bx, by, label);
}

draw_set_valign(fa_top); // reset กลับ