// ตรวจสอบว่าผู้เล่นอยู่ใกล้หรือไม่
if (distance_to_object(obj_player) < dist) {
    
    // ถ้า Sprite ยังไม่ใช่รูปแบบประตูเปิด ให้ทำการเปลี่ยน
    if (sprite_index != spr_open && spr_open != -1) {
        sprite_index = spr_open;
        image_index = 0;
        image_speed = 1;
    }
    
    // หยุด Animation เมื่อเปิดสุดแล้ว
    if (image_index >= image_number - 1) {
        image_speed = 0;
        image_index = image_number - 1;
    }

    // โค้ดเปลี่ยนห้อง
    if (keyboard_check_pressed(ord("E")) && !changing) {
        if (target_room != noone) { // ป้องกันเกมแครชถ้าลืมตั้งค่าห้อง
            changing = true;
            show_debug_message("GO TO ROOM: " + room_get_name(target_room));
            transition_start(target_room,x,y,0.03);
            exit; 
        } else {
            show_debug_message("ERROR: ยังไม่ได้กำหนด target_room ให้ประตูนี้นะ!");
        }
    }
    
} else {
    // เมื่อผู้เล่นเดินออกห่าง ให้กลับไปเป็น Sprite ประตูปิด
    if (sprite_index != spr_closed && spr_closed != -1) {
        sprite_index = spr_closed;
        image_speed = 0;
        // image_index = 0; // เอาคอมเมนต์ออกถ้าต้องการให้กลับไปเฟรมแรกตอนประตูปิด
    }
}