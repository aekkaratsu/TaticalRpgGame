<<<<<<< HEAD
if (state == "walking") {
    var _hsp = lengthdir_x(walk_speed, move_dir);
    var _vsp = lengthdir_y(walk_speed, move_dir);
    move_and_collide(_hsp, _vsp, [titlemap]);
=======
// เช็คเฉพาะตอนที่ NPC กำลังเดินอยู่
if (state == "walking") {
    
    // ถ้าความเร็วแนวนอนมากกว่า 0 (เดินไปทางขวา)
    if (hspeed > 0) {
        image_xscale = 1;  // หันขวา
    } 
    // ถ้าความเร็วแนวนอนน้อยกว่า 0 (เดินไปทางซ้าย)
    else if (hspeed < 0) {
        image_xscale = -1; // หันซ้าย
    }
    
>>>>>>> kan29
}