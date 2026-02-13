draw_self(); // Draw the player sprite

// --- UI Settings ---
// Set positions and dimensions for the vials
var _x_start = 10;   // Distance from left edge
var _y_top = 10;     // Distance from top edge
var _vial_w = 20;    // Width of each vial
var _vial_h = 80;    // Height of each vial
var _gap = 5;        // Space between HP and Charge vials

// --- Calculate Values ---
// Convert current HP and Charge into percentage (0.0 to 1.0)
var _hp_percent = data.hp / data.hp_total;
var _charge_percent = data.charge; 

// =====================================================
// Draw HP Bar (Solid Fill)
// =====================================================
var _x_hp = _x_start;
var _fill_hp = _vial_h * _hp_percent; // Height of the green liquid in pixels

// Draw the empty vial (Background)
draw_sprite_stretched(spr_box, 0, _x_hp, _y_top, _vial_w, _vial_h); 

if (_fill_hp > 0) {
    // Calculate Y position so the liquid stays at the bottom (Bottom-Up filling)
    var _draw_y_hp = (_y_top + _vial_h) - _fill_hp;
    
    // Draw the green liquid using Nine Slice scaling
    draw_sprite_stretched_ext(spr_box, 1, _x_hp, _draw_y_hp, _vial_w, _fill_hp, c_lime, 1);
}

// =====================================================
// Draw Charge Bar (Segmented / Dots)
// =====================================================
var _x_charge = _x_start + _vial_w + _gap; // Positioned next to HP bar
var _dot_h = 4;        // Height of each individual dot
var _dot_spacing = 2;  // Space between dots
var _total_dots = floor(_vial_h / (_dot_h + _dot_spacing)); // Max dots that fit in the vial

// Draw the charge vial background (Dimmed)
draw_sprite_stretched_ext(spr_box, 0, _x_charge, _y_top, _vial_w, _vial_h, c_white, 0.3);

// Loop to draw each dot from bottom to top
for (var i = 0; i < _total_dots; i++) 
{
    // Calculate Y position for each dot based on its index (i)
    var _dot_y = (_y_top + _vial_h) - ((i + 1) * (_dot_h + _dot_spacing));
    
    // Check if the current dot should be lit up based on charge percentage
    var _is_filled = (i / _total_dots) < _charge_percent;
    
    if (_is_filled) {
        // Draw active dot (Bright Aqua)
        draw_sprite_stretched_ext(spr_box, 1, _x_charge, _dot_y, _vial_w, _dot_h, c_aqua, 1);
    } else {
        // Draw inactive dot (Dark Grey)
        draw_sprite_stretched_ext(spr_box, 1, _x_charge, _dot_y, _vial_w, _dot_h, c_dkgray, 0.5);
    }
}