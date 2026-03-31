// Initialize
target_x = x;
target_y = y;

alarm[0] = 60;

titlemap = layer_tilemap_get_id("Titles_Col")

//Knockback
kb_x = 0;
kb_y = 0;

hp_total = hp;

// Default parts You can set the position HERE
enemy_parts = [
   
    {
        name: "HEAD",
        hp: 2,
        hp_max: 2,
        offset_x: -3,
        offset_y: -50, 
        is_weakness: true,
        break_effect: "ACCURACY_DOWN" 
    },
];