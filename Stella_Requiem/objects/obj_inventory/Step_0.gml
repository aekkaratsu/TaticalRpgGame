if (keyboard_check_pressed(ord("I"))) {
    show_inventory = !show_inventory; 
}

// Add item id
if (keyboard_check_pressed(ord("E"))) 
{
    var success = InventoryAdd(id, 1); // Sent id as rootObject in the InventoryFunction
    
    if (success) {
        show_debug_message("Added item");
    } else {
        show_debug_message("Inventory full");
    }
}

// D Remove item id 1 by 1 piece
if (keyboard_check_pressed(ord("R"))) 
{
    InventoryRemove(id, 0); 
}