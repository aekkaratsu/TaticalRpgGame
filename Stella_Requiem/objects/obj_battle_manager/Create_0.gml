// --- Turn Management Variables ---
enemy_turn = 0;             // 0 = Player's turn, 1 = Enemy's turn
damage_to_enemy = 0;        // Damage value to be dealt
pending_enemy_damage = 0;   // Cached damage for processing
waiting_for_qte = false;    // Quick Time Event flag


// --- Standard Attack Function (Main Body) ---
player_attack = function(_damage)
{
    // Safety check: ensure enemy exists
    if (instance_exists(obj_battle_enemy)) {
        //  -hp
        obj_battle_enemy.hp -= _damage;
        
        // สั่งให้กระพริบ
        obj_battle_enemy.flash = 5;
        
        // shake
        obj_battle_enemy.shake = 8;
        
        // update the changed data
        if (variable_instance_exists(obj_battle_enemy, "data")) {
            obj_battle_enemy.data.hp = obj_battle_enemy.hp;
        }
    }
    
    // Switch to enemy turn after 1 second
    enemy_turn = 1;
    alarm[0] = 60;
}

// --- Check Battle End Conditions ---
check_for_end = function() {
    // Return true if either side is missing or dead
    if (!instance_exists(obj_battle_enemy)) return true; 
    if (!instance_exists(obj_battle_player)) return true; 
    
    return (obj_battle_enemy.hp <= 0 || obj_battle_player.data.hp <= 0);
}

// --- Targeted Part Attack Function ---
// Called by specific part-attack buttons (e.g., HEAD, BODY, LEGS)
player_attack_part = function(_damage, _target_name) 
{
    // 1. Safety check for enemy existence
    if (!instance_exists(obj_battle_enemy)) {
        show_debug_message("Error: Enemy instance not found.");
        return; 
    }

    var _enemy = obj_battle_enemy; 
    
    // 2. Fallback: If enemy has no parts array, attack main body
    if (!variable_instance_exists(_enemy, "parts_instances")) {
         show_debug_message("Warning: parts_instances missing. Attacking body.");
         _enemy.hp -= _damage;
         _enemy.flash = 5;
         
         enemy_turn = true; 
         alarm[0] = 60;
         return;
    }

    // 3. Search for the target part in the list
    var _parts_list = _enemy.parts_instances;
    var _target_part_instance = noone;
    
    for (var i = 0; i < array_length(_parts_list); i++) {
        var _part = _parts_list[i];
        
        // Ensure part instance still exists (is not destroyed)
        if (instance_exists(_part)) {
            if (_part.part_id == _target_name) {
                _target_part_instance = _part;
                break; // Target found
            }
        }
    }

    // 4. Apply Damage
    if (_target_part_instance != noone) {
        // Target part exists: apply part-specific damage
        with (_target_part_instance) {
            take_damage(_damage);
        }
        show_debug_message("Hit Part: " + _target_name);

    } else {
        // Part destroyed or not found: fallback to main body damage
        show_debug_message("Part missing. Attacking Body directly.");
        _enemy.hp -= _damage;
        _enemy.flash = 5;
    }
    
    // 5. End Player Turn
    enemy_turn = true; 
    alarm[0] = 60; // Delay before enemy counter-attack
}