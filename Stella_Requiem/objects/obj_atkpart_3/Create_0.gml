image_alpha = 0

// Condition for Check if button trasparent = 0 then cant press

action =  function ()
{
    if (image_alpha <= 0)
    {
        return;
    }
    
    obj_battle_manager.player_attack(obj_battle_player.data.damage * 0.75) // Modify in childrens
         // Set Force zoom = false in the obj camera
     if (instance_exists(obj_camera)) 
    {
        obj_camera.force_zoom = false;
    }
    
}