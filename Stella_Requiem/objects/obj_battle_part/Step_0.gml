// --- 1. Ownership Safety Check ---
// Destroy this part if its owner (obj_battle_enemy) no longer exists
if (!instance_exists(owner)) {
    instance_destroy();
    exit;
}

// --- 2. Position Synchronization ---
// Stick the part to the parent based on the defined offsets
// You can use 'owner.image_xscale' here if the enemy needs to flip
x = owner.x + offset_x;
y = owner.y + offset_y;

// Keep the part slightly in front of the parent
depth = owner.depth - 1; 

// --- 3. Visual FX Decay ---
// Gradually reduce flash effect
if (flash > 0) flash -= 0.1;

// Gradually reduce shake intensity
if (shake > 0) shake -= 0.5;

// --- 4. Status Rendering ---
// Darken the part if it's broken, otherwise keep it normal
if (is_broken) {
    image_blend = c_dkgray; 
} else {
    image_blend = c_white;
}