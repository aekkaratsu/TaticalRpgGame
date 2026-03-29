// Check Visibility
if (!show_inventory) exit; 

// เพิ่มเงื่อนไข: ถ้าอยู่ในเทิร์นศัตรู ให้ซ่อน Inventory ทันที
if (instance_exists(obj_battle_manager)) {
    if (obj_battle_manager.enemy_turn) exit;
}

// Setup Dimensions & Position 
// Get screen size
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Slot settings
var slot_size = 64;
var slot_pad = 4;

// Calculate Inventory Box Size (Dynamic based on slots)
var inv_width = (rowLength * (slot_size + slot_pad)) + slot_pad;
var inv_height = (((INVENTORY_SOLTS - 1) div rowLength) + 1) * (slot_size + slot_pad) + slot_pad;

// Add some padding for the box background
inv_width += 12; 
inv_height += 12;

// Calculate Position: Top Center
var start_x = (gui_w / 2) - (inv_width / 2); 
var start_y = 20;       

// --- Draw Background ---
draw_sprite_stretched(
    spr_inventory_box, 
    0, 
    start_x, 
    start_y, 
    inv_width, 
    inv_height
);

// Adjust start position for slots
var x_offset = start_x + 6;
var y_offset = start_y + 6;

// --- Loop Through Slots ---
var mous_x = device_mouse_x_to_gui(0); 
var mous_y = device_mouse_y_to_gui(0);
var hover_item_id = -1; 

for (var i = 0; i < INVENTORY_SOLTS; i += 1)
{
    var xx = x_offset + (i mod rowLength) * (slot_size + slot_pad);
    var yy = y_offset + (i div rowLength) * (slot_size + slot_pad);
    
    draw_sprite_stretched(spr_inventory_slot, 0, xx, yy, slot_size, slot_size);
    
    if (inventory[i] != -1)
    {
        var _item_id = inventory[i];
        if (_item_id < array_length(item_database) && item_database[_item_id] != undefined)
        {
            var _spr = item_database[_item_id].sprite;
            draw_sprite_stretched(_spr, 0, xx, yy, slot_size, slot_size);
        }
    }

    if (mous_x > xx && mous_x < xx + slot_size && mous_y > yy && mous_y < yy + slot_size)
    {
        draw_set_color(c_yellow);
        draw_rectangle(xx, yy, xx + slot_size, yy + slot_size, true); 
        draw_set_color(c_white);
        
        if (inventory[i] != -1) 
        {
            hover_item_id = inventory[i];
            
            if (mouse_check_button_pressed(mb_right))
            {
                inventory[i] = -1;
                hover_item_id = -1; 
            }
            
            if (mouse_check_button_pressed(mb_left))
            {
                var _datab_item = item_database[inventory[i]];
                
                if (variable_struct_exists(_datab_item, "sound"))
                {
                    var _sound = _datab_item.sound;
                    audio_play_sound(_sound, 10, false);
                }
                
                if (variable_struct_exists(_datab_item, "effect")) 
                {
                    _datab_item.effect(); 
                    inventory[i] = -1;
                    hover_item_id = -1; 
                }
            }
        }
    }
}

// --- Draw Item Description (Tooltip) ---
if (hover_item_id != -1)
{
    var _name = "Unknown Item";
    var _desc = "No description.";
    
    if (hover_item_id < array_length(item_database) && item_database[hover_item_id] != undefined) {
        _name = item_database[hover_item_id].name;
        _desc = item_database[hover_item_id].desc;
    }
    
    var desc_x = mous_x + 15;
    var desc_y = mous_y + 15;
    
    var text_w = string_width(_desc) + 20; 
    if (string_width(_name) > string_width(_desc)) text_w = string_width(_name) + 20; 
    var text_h = string_height(_name) + string_height(_desc) + 20;
    
    if (desc_x + text_w > gui_w) desc_x = gui_w - text_w;
    if (desc_y + text_h > gui_h) desc_y = gui_h - text_h;
    
    draw_set_color(c_black);
    draw_set_alpha(0.8); 
    draw_rectangle(desc_x, desc_y, desc_x + text_w, desc_y + text_h, false);
    draw_set_alpha(1); 
    
    draw_set_color(c_yellow);
    draw_text(desc_x + 10, desc_y + 10, _name); 
    
    draw_set_color(c_white);
    draw_text(desc_x + 10, desc_y + 10 + string_height(_name), _desc); 
}