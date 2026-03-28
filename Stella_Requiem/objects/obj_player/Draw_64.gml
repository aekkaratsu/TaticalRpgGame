if (room == rm_battle) {
    exit;
}

// ==========================================
// --- 1. Settings & Setup ---
// ==========================================
var _dx = 16;
var _dy = 16;
var _barw = 250; // ความกว้างตัวแบต
var _barh = 32;  // ความสูงตัวแบต
var _pad = 4;    // ความหนาของกรอบแบตเตอรี่ (เว้นขอบให้ดูเป็นหลอดแก้ว)

draw_set_font(DialogueFonts);

// --- 2. Draw HP Battery ---
var _hp_percent = clamp(hp / hp_total, 0, 1);
var _health_barw = (_barw - (_pad * 2)) * _hp_percent; // หักลบความหนากรอบออก

// 💡 ลูกเล่นพิเศษ: เปลี่ยนสีไฟแบตเตอรี่ตามปริมาณเลือด (เขียว -> เหลือง -> แดง)
var _hp_color = c_lime;
if (_hp_percent <= 0.25) _hp_color = c_red;
else if (_hp_percent <= 0.5) _hp_color = c_yellow;

// 1) วาดเงาแบตเตอรี่ (Drop Shadow เผื่อรวมความยาวของขั้วแบตไปด้วย)
draw_sprite_stretched_ext(spr_box, 0, _dx + 4, _dy + 4, _barw + 12, _barh, c_black, 0.5);

// 2) วาดตัวกรอบแบตเตอรี่ (สีเทาเข้ม)
draw_sprite_stretched_ext(spr_box, 0, _dx, _dy, _barw, _barh, c_dkgray, 0.9);

// 3) วาด "ขั้วแบตเตอรี่" (ติ่งฝั่งขวา)
var _cap_w = 12;
var _cap_h = 16;
var _cap_y = _dy + (_barh / 2) - (_cap_h / 2);
draw_sprite_stretched_ext(spr_box, 0, _dx + _barw, _cap_y, _cap_w, _cap_h, c_gray, 0.9);

// 4) วาดพื้นหลังด้านในแบตเตอรี่ (ช่องที่ไฟหมดให้เป็นสีดำ)
draw_sprite_stretched_ext(spr_box, 0, _dx + _pad, _dy + _pad, _barw - (_pad * 2), _barh - (_pad * 2), c_black, 0.8);

// 5) วาดระดับพลังงาน (หลอดเลือด)
if (_health_barw > 0) {
    draw_sprite_stretched_ext(spr_box, 1, _dx + _pad, _dy + _pad, _health_barw, _barh - (_pad * 2), _hp_color, 0.9);
}

// --- จัดวางตัวอักษร HP ---
draw_set_valign(fa_middle);
var _text_y = _dy + (_barh / 2);

// เงาตัวอักษร
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_text(_dx + 12, _text_y + 2, "HP"); 
draw_set_halign(fa_right);
draw_text(_dx + _barw - 12, _text_y + 2, string(hp) + " / " + string(hp_total)); 

// ตัวอักษรจริง
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_text(_dx + 10, _text_y, "HP"); 
draw_set_halign(fa_right);
draw_text(_dx + _barw - 10, _text_y, string(hp) + " / " + string(hp_total));



// --- 3. Draw Level & XP Battery ---

_dy += _barh + 12; // ขยับลงมาวาดแบตเตอรี่ก้อนที่ 2 (XP)

var _xp_percent = clamp(xp / xp_require, 0, 1);
var _xp_barw = (_barw - (_pad * 2)) * _xp_percent;

// 1) วาดเงา
draw_sprite_stretched_ext(spr_box, 0, _dx + 4, _dy + 4, _barw + 12, _barh, c_black, 0.5);

// 2) วาดตัวกรอบ
draw_sprite_stretched_ext(spr_box, 0, _dx, _dy, _barw, _barh, c_dkgray, 0.9);

// 3) วาดขั้วแบตเตอรี่
var _cap_y_xp = _dy + (_barh / 2) - (_cap_h / 2);
draw_sprite_stretched_ext(spr_box, 0, _dx + _barw, _cap_y_xp, _cap_w, _cap_h, c_gray, 0.9);

// 4) วาดพื้นหลังด้านใน
draw_sprite_stretched_ext(spr_box, 0, _dx + _pad, _dy + _pad, _barw - (_pad * 2), _barh - (_pad * 2), c_black, 0.8);

// 5) วาดระดับ XP (สีฟ้า Aqua)
if (_xp_barw > 0) {
    draw_sprite_stretched_ext(spr_box, 1, _dx + _pad, _dy + _pad, _xp_barw, _barh - (_pad * 2), c_aqua, 0.9);
}

// --- จัดวางตัวอักษร LEVEL ---
var _text_y_xp = _dy + (_barh / 2);

draw_set_color(c_black);
draw_set_halign(fa_left);
draw_text(_dx + 12, _text_y_xp + 2, $"LEVEL {level}");

draw_set_color(c_white);
draw_text(_dx + 10, _text_y_xp, $"LEVEL {level}");


// --- 4. Reset Properties ---
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);