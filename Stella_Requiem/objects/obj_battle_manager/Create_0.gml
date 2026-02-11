// Battle Manager is for manage turns Using the Alram events

//initialize
enemy_turn = 0;
damage_to_enemy =0;

pending_enemy_damage = 0;
waiting_for_qte = false;

player_attack = function (_damage) 
{
    damage_to_enemy = _damage;
    enemy_turn = 1;
    alarm[0] = 40; //player turn daming enemy
    
    obj_battle_player.alarm[0] = 10; //player turn animation triggered
}

check_for_end = function ()
{
    return (obj_battle_enemy.data.hp <= 0 || obj_battle_player.data.hp <= 0)
    
}