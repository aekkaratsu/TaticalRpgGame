// --- 1. Data Retrieval & Safety Check ---
if (instance_exists(obj_battle_switcher)) {
    data = obj_battle_switcher.enemy_data;
} else {
    // Fallback if switcher is missing
    if (!variable_instance_exists(id, "data")) exit;
}

// --- 2. UI Positioning (Top-Right Aligned) ---
var _gui_w = display_get_gui_width();
var _bar_w = 200;               // Bar width
var _bar_h = 20;                // Bar height
var _margin_right = 20;         // Distance from right edge
var _top_margin = 40;           // Distance from top edge

// Calculate X to align right: (Screen Width - Bar Width - Margin)
var _x = _gui_w - _bar_w - _margin_right; 
var _y = _top_margin;

// --- 3. Draw Enemy Icon ---
var _icon_size = 64; 
var _icon_x = _x - _icon_size - 10; // Position to the left of the bar
// Center the icon vertically relative to the bar height
var _icon_y = _y - (_icon_size / 2) + (_bar_h / 2); 

if (sprite_exists(sprite_index)) {
    draw_sprite_stretched(sprite_index, 0, _icon_x, _icon_y, _icon_size, _icon_size);
}

// Draw Icon Border (Optional)
draw_set_color(c_white);
draw_rectangle(_icon_x, _icon_y, _icon_x + _icon_size, _icon_y + _icon_size, true);

// --- 4. Draw Enemy Name ---
draw_set_halign(fa_right);      // Align text to the right
draw_set_valign(fa_bottom);
draw_set_color(c_white);

// Get name safely
var _name = variable_struct_exists(data, "name") ? data.name : "Enemy"; 
// Draw name just above the HP bar, aligned to the right edge
draw_text(_x + _bar_w, _y - 5, _name); 

// --- 5. Draw HP Bar ---
// Draw Background
draw_sprite_stretched(spr_box, 0, _x, _y, _bar_w, _bar_h);

// Draw HP Fill
var _hp_percent = 0;
if (data.hp_total > 0) _hp_percent = data.hp / data.hp_total;

if (_hp_percent > 0) {
    draw_sprite_stretched_ext(spr_box, 1, _x, _y, _bar_w * _hp_percent, _bar_h, c_red, 1);
}

// --- 6. Draw HP Text Numbers ---
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
// Draw "Current / Total" in the center of the bar
draw_text(_x + (_bar_w / 2), _y + (_bar_h / 2), string(data.hp) + "/" + string(data.hp_total));

// --- Reset Draw Settings ---
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);