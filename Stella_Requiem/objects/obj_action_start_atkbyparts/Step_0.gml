if (obj_battle_manager.enemy_turn == true || is_selected == true) {
    image_alpha = 0.2;
    
    if (obj_battle_manager.enemy_turn == true) is_selected = false;
} 
else {
    image_alpha = 1;
}