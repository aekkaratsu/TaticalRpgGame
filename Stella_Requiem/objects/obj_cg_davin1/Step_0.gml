current_zoom = lerp(current_zoom, target_zoom, zoom_speed);

if (is_transitioning) {
    cg_alpha = lerp(cg_alpha, 0, 0.1);
    
    if (cg_alpha <= 0.2) {
        current_scene++;
        is_transitioning = false;
        
        if (current_scene < array_length(cg_sequence)) {
            create_dialog(cg_sequence[current_scene].text);
            
            
        } 
        else {
            if (next_room != -1) {
                
                transition_start(next_room, next_x, next_y, 1); 
            }
            instance_destroy();
        }
    }
    
    if (current_scene == 2) {
        instance_create_depth(0, 0, 0, obj_shake);
        audio_play_sound(snd_explosion,1,false);
    }
} 
else {
    cg_alpha = lerp(cg_alpha, 1, 0.1);
    
    if (!instance_exists(obj_dialog)) {
        is_transitioning = true;
    }
}


