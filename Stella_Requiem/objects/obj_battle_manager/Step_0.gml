
if (waiting_for_qte) {
    if (instance_exists(obj_qte_controller)) {
        
    if (obj_qte_controller.state == QTE_STATE.SUCCESS) {
        //QTE SUCCESS
        waiting_for_qte = false;
        audio_play_sound(snd_qte_succes,2,false)
        scr_math_parry_start(obj_battle_enemy.data.difficulty);
        
        alarm[3] = 1; n
    }
    else if (obj_qte_controller.state == QTE_STATE.FAIL) {
        //QTE FAIL
        obj_battle_player.data.hp -= pending_enemy_damage;
        audio_play_sound(snd_qte_fail,2,false)
        waiting_for_qte = false;
        enemy_turn = false;
        
        if(check_for_end()) {
            alarm[2] = 60;
        }
        
        alarm[3] = 1;
    }
}
}

if (global.math_result != -1)
{
    if (global.math_result == 0) {
        //math success
        audio_play_sound(snd_correct_eak,2,false)
        obj_battle_manager.damage_main_body(15);
        audio_play_sound(snd_shock,1,false);
    }
    
    else if (global.math_result == 1) {
        //Math fail
        audio_play_sound(snd_incorrect_eak,2,false)
        obj_battle_player.data.hp -= pending_enemy_damage ;
        global.math_result = -1;

        
    }
    
    global.math_result = -1; //back to unfinish
    enemy_turn = false;
    
    if (check_for_end()) {
        alarm[2] = 60;
    }
}
