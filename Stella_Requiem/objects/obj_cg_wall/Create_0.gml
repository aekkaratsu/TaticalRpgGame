current_scene = 0;
target_zoom = 1;
current_zoom = 1;
zoom_speed = 0.01;
cg_alpha = 1;
is_transitioning = false;

cg_sequence = [
    { img: cg_wall_1, text: global.wall_dia1},
    { img: cg_wall_2, text: global.wall_dia2},
];
next_room = room_town;
next_x = 1700;
next_y = 500;

create_dialog(cg_sequence[current_scene].text);