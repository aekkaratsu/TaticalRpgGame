// 1. Check turn and visibility
// Exit if it's the enemy's turn or the button is hidden
if (obj_battle_manager.enemy_turn || image_alpha <= 0) {
    // Hide button immediately during enemy turn
    if (obj_battle_manager.enemy_turn) image_alpha = 0;
    exit; 
}

// 2. Handle special buttons (e.g., Cancel button)
// If no specific part is targeted, keep the button visible
if (!variable_instance_exists(id, "part_target_name") || part_target_name == "") {
    image_alpha = 1; 
    exit; 
}

// 3. Check if the target part still exists
var _part_alive = false;

if (instance_exists(obj_battle_enemy)) 
{
    // Ensure the enemy has a part list
    if (variable_instance_exists(obj_battle_enemy, "parts_instances")) {
        var _list = obj_battle_enemy.parts_instances;
        
        // Loop through parts to find a match for this button
        for (var i = 0; i < array_length(_list); i++) {
            var _part = _list[i];
            
            // Match found and part is active
            if (instance_exists(_part) && _part.part_id == part_target_name) {
                _part_alive = true;
                break;
            }
        }
    }
}

// 4. Update button visibility based on part status
if (_part_alive) {
    image_alpha = 1;   // Part exists: Show clearly (Clickable)
} else {
    image_alpha = 0.2; // Part destroyed: Dim the button (Non-clickable)
}