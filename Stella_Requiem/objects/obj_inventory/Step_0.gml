// Toggle Inventory
if (keyboard_check_pressed(ord("I"))) {
    show_inventory = !show_inventory; 
}

// --- For Debug ---
// Add item via id 
if (keyboard_check_pressed(ord("L"))) 
{
    var success = InventoryAdd(id, 1); // Sent id as rootObject in the InventoryFunction
    
    if (success) {
        show_debug_message("Added item");
    } else {
        show_debug_message("Inventory full");
    }
}

// D Remove item via id 
if (keyboard_check_pressed(ord("R"))) 
{
    InventoryRemove(id, 0); 
}