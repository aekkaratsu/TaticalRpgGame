image_alpha = 0

action =  function ()
{
    // Condition for Check if button trasparent = 0 then return (return in fucntion meaning exit function)
    if (image_alpha <=0)
    {
        return; // Exit from function
    }
    
    obj_battle_manager.player_attack(obj_battle_player.data.damage * 1) // Modify in childrens
     // Set Force zoom = false in the obj camera
     if (instance_exists(obj_camera)) 
    {
        obj_camera.force_zoom = false;
    }
        
    
}