image_alpha = 0

// Condition for Check if button trasparent = 0 then cant press

action =  function ()
{
    if (image_alpha <=0)
    {
        return; // Exit from function
    }
    
    obj_battle_manager.player_attack(obj_battle_player.data.damage * 1.5) // Modify in childrens
        
    
}