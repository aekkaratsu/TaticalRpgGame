// --- 1. Calculate Draw Position (Handling Shake Effect) ---
// Apply randomized offset if 'shake' value is greater than zero
var _draw_x = x + random_range(-shake, shake);
var _draw_y = y + random_range(-shake, shake);

// --- 2. Sprite Validation (Safety Check) ---
// Skip drawing if sprite_index is -1 to prevent game crashes
if (sprite_index != -1) 
{
    // --- 3. Drawing Logic ---
    if (flash > 0) 
    {
        // Draw with White Flash (Fog Effect) when hit
        gpu_set_fog(true, c_white, 0, 0);
        draw_sprite_ext(sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, image_angle, c_white, 1);
        gpu_set_fog(false, c_white, 0, 0);
    } 
    else 
    {
        // Normal Drawing
        draw_sprite_ext(sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
}
else
{
    // --- Debug Placeholder ---
    // Optional: Draw a red rectangle if the sprite is missing for easier debugging
    // draw_set_color(c_red);
    // draw_rectangle(_draw_x - 10, _draw_y - 10, _draw_x + 10, _draw_y + 10, true);
    // draw_set_color(c_white);
}