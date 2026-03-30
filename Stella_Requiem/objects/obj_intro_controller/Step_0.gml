if (keyboard_check_pressed(vk_space)) {
    room_goto(next_room); 
    exit;
}

if (!is_fading_out) {
    cg_alpha = lerp(cg_alpha, 1, fade_speed);
    
    if (cg_alpha >= 0.95) {
        timer++;
        if (timer >= time_to_wait) {
            is_fading_out = true;
            timer = 0;
        }
    }
    
    // For add the soundEffect to each cg
    if (!sound_played) {
        if (current_scene == 0) {
            audio_play_sound(Sound16, 1, false);
        } else if (current_scene == 1) {
            audio_play_sound(snd_intro_2, 2, false);
        } else if (current_scene == 2) {
            audio_play_sound(snd_shock, 3, false);
        }
        sound_played = true;
    }
}

else {
    cg_alpha = lerp(cg_alpha, 0, fade_speed);
    
    if (cg_alpha <= 0.05) {
        current_scene++;
        is_fading_out = false;
        sound_played = false;
        
        if (current_scene >= array_length(cg_sequence)) {
            audio_stop_all()
            room_goto(next_room); 
        }
    }
}