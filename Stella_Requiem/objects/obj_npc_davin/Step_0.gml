if (instance_exists(obj_dialog) || instance_exists(obj_cg_parent)) exit;

if (is_talking) {
    is_talking = false;
    
    if (final_npc) {
        global.play_collapse_dia = true;
        transition_start(room_town_collapse, obj_player.x, obj_player.y, 0.01);
        exit;
    }
}

if (instance_exists(obj_player) && distance_to_object(obj_player) < 8) {
    can_talk = true;
    
    if (keyboard_check_pressed(input_key)) {
        InventoryAdd(obj_inventory, 0);
        instance_create_depth(0, 0, -1111, obj_cg_davin1);
        is_talking = true;
        
        if (goback_npc) {
            obj_dialog.previous_room = true;
        }
    }
} 
else {
    can_talk = false;
}