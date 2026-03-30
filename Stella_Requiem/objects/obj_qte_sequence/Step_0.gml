if (obj_qte_controller.state == QTE_STATE.FAIL ||
    obj_qte_controller.state == QTE_STATE.SUCCESS) {
    instance_destroy();
    exit;
}

if (obj_qte_controller.state != QTE_STATE.PLAYING) exit;

var expected_key = key_pool[sequence[current_index]];

// เช็คทุกปุ่มใน pool
for (var i = 0; i < array_length(key_pool); i++) {
    if (keyboard_check_pressed(key_pool[i])) {
        if (i == sequence[current_index]) {
            // ถูก
            current_index++;
            if (current_index >= seq_length) {
                with (obj_qte_controller) {
                    state  = QTE_STATE.SUCCESS;
                    result = 0;
                }
                instance_destroy();
            }
        } else {
            // ผิด — fail ทันที
            with (obj_qte_controller) {
                state  = QTE_STATE.FAIL;
                result = 1;
            }
            instance_destroy();
        }
        break;
    }
}