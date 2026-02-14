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
        name: "LEGS",
        hp: 2,
        hp_max: 2,
        offset_x: 20,
        offset_y: -30, 
        is_weakness: true,
        break_effect: "SLOW" 
    },
    {
        name: "LEGS",
        hp: 2,
        hp_max: 2,
        offset_x: -20,
        offset_y: -30,
        is_weakness: false,
        break_effect: "SLOW"
    },
    {
        name: "LEGS",
        hp: 2,
        hp_max: 2,
        offset_x: -20,
        offset_y: -60,
        is_weakness: false,
        break_effect: "SLOW"
    },
    {
        name: "LEGS",
        hp: 2,
        hp_max: 2,
        offset_x: 30,
        offset_y: -60,
        is_weakness: false,
        break_effect: "SLOW"
    }, 
    {
        name: "HEAD",
        hp: 2,
        hp_max: 2,
        offset_x: 0,
        offset_y: -35, 
        is_weakness: true,
        break_effect: "ACCURACY_DOWN" 
    },
];