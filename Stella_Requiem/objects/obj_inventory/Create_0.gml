// -- Intialize -- //
#macro INVENTORY_SOLTS 8 // Set Constants , Decide inventory slots
rowLength = 8;
inventory = array_create(INVENTORY_SOLTS, -1) // ( <Array Size>, )
randomize();
//inventory[0] = 1;
show_inventory = false; // Set Deafault



// -- Item Database -- //
item_database = [] // Create Array

// Use the same format below.
item_database[0] = {
    name : "???",
    desc : "Happy Birth Day!",
    sprite : spr_item_1
}

item_database[1] = {
    name : "Egg",
    desc : "Just an egg.",
    sprite : spr_item_2
}
