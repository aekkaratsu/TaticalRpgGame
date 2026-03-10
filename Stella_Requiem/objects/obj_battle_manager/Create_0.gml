// === Battle Management Variables ===
enemy_turn = false;         // false = Player's turn, true = Enemy's turn
damage_to_enemy = 0;        // Damage to be dealt
pending_enemy_damage = 0;   // Cached damage for processing
waiting_for_qte = false;    // Quick Time Event flag

// === Math System Variables ===
processing_math = false;
global.math_result = -1;    // -1 indicates unfinished


// === Helper Functions ===
end_player_turn = function() {
    enemy_turn = true;
    alarm[0] = 60; // Delay before enemy attacks
}

// Apply damage directly to the enemy's main body
damage_main_body = function(_damage) {
    if (instance_exists(obj_battle_enemy)) {
        with (obj_battle_enemy) {
            hp -= _damage;
            flash = 5;
            shake = 8;
            
            // Update persistent health data
            if (variable_instance_exists(id, "data")) {
                data.hp = hp;
            }
        }
    }
}


// === Core Battle Functions ===

// Check if the battle is over (returns true if someone died or is missing)
check_for_end = function() {
    if (!instance_exists(obj_battle_enemy) || !instance_exists(obj_battle_player)) {
        return true; 
    }
    
    return (obj_battle_enemy.hp <= 0 || obj_battle_player.data.hp <= 0);
}

// Standard attack on the main body
player_attack = function(_damage) {
    audio_play_sound(snd_shock, 10, false);
    
    damage_main_body(_damage);
    end_player_turn();
}

// Attack a specific enemy part (e.g., "HEAD", "LEGS")
player_attack_part = function(_damage, _target_name) {
    audio_play_sound(snd_shock, 10, false);
    
    if (!instance_exists(obj_battle_enemy)) {
        show_debug_message("Error: Enemy instance not found.");
        return; 
    }

    var _enemy = obj_battle_enemy; 
    var _part_found = false;
    
    // 1. Search for the target part
    if (variable_instance_exists(_enemy, "parts_instances")) {
        var _parts_list = _enemy.parts_instances;
        
        for (var i = 0; i < array_length(_parts_list); i++) {
            var _part = _parts_list[i];
            
            // If part exists and matches the target name, apply damage
            if (instance_exists(_part) && _part.part_id == _target_name) {
                with (_part) { take_damage(_damage); }
                _part_found = true;
                show_debug_message("Hit Part: " + _target_name);
                break; 
            }
        }
    }

    // 2. Fallback to main body if part is missing or destroyed
    if (!_part_found) {
        show_debug_message("Part missing or destroyed. Attacking Body directly.");
        damage_main_body(_damage);
    }
    
    // 3. End the turn
    end_player_turn();
}