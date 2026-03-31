current_scene = 0;
target_zoom = 1;
current_zoom = 1;
zoom_speed = 0.01;
depth = -9999; 
cg_alpha = 1;
is_transitioning = false;
next_room = -1;
next_x = 0
next_y = 0
cg_sequence = [
    { img: cg_end_1, text: global.end_dia1 },
    { img: cg_end_2, text: global.end_dia2 },
    { img: cg_end_3, text: global.end_dia3},
    { img: cg_end_4, text: global.end_dia4}
];

create_dialog(cg_sequence[current_scene].text);
audio_play_sound(snd_prologue_ending,1,false)
audio_play_sound(snd_fireclacking,1,true)