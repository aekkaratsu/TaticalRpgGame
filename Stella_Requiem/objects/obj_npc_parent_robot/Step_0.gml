// 1. ระบบเคลื่อนที่และชนกำแพง (โค้ดเดิมที่แก้แล้ว)
if (state == "walking") {
    // แปลงองศาและความเร็ว ให้เป็นระยะขยับ X และ Y
    var _hsp = lengthdir_x(walk_speed, move_dir);
    var _vsp = lengthdir_y(walk_speed, move_dir);
    
    // สั่งเดินและเช็คชนกำแพง
    move_and_collide(_hsp, _vsp, [titlemap]);

    // 2. ระบบหันตัวละคร (Logic ที่รวมใหม่)
    // เช็คว่าถ้าขยับไปทางขวา (_hsp มีค่าเป็นบวก)
    if (_hsp > 0) {
        image_xscale = 1; // หันไปทางขวา
    } 
    // เช็คว่าถ้าขยับไปทางซ้าย (_hsp มีค่าเป็นลบ)
    else if (_hsp < 0) {
        image_xscale = -1; // หันไปทางซ้าย (Flip Sprite)
    }
    // (หมายเหตุ: ถ้า _hsp เป็น 0 แสดงว่าเดินตรงขึ้นหรือลง เราจะไม่เปลี่ยน image_xscale ครับ)
}
