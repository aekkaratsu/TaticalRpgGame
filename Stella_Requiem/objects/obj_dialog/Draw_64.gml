// --- 1. UI Settings & Box Dimensions ---
var _margin = 16; 
var _dx = _margin; 
var _dy = gui_h * 0.7; 
var _boxw = gui_w - (_margin * 2); 
var _boxh = gui_h - _dy - 16; 

// Draw main text box background
draw_sprite_stretched_ext(spr_dia_box, 0, _dx, _dy, _boxw, _boxh, c_black, 0.5);

// Internal padding for contents
_dx += 16;
_dy += 16;


// --- 2. Portrait Setup & Drawing ---
var _current_name = messages[current_message].name;
var _portrait_sprite = noone; 

// Fetch portrait sprite from global struct safely
if (variable_struct_exists(global.char_portraits, _current_name)) {
    _portrait_sprite = global.char_portraits[$ _current_name];
}

// Portrait dimensions and layout
var _portrait_w = 175; 
var _portrait_h = 195; 
var _portrait_gap = 16; 
var _portrait_area_w = 0; 

// Draw portrait if it exists
if (sprite_exists(_portrait_sprite)) {
    _portrait_area_w = _portrait_w + _portrait_gap; // Reserve space for text
    draw_sprite_stretched(_portrait_sprite, 0, _dx, _dy, _portrait_w, _portrait_h);
}


// --- 3. Text & Name Drawing ---

// Shift text to the right if a portrait is present
var _text_x_start = _dx + _portrait_area_w;

draw_set_font(DialogueFonts);

// --- Draw Speaker Name ---
var _name_color = c_white; // Default color
if (variable_struct_exists(global.char_colors, _current_name)) {
    _name_color = global.char_colors[$ _current_name];
}

draw_set_color(_name_color);
draw_text(_text_x_start, _dy, _current_name);
draw_set_color(c_white); // Reset to white

// Vertical gap between name and message
_dy += 50; 

// --- Draw Message (Typewriter Effect) ---
// 🛠️ FIXED: Using 'draw_message' here restores the character-by-character reveal!
var _msg_to_draw = draw_message; 

// Calculate maximum text width to trigger auto-line breaks
var _max_text_width = _boxw - _portrait_area_w - 32;

// Draw the text with auto-wrapping
draw_text_ext(_text_x_start, _dy, _msg_to_draw, -1, _max_text_width);