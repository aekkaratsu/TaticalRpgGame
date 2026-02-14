// โค้ดใน Animation End Event ของ obj_door

// ถ้ากำลังเล่น Sprite ประตูเปิดอยู่
if (sprite_index == spr_door_open) {
    image_speed = 0; // หยุดเล่น Animation
    image_index = image_number - 1; // ค้างไว้ที่เฟรมสุดท้าย (เปิดสุด)
}