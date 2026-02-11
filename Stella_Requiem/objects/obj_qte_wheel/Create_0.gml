//HELP
// เริ่มต้น
angle = irandom(359);

// อ่าน difficulty
var diff = obj_qte_controller.difficulty;

// ตั้งค่า
var safe_size;
switch (diff)
{
    case 1: base_speed = 4; safe_size = 60; break;
    case 2: base_speed = 6; safe_size = 40; break;
    case 3: base_speed = 8; safe_size = 25; break;
}

speed = base_speed;

// สุ่มตำแหน่ง safe zone (อาจคร่อม 0° ได้)
safe_start = irandom(359);
safe_end   = (safe_start + safe_size) mod 360;
