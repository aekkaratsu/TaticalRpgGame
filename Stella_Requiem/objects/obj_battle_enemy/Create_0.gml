
// --- 1. Data Retrieval --- 
if (instance_exists(obj_battle_switcher)) {
    data = obj_battle_switcher.enemy_data; 
    
    // Prevent errors by ensuring 'charge' exists
    if (!variable_struct_exists(obj_battle_switcher.player_data, "charge")) {
        obj_battle_switcher.player_data.charge = 0;
    }
} else {
    // Fallback data for testing without switcher
    data = { sprite_index: sprite_index, hp: 100, hp_total: 100, damage: 10, enemy_parts: [] };
    
    if (!variable_instance_exists(id, "player_charge")) {
        player_charge = 0; 
    }
}

// --- 2. Base & Battle Stats ---
sprite_index = data.sprite_index;
hp           = data.hp;
damage       = data.damage;
hp_total     = data.hp_total;

flash = 0;
shake = 0;    

max_charge_dots = 10; // Total segments for the Charge gauge

// --- 3. Part Generation ---
parts_instances = []; 

if (variable_struct_exists(data, "enemy_parts")) {
    var _blueprint = data.enemy_parts; 
    
    for (var i = 0; i < array_length(_blueprint); i++) {
        var _p_info = _blueprint[i];
        
        // Skip spawning if the part is already dead
        if (_p_info.hp <= 0) continue; 
        
        // Create part instance (Safe method)
        var _part = instance_create_depth(x, y, depth - 1, obj_battle_part);
        
        // Setup variables directly to prevent scope errors
        _part.owner    = id;
        _part.part_id  = _p_info.name;
        _part.hp       = _p_info.hp;
        _part.hp_max   = _p_info.hp_max;
        _part.offset_x = _p_info.offset_x;
        _part.offset_y = _p_info.offset_y;
        
        // Set sprite based on part name
        switch (_p_info.name) {
            case "HEAD": _part.sprite_index = spr_parts_1;  break;
            case "BODY": _part.sprite_index = spr_parts_2;  break;
            case "LEGS": _part.sprite_index = spr_parts_3;  break;
            default:     _part.sprite_index = sprite_index; break;
        }
        
        // Set final relative position
        _part.x = x + _part.offset_x;
        _part.y = y + _part.offset_y;
        
        array_push(parts_instances, _part);
    }
}

// --- 4. Core Functions ---
receive_part_break = function(_part_name) {
    
    show_debug_message("--- PART BROKEN: " + string(_part_name) + " ---");
    
    var _vital_dmg = 0;
    var _charge_gain = 0; 

    // Apply penalties and rewards
    switch (_part_name) {
        case "HEAD":
            accuracy = 0.5;   
            _vital_dmg = 50;
            _charge_gain = 0.8; 
            break;
        case "BODY":
            defense = 0;      
            _vital_dmg = 5;
            _charge_gain = 0.1;
            break;
        case "LEGS":
            evasion = 0;      
            _vital_dmg = 3;
            _charge_gain = 0.1;
            break;
        default:
            _vital_dmg = 10;
            _charge_gain = 0.1;
            break;
    }
    
    // Take damage & play flash effect
    hp -= _vital_dmg; 
    flash = 5;

    // Sync data back to Switcher
    if (instance_exists(obj_battle_switcher)) {
        
        obj_battle_switcher.enemy_data.hp = hp;
        
        // Add charge and cap at 1.0
        obj_battle_switcher.player_data.charge += _charge_gain;
        if (obj_battle_switcher.player_data.charge > 1.0) {
            obj_battle_switcher.player_data.charge = 1.0;
        }
        
        // Mark part as broken in the data
        var _broken_parts = obj_battle_switcher.enemy_data.enemy_parts;
        for (var i = 0; i < array_length(_broken_parts); i++) {
            if (_broken_parts[i].name == _part_name) {
                _broken_parts[i].hp = 0; 
                break;
            }
        }
    } else {
        // Fallback charge update
        player_charge += _charge_gain;
        if (player_charge > 1.0) player_charge = 1.0;
    }

    // Check for enemy death
    if (hp <= 0) {
        audio_play_sound(snd_player_win, 1, false);
        hp = 0;
        
        if (instance_exists(obj_battle_switcher)) {
            obj_battle_switcher.enemy_data.hp = 0; 
            room_goto(obj_battle_switcher.original_room); 
        }
    }
}