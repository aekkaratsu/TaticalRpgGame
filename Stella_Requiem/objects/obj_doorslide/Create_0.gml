// เรียกใช้ระบบพื้นฐานจากตัวแม่ (ห้ามลบ!)
event_inherited(); 

// ตั้งค่าเฉพาะสำหรับประตูบานเลื่อนไปเมือง
target_room = room_town;                 // ใส่ชื่อห้องเมืองของคุณที่นี่
spr_closed = spr_door_closed;       // ใส่ชื่อ Sprite ประตูบานเลื่อนตอนปิด
spr_open = spr_door_open;          // ใส่ชื่อ Sprite ประตูบานเลื่อนตอนเลื่อนเปิด
image_index = 0;