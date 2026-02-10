// ==============================
// CONFIG
// ==============================
var cx = display_get_gui_width()  * 0.5;
var cy = display_get_gui_height() * 0.5;

var RADIUS = 120;
var THICK  = 18;

// ==============================
// FUNCTION: วาด arc หนา (รองรับคร่อม 0°)
// ==============================
function draw_thick_arc(_cx, _cy, _r, _thick, _a1, _a2, _col)
{
    draw_set_color(_col);

    // ถ้าคร่อม 0° ให้ขยายช่วง
    if (_a2 < _a1) _a2 += 360;

    for (var rr = _r - _thick * 0.5; rr <= _r + _thick * 0.5; rr++)
    {
        for (var a = _a1; a <= _a2; a += 1)
        {
            var ang = a mod 360;
            var px = _cx + lengthdir_x(rr, ang);
            var py = _cy + lengthdir_y(rr, ang);

            // ใช้วาดวงเล็ก ๆ แทน point จะชัดกว่า
            draw_circle(px, py, 1, false);
        }
    }
}

// ==============================
// SAFE (เขียว)
// ==============================
draw_thick_arc(cx, cy, RADIUS, THICK, safe_start, safe_end, c_lime);

// ==============================
// DANGER (แดง)
// ==============================
draw_thick_arc(cx, cy, RADIUS, THICK, safe_end, safe_start, c_red);

// ==============================
// วงหลัก
// ==============================
draw_set_color(c_white);
draw_circle(cx, cy, RADIUS, false);

// ==============================
// เข็ม
// ==============================
draw_set_color(c_yellow);
var hx = cx + lengthdir_x(RADIUS, angle);
var hy = cy + lengthdir_y(RADIUS, angle);
draw_line_width(cx, cy, hx, hy, 4);
draw_circle(hx, hy, 6, false);
