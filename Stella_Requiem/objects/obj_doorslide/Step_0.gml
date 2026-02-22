var dist = 10; // ระยะห่าง

// 1. ถ้าผู้เล่นอยู่ใกล้
if (distance_to_object(obj_player) < dist) {
    
    // เปลี่ยนเป็นรูปประตูเปิด
    sprite_index = spr_door_open;
    
    // เช็คว่าเล่นถึงเฟรมสุดท้ายหรือยัง? (image_number - 1 คือเฟรมสุดท้าย)
    if (image_index >= image_number - 1) {
        image_speed = 0;               // หยุดเล่น
        image_index = image_number - 1; // บังคับให้ค้างที่เฟรมสุดท้าย (กันมันเด้งกลับ)
    } else {
        image_speed = 1;               // ถ้ายังไม่จบ ให้เล่นต่อ
    }

} 
// 2. ถ้าผู้เล่นอยู่ไกล
else {
    // เปลี่ยนกลับเป็นประตูปิด
    sprite_index = spr_door_closed;
    
    // รีเซ็ตค่าต่างๆ เตรียมไว้สำหรับการเปิดครั้งหน้า
    image_speed = 1; 
    image_index = 0;
}
// ถ้าอยู่ใกล้ประตู และ ประตูเปิดอยู่ และ ผู้เล่นกด Spacebar
if (distance_to_object(obj_player) < dist && keyboard_check_pressed(vk_space)) {
    room_goto(room_town); // เปลี่ยนห้อง
}