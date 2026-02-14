// --- 1. Check Visibility ---
if (!show_inventory) exit; // If inventory is hidden, stop drawing immediately.

// --- 2. Setup Dimensions & Position ---
// Get screen size
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Slot settings
var slot_size = 64;
var slot_pad = 4;

// Calculate Inventory Box Size (Dynamic based on slots)
// Note: Adjusted formula to fit the slots tightly. You can revert to "300 +" if you prefer a fixed size.
var inv_width = (rowLength * (slot_size + slot_pad)) + slot_pad;
var inv_height = (((INVENTORY_SOLTS - 1) div rowLength) + 1) * (slot_size + slot_pad) + slot_pad;

// Add some padding for the box background
inv_width += 12; 
inv_height += 12;

// Calculate Position: Top Center
var start_x = (gui_w / 2) - (inv_width / 2); // Keep Horizontal Center
var start_y = 20;       // Align to top(with 20px margin)

// --- 3. Draw Background ---
draw_sprite_stretched(
    spr_inventory_box, 
    0, 
    start_x, 
    start_y, 
    inv_width, 
    inv_height
);

// Adjust start position for slots (padding inside the box)
var x_offset = start_x + 6;
var y_offset = start_y + 6;

// --- 4. Loop Through Slots ---
var mous_x = device_mouse_x_to_gui(0); 
var mous_y = device_mouse_y_to_gui(0);
var hover_item_id = -1; // Reset hover ID

for (var i = 0; i < INVENTORY_SOLTS; i += 1)
{
    // Calculate current slot position
    var xx = x_offset + (i mod rowLength) * (slot_size + slot_pad);
    var yy = y_offset + (i div rowLength) * (slot_size + slot_pad);
    
    // 4.1 Draw Slot Background
    draw_sprite_stretched(spr_inventory_slot, 0, xx, yy, slot_size, slot_size);
    
    // 4.2 Draw Item Sprite (If item exists)
    if (inventory[i] != -1)
    {
        var _item_id = inventory[i];
        
        // Check if item exists in database
        if (_item_id < array_length(item_database) && item_database[_item_id] != undefined)
        {
            var _spr = item_database[_item_id].sprite;
            draw_sprite_stretched(_spr, 0, xx, yy, slot_size, slot_size);
        }
    }

    // 4.3 Mouse Interaction (Hover & Click)
    if (mous_x > xx && mous_x < xx + slot_size && mous_y > yy && mous_y < yy + slot_size)
    {
        // Draw Outline (Hover Effect)
        draw_set_color(c_yellow);
        draw_rectangle(xx, yy, xx + slot_size, yy + slot_size, true); 
        draw_set_color(c_white);
        
        // Logic for Item in this slot
        if (inventory[i] != -1) 
        {
            // Store ID for description tooltip later
            hover_item_id = inventory[i];
            
            // --- Right Click: Remove Item ---
            if (mouse_check_button_pressed(mb_right))
            {
                inventory[i] = -1;
                hover_item_id = -1; // Clear hover to prevent ghost tooltip
            }
            
            // --- Left Click: Use Item (NEW FEATURE) ---
            if (mouse_check_button_pressed(mb_left))
            {
                var _db_item = item_database[inventory[i]];
                
                // Check if this item has an 'effect' function
                if (variable_struct_exists(_db_item, "effect")) 
                {
                    _db_item.effect(); // Execute the effect (e.g., Heal)
                    
                    // Remove item after use (consumable)
                    inventory[i] = -1;
                    hover_item_id = -1; 
                }
            }
        }
    }
}

// --- 5. Draw Item Description (Tooltip) ---
if (hover_item_id != -1)
{
    // Default values
    var _name = "Unknown Item";
    var _desc = "No description.";
    
    // Retrieve data from database
    if (hover_item_id < array_length(item_database) && item_database[hover_item_id] != undefined) {
        _name = item_database[hover_item_id].name;
        _desc = item_database[hover_item_id].desc;
    }
    
    // Tooltip Position (offset from mouse)
    var desc_x = mous_x + 15;
    var desc_y = mous_y + 15;
    
    // Calculate Box Size based on text length
    var text_w = string_width(_desc) + 20; 
    if (string_width(_name) > string_width(_desc)) text_w = string_width(_name) + 20; 
    var text_h = string_height(_name) + string_height(_desc) + 20;
    
    // Keep tooltip inside screen bounds (Optional polish)
    if (desc_x + text_w > gui_w) desc_x = gui_w - text_w;
    if (desc_y + text_h > gui_h) desc_y = gui_h - text_h;
    
    // Draw Tooltip Box
    draw_set_color(c_black);
    draw_set_alpha(0.8); 
    draw_rectangle(desc_x, desc_y, desc_x + text_w, desc_y + text_h, false);
    draw_set_alpha(1); 
    
    // Draw Text
    draw_set_color(c_yellow);
    draw_text(desc_x + 10, desc_y + 10, _name); // Title
    
    draw_set_color(c_white);
    draw_text(desc_x + 10, desc_y + 10 + string_height(_name), _desc); // Description
}