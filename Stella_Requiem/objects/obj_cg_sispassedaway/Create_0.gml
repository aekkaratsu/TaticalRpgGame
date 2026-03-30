current_scene = 0;
target_zoom = 1;
current_zoom = 1;
zoom_speed = 0.01;
depth = -9999; 
cg_alpha = 1;
is_transitioning = false;
next_room = -1;

cg_sequence = [
    { img: cg_sispas_1, text: global.town_dia_sispass1 },
    { img: cg_sispas_2, text: global.town_dia_sispass2 },
    { img: cg_sispas_3, text: global.town_dia_sispass3 },
    
];

create_dialog(cg_sequence[current_scene].text);