enemy_turn = 0;
damage_to_enemy = 0;

pending_enemy_damage = 0;
waiting_for_qte = false;

player_attack = function(_damage)
{
    damage_to_enemy = _damage;
    enemy_turn = 1;
    alarm[0] = 40;
}

check_for_end = function() {
    return (obj_battle_enemy.data.hp <= 0 || obj_battle_player.data.hp <= 0);
    
}