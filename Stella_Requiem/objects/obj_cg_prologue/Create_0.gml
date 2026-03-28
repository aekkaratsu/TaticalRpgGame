current_scene = 0;
target_zoom = 1;
current_zoom = 1;
zoom_speed = 0.01;

cg_alpha = 1;
is_transitioning = false;

// Set CG Matched with Dialog
cg_sequence = [
    { img: spr_cg_prologue_1, text: global.cg_dialogue_1 },
    { img: spr_cg_prologue_2, text: global.cg_dialogue_2 },
    { img: photo_logo, text: global.cg_dialogue_3}
];

create_dialog(cg_sequence[current_scene].text);
audio_play_sound(snd_titlescreen_eak,1,true);

// For Hold to skip
skip_timer = 0;
skip_duration = 90;