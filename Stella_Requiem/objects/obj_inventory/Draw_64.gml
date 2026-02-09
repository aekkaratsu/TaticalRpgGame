if (!show_inventory) exit; // Check if show_inventory = false then exit(not draw)

// Find the center point
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Calculat inv Width/Heigth
var inv_width = 300 + rowLength * 36;
var inv_height = 300 + (((INVENTORY_SOLTS - 1) div rowLength) + 1) * 36;

// Start Drawing at the center of monitor using /2 to width and heigth
x = (gui_w / 2) - (inv_width / 2);
y = (gui_h / 2) - (inv_height / 2);

// Draw Invertory background 
draw_sprite_stretched(
    spr_inventory_box, 
    0, 
    x - 6, 
    y - 6, 
    inv_width, 
    inv_height
);

// Draw item inside slot
var slot_size = 64;
var slot_pad = 4;

var mous_x = device_mouse_x_to_gui(0); 
var mous_y = device_mouse_y_to_gui(0);
var hover_item_id = -1; // Store the mouse pointed item id

for (var i = 0; i < INVENTORY_SOLTS; i += 1)
{
    // Padding between box
    var xx = x + (i mod rowLength) * (slot_size + slot_pad) + slot_pad;
    var yy = y + (i div rowLength) * (slot_size + slot_pad) + slot_pad;
    
    draw_sprite_stretched(spr_inventory_slot, 0, xx, yy, slot_size, slot_size);
    
    if (mous_x > xx && mous_x < xx + slot_size && mous_y > yy && mous_y < yy + slot_size)
    {
        // Outline
        draw_set_color(c_yellow);
        draw_rectangle(xx, yy, xx + slot_size, yy + slot_size, true); // true = Draw only outline
        draw_set_color(c_white);
        
        // If there are item Store the ID on hover_item_id
        if (inventory[i] != -1) {
            hover_item_id = inventory[i];
            
            
            // Remove when right clicked
            if (mouse_check_button_pressed(mb_right))
            {
                inventory[i] = -1;
                hover_item_id = -1; // Reset
            }
        }
    }
    
    if (inventory[i] != -1)
    {
        var _item_id = inventory[i]; // Get ID the get that ID's Sprite
        
        // Check that item ID have sprite?
        if (_item_id < array_length(item_database) && item_database[_item_id] != undefined)
        {
            var _spr_formID = item_database[_item_id].sprite; // Pull Sprite form database
            draw_sprite_stretched(_spr_formID, 0, xx, yy, slot_size, slot_size);
        }
        
    }
}

// --- Item Desc ---
if (hover_item_id != -1)
{
    // Check the id is in the database ? if not use deafault _name , _desc่
    var _name = "Unknown Item";
    var _desc = "No description.";
    
    // Check for the data inside data base. if yes pull it to _name and _desc
    if (hover_item_id < array_length(item_database) && item_database[hover_item_id] != undefined) {
        _name = item_database[hover_item_id].name;
        _desc = item_database[hover_item_id].desc;
    }
    
    // Desc Position
    var desc_x = mous_x + 15;
    var desc_y = mous_y + 15;
    
    // Draw Box for desc 
    var text_w = string_width(_desc) + 20; // Calculate width by text on _desc
    if (string_width(_name) > string_width(_desc)) text_w = string_width(_name) + 20; // Use the longest text , Eg. when the name is longer than desc
    var text_h = string_height(_name) + string_height(_desc) + 20;
    
    draw_set_color(c_black);
    draw_set_alpha(0.8); 
    draw_rectangle(desc_x, desc_y, desc_x + text_w, desc_y + text_h, false);
    draw_set_alpha(1); 
    
    // Draw a text on desc
    draw_set_color(c_yellow);
    draw_text(desc_x + 10, desc_y + 10, _name); // Item name
    
    draw_set_color(c_white);
    draw_text(desc_x + 10, desc_y + 10 + string_height(_name), _desc); // item desc
}