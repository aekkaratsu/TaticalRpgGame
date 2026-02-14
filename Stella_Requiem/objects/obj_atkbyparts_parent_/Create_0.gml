image_alpha = 0

action =  function ()
{
    // Condition for Check if button trasparent = 0 then return (return in fucntion meaning exit function)
    if (image_alpha <=0)
    {
        return; // Exit from function
    }
    
    var _dmg = obj_battle_player.data.damage * 1;
    
    obj_battle_manager.player_attack_part(_dmg, part_target_name); // Sent damage to part
    
    // Set Force zoom = false in the obj camera
    if (instance_exists(obj_camera)) {
        obj_camera.force_zoom = false;
    }
    
}