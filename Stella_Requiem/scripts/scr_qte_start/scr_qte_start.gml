function scr_qte_start(_obj, _diff)
{
    instance_activate_all();

    with (obj_qte_controller)
    {
        state      = QTE_STATE.PLAYING;
        result     = -1;
        timer      = 0;
        difficulty = _diff;

        // สร้าง QTE (ตำแหน่งไม่สำคัญแล้ว เพราะวาดใน GUI)
        qte_object = instance_create_depth(0, 0, -9999, _obj);

        show_debug_message("QTE OBJECT CREATED: " + string(qte_object));
    }

    show_debug_message("QTE STARTED");
}