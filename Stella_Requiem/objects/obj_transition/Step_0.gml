if (state == 1) {
    alpha += fade_speed;
    
    if (alpha >= 1) {
        alpha = 1;
        
        if (instance_exists(obj_player)) {
            obj_player.x = target_x;
            obj_player.y = target_y;
        }
        
        room_goto(target_room);
        state = 0;
    }
} else if (state == 0) {
    alpha -= fade_speed;
    if (alpha <= 0) {
        instance_destroy();
    }
}