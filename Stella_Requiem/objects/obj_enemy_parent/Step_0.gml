if (instance_exists(obj_dialog)) exit;
if (obj_inventory.show_inventory = true) exit;
    
if (alarm[1] >= 0)
{
    target_x = x + kb_x;
    target_y = y + kb_x;
}


var _hor = clamp(target_x - x, -1, 1);
var _ver = clamp(target_y - y, -1, 1);

//collide with diffent enemy
move_and_collide(_hor * move_speed, _ver * move_speed, [titlemap, obj_enemy_parent])

//check if enemy dead
if (hp <= 0)
{
    instance_destroy();
    
    // When defeated give playes xp
    obj_player.add_xp(xp_value);
    
}