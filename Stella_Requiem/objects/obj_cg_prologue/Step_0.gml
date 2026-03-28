if (keyboard_check(vk_space)) {
    skip_timer++;
    if (skip_timer >= skip_duration) {
        transition_start(rm_tutorial, 1120, 408, 0.01);
        audio_stop_all();
        exit;
    }
} else {
    skip_timer = 0;
}

current_zoom = lerp(current_zoom, target_zoom, zoom_speed);

if (is_transitioning) {
    cg_alpha = lerp(cg_alpha, 0, 0.05);
    
    if (cg_alpha <= 0.05) {
        current_scene++;
        is_transitioning = false;
        
        if (current_scene < array_length(cg_sequence)) {
            create_dialog(cg_sequence[current_scene].text);
            
            // Zoom in / Zoom out
            if (current_scene == 1) {
                target_zoom = 1.1;
            } 
            else if (current_scene == 2) {
                target_zoom = 0.8;
            } else {
                target_zoom = 1;
            }
        } 
        else {
            transition_start(rm_tutorial, 1120, 408, 0.005); 
            audio_stop_all();
            instance_destroy();
        }
    }
} 
else {
    cg_alpha = lerp(cg_alpha, 1, 0.05);
    
    if (!instance_exists(obj_dialog)) {
        is_transitioning = true;
    }
}