current_scene = 0;
target_zoom = 1;
current_zoom = 1;
zoom_speed = 0.01;
depth = 10000;
cg_alpha = 1;
is_transitioning = false;

cg_sequence = [
    { img: spr_cg_prologue_1, text: global.cg_dialogue_1 },
    { img: spr_cg_prologue_2, text: global.cg_dialogue_2 }
];

create_dialog(cg_sequence[current_scene].text);