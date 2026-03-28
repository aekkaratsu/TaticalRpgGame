
var dist = 10; // ระยะห่าง

if (distance_to_object(obj_player) < dist) {
    // โค้ด Animation ที่เราทำไว้
    sprite_index = spr_door_open;
    if (image_index >= image_number - 1) {
        image_speed = 0;
        image_index = image_number - 1;
    }

    // โค้ดเปลี่ยนห้อง (เพิ่มการเช็ค is_changing)
    if ( keyboard_check_pressed(ord("E")) && !is_changing) {
        is_changing = true; // ล็อคไว้ว่ากำลังทำงาน
        show_debug_message("GO!");
        transition_start(room_town,1700,523, 0.03); 
        exit; 
    }
} else {
    sprite_index = spr_door_closed;
    image_speed = 1;
}
