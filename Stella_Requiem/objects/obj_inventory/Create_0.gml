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
    sprite : spr_item_1,
    effect : function() {
        if (instance_exists(obj_battle_player)) {
            // Add Charge to player
            obj_battle_player.data.charge += 1;
            
            // Prevent overloaded Charge
            if (obj_battle_player.data.charge > 1) {
                obj_battle_player.data.charge = 1;
            }
            
            show_debug_message("Restore Charge!");
    }
}
}

item_database[1] = {
    name : "Egg",
    desc : "Just an egg. ( + 1 HP )",
    sprite : spr_item_2,
    effect : function() {
        if (instance_exists(obj_battle_player)) {
            // Add Hp to player
            obj_battle_player.data.hp += 1;
            
            // Prevent overloaded HP
            if (obj_battle_player.data.hp > obj_battle_player.data.hp_total) {
                obj_battle_player.data.hp = obj_battle_player.data.hp_total;
            }
            
            show_debug_message("Healed 1 HP!");
            
    }
}
}
