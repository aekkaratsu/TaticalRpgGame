if (waiting_for_qte) {
    if (obj_qte_controller.state == QTE_STATE.SUCCESS) {
        //QTE SUCCESS
        obj_battle_player.data.hp -= pending_enemy_damage * 0;
        
        waiting_for_qte = false;
        enemy_turn = 0;
        
        if(check_for_end()) {
            alarm[2] = 60; 
        }
    }
    else if (obj_qte_controller.state == QTE_STATE.FAIL) {
        //QTE FAIL
        obj_battle_player.data.hp -= pending_enemy_damage;
        
        waiting_for_qte = false;
        enemy_turn = 0;
        
        if(check_for_end()) {
            alarm[2] = 60;
        }
    }
}
    