// Player turn
obj_battle_enemy.data.hp = obj_battle_enemy.data.hp - damage_to_enemy;
if (check_for_end())
{
    alarm[2] = 60; //ForEnd
}
else 
{
    alarm[1] = 60; //battle_enemy using this for attacking
    
    obj_battle_enemy.alarm[0] = 30; // animation enemy get attacked
}

//increse charge
obj_battle_player.data.charge += 0.4;
if (obj_battle_player.data.charge > 1)
{
    obj_battle_player.data.charge = 1;
}
