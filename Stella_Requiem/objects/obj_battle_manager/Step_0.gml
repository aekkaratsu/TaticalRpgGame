if (waiting_for_qte) {
    if (instance_exists(obj_qte_controller)) {
        
    if (obj_qte_controller.state == QTE_STATE.SUCCESS) {
        //QTE SUCCESS
        waiting_for_qte = false;
        
        scr_math_parry_start(obj_battle_enemy.data.difficulty);
        
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
}

if (global.math_result != -1)
{
    if (global.math_result == 0) {
        //math success
        var counter_damage = obj_battle_player.data.damage;
        obj_battle_enemy.data.hp -= counter_damage;
    }
    
    else if (global.math_result == 1) {
        //Math fail
        obj_battle_player.data.hp -= pending_enemy_damage;
    }
    
    global.math_result = -1; //back to unfinish
    enemy_turn = 0;
    
    if (check_for_end()) {
        alarm[2] = 60;
    } else {
        alarm[1] = 60;
    }
}
