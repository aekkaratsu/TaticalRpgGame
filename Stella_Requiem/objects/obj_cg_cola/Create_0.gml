current_scene = 0;
target_zoom = 1;
current_zoom = 1;
zoom_speed = 0.01;
cg_alpha = 1;
is_transitioning = false;

cg_sequence = [
    { img: spr_cg_cola, text: global.stu_can_dia1 },
    { img: spr_cg_gramar, text: global.stu_can_dia2}
];
next_room = -1;
next_x = 0;
next_y = 0;

create_dialog(cg_sequence[current_scene].text);