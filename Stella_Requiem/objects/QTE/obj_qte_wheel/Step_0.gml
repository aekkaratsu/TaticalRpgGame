if (obj_qte_controller.state != QTE_STATE.PLAYING) exit;

// หมุนเข็ม
angle = (angle + speed) mod 360;

// กดปุ่ม
if (keyboard_check_pressed(vk_space))
{
    var success;

    // รองรับกรณีคร่อม 0°
    if (safe_end >= safe_start)
        success = (angle >= safe_start && angle <= safe_end);
    else
        success = (angle >= safe_start || angle <= safe_end);

    with (obj_qte_controller)
    {
        state  = success ? QTE_STATE.SUCCESS : QTE_STATE.FAIL;
        result = success ? 1 : 0;
    }
}
