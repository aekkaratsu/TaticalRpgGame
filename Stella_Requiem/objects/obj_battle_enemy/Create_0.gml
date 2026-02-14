// --- 1. Data Retrieval (Cross-scene memory) ---
if (instance_exists(obj_battle_switcher)) {
    data = obj_battle_switcher.enemy_data; 
    
    // Ensure charge variable exists in player data to prevent errors
    if (!variable_struct_exists(obj_battle_switcher.player_data, "charge")) {
        obj_battle_switcher.player_data.charge = 0;
    }
} else {
    // Fallback data for isolated testing
    data = { sprite_index: sprite_index, hp: 100, hp_total: 100, damage: 10, enemy_parts: [] };
    if (!variable_instance_exists(id, "player_charge")) player_charge = 0; 
}

// --- 2. Base Stats ---
sprite_index = data.sprite_index;
hp = data.hp;
damage = data.damage;
hp_total = data.hp_total;

// --- 3. Battle Stats ---
accuracy = 1.0; 
defense = 0;    
evasion = 0;    
flash = 0;
shake = 0;    

// --- UI Settings ---
max_charge_dots = 10; // Total segments for the Charge gauge

// --- 4. Part Generation (Persistent Break System) ---
parts_instances = []; 

if (variable_struct_exists(data, "enemy_parts")) {
    var _blueprint = data.enemy_parts; 
    
    for (var i = 0; i < array_length(_blueprint); i++) {
        var _p_info = _blueprint[i];
        
        // Skip generation if the part was already destroyed
        if (_p_info.hp <= 0) continue; 
        
        var _part = instance_create_depth(x, y, depth - 1, obj_battle_part);
        _part.owner = id;
        _part.part_id = _p_info.name;
        _part.hp = _p_info.hp;
        _part.hp_max = _p_info.hp_max;
        _part.offset_x = _p_info.offset_x;
        _part.offset_y = _p_info.offset_y;
        
        // Assign sprites based on part name
        switch (_p_info.name) {
            case "HEAD": _part.sprite_index = spr_player_idle_down; break;
            case "BODY": _part.sprite_index = spr_player_main_idle_B; break;
            case "LEGS": _part.sprite_index = spr_trash; break;
            default:     _part.sprite_index = sprite_index; break;
        }
        
        // Set initial relative position
        _part.x = x + _part.offset_x;
        _part.y = y + _part.offset_y;
        
        array_push(parts_instances, _part);
    }
}

// =========================================================
// FUNCTION: Handle Part Destruction
// =========================================================
receive_part_break = function(_part_name) 
{
    show_debug_message("--- PART BROKEN: " + string(_part_name) + " ---");
    var _vital_dmg = 0;
    var _charge_gain = 0; 

    // 1. Assign Penalties and Charge Rewards
    switch (_part_name) 
    {
        case "HEAD":
            accuracy = 0.5;   
            _vital_dmg = 50;
            _charge_gain = 0.8; // High reward for vivid point
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
    
    // 2. Apply Vital Damage and Flash Effect
    hp -= _vital_dmg; 
    flash = 5;

    // 3. Sync Data back to Switcher
    if (instance_exists(obj_battle_switcher)) 
    {
        // Update Main HP
        obj_battle_switcher.enemy_data.hp = hp;
        
        // Update Player Charge (Cap at 1.0)
        obj_battle_switcher.player_data.charge += _charge_gain;
        if (obj_battle_switcher.player_data.charge > 1.0) obj_battle_switcher.player_data.charge = 1.0;
        
        // Save part status as destroyed (HP = 0)
        var _bp = obj_battle_switcher.enemy_data.enemy_parts;
        for (var i = 0; i < array_length(_bp); i++) {
            if (_bp[i].name == _part_name) {
                _bp[i].hp = 0; 
                break;
            }
        }
    } else {
        // Testing mode charge update
        player_charge += _charge_gain;
    }

    // 4. Death Check (Transition back to Overworld)
    if (hp <= 0) 
    {
        hp = 0;
        if (instance_exists(obj_battle_switcher)) {
            obj_battle_switcher.enemy_data.hp = 0;
            room_goto(obj_battle_switcher.original_room);
        }
    }
}