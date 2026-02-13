// --- Basic Initialization ---
owner = noone;          // Parent enemy ID (obj_battle_enemy)
part_id = "";           // Part identifier (e.g., "HEAD", "BODY")
hp = 10;                // Current HP (overwritten by parent)
hp_max = 10;            // Max HP

// --- Position & Visuals ---
offset_x = 0;           // X offset relative to parent
offset_y = 0;           // Y offset relative to parent
image_speed = 0;        // Freeze animation frames

// --- Visual Effects ---
flash = 0;              // White flash intensity when hit
shake = 0;              // Shake intensity when hit
is_broken = false;      // Break status flag

// ====================================================
// Damage Handler (Called by obj_battle_manager)
// ====================================================
take_damage = function(_amount) 
{
    // Safety check: do nothing if already broken
    if (is_broken) return;

    // 1. Reduce Part HP & set hit effects
    hp -= _amount;
    flash = 3;      
    shake = 5;      

    // 2. Transfer damage to parent (Main HP)
    if (instance_exists(owner)) 
    {
        owner.hp -= _amount; 
        owner.flash = 3;     
    }

    // 3. Handle Part Destruction
    if (hp <= 0) 
    {
        hp = 0;
        is_broken = true;
        
        // Create destruction effect (obj_break_effect)
        if (asset_get_index("obj_break_effect") != -1) 
        {
            instance_create_depth(x, y, depth - 10, obj_break_effect);
        }
        
        // Notify parent to trigger stat penalties or vital damage
        if (instance_exists(owner)) {
            with (owner) {
                receive_part_break(other.part_id); 
            }
        }
        
        // Remove part instance immediately
        instance_destroy();
    }
}