if (obj_qte_controller.state == QTE_STATE.FAIL ||
    obj_qte_controller.state == QTE_STATE.SUCCESS) {
    instance_destroy();
    exit;
}

if (obj_qte_controller.state != QTE_STATE.PLAYING) exit;
    
if (keyboard_check_pressed(vk_space)) {
    current_presses++;
}

if (current_presses >= required_presses) {
    with(obj_qte_controller) {
        state = QTE_STATE.SUCCESS;
        result = 0;
    }
    instance_destroy();
}