current_zoom = lerp(current_zoom, target_zoom, zoom_speed);

if (is_transitioning) {
    cg_alpha = lerp(cg_alpha, 0, 0.05);
    
    if (cg_alpha <= 0.01) {
        current_scene++;
        is_transitioning = false;
        
        if (current_scene < array_length(cg_sequence)) {
            create_dialog(cg_sequence[current_scene].text);
        } 
        else {
            if (next_room != -1) {
                transition_start(next_room, next_x, next_y, 0.02); 
                
                
            }
            game_restart();
            instance_destroy();
        }
    }
    
    if (current_scene == 3) {
        audio_stop_sound(snd_fireclacking)
        
    }
} 
else {
    cg_alpha = lerp(cg_alpha, 1, 0.05);
    
    if (!instance_exists(obj_dialog)) {
        is_transitioning = true;
    }
}