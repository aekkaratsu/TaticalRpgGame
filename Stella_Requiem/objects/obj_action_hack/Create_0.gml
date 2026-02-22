action = function ()
{
    if (obj_battle_player.data.charge >= 1)
    {
        obj_battle_player.data.charge = 0; //reset the bar when finished
        
        obj_battle_manager.player_attack((20)); //call function in the battle_manager , call variable in the battle_player
    }
}