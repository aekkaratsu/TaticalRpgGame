// 1. Calculate Draw Position with Shake Effect
// Apply a random offset to X and Y based on the 'shake' variable.
// If 'shake' is 0, the position remains at (x, y).
var _draw_x = x + random_range(-shake, shake);
var _draw_y = y + random_range(-shake, shake);

// 2. Sprite Existence Check
// Ensure the object has a valid sprite assigned to prevent errors.
if (sprite_index != -1) 
{
    // --- 3. Render Logic ---
    if (flash > 0) 
    {
        //Flash StateHit Effect
        
        gpu_set_fog(true, c_white, 0, 0); // Enable GPU Fog to force the sprite to render as solid white.
        
        // Draw the sprite at the shaken position.
        draw_sprite_ext(sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, image_angle, c_white, 1);
        
       
        gpu_set_fog(false, c_white, 0, 0); // Disable GPU Fog immediately to avoid affecting other objects.
    } 
    else 
    {
        //Normal State Standard Rendering
        
        // Draw the sprite normally using the shaken coordinates (_draw_x, _draw_y).
        // This ensures the enemy shakes even when not flashing white.
        draw_sprite_ext(sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
}