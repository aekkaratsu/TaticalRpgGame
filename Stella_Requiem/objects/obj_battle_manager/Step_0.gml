if (waiting_for_qte) {
    if (obj_qte_controller.state == QTE_STATE.SUCCESS) {
        //QTE SUCCESS
        obj_battle_player.data.hp -= pending_enemy_damage * 0;
        audio_play_sound(snd_correct,2,false)
        
        waiting_for_qte = false;
        enemy_turn = 0;
        
        if(check_for_end()) {
            alarm[2] = 60; 
        }
    }
    else if (obj_qte_controller.state == QTE_STATE.FAIL) {
        //QTE FAIL
        obj_battle_player.data.hp -= pending_enemy_damage;
        audio_play_sound(snd_incorrect,2,false)
        
        waiting_for_qte = false;
        enemy_turn = 0;
        
        if(check_for_end()) {
            alarm[2] = 60;
        }
    }
}
