if (instance_exists(obj_dialog)) exit;

if (is_talking) {
    is_talking = false;
    
    if (final_npc) {
        global.play_collapse_dia = true;
        transition_start(room_town_collapse, obj_player.x, obj_player.y, 0.05);
        exit;
    }
}

if (instance_exists(obj_player) && distance_to_object(obj_player) < 8) {
    can_talk = true;
    
    if (keyboard_check_pressed(input_key)) {
        create_dialog(global.dialog);
        is_talking = true;
        
        if (goback_npc) {
            obj_dialog.previous_room = true;
        }
    }
} 
else {
    can_talk = false;
}