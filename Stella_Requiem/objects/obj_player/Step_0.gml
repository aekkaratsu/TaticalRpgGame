if(instance_exists(obj_dialog)) exit;

//Check Input
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

move_and_collide(_hor * move_speed, _ver * move_speed, [titlemap], undefined, undefined, undefined, move_speed, move_speed);//title(Titles_Col) for prevent player go through the walls

//Use condition to change sprites
if (_hor != 0 or _ver != 0)
{
    if (_ver > 0) sprite_index = spr_player_walk_down;
    else if (_ver < 0) sprite_index = spr_player_walk_up;
    else if (_hor > 0) sprite_index = spr_player_walk_right;
    else if (_hor < 0) sprite_index = spr_player_walk_left; 
        
    facing = point_direction(0, 0, _hor, _ver);
} 
else //not moving
{
    //Logic is checking player is moving which direction and then set to idle
    // == for compare, = for set value
	if (sprite_index == spr_player_walk_right) sprite_index = spr_player_idle_right;
    else if (sprite_index == spr_player_walk_left) sprite_index = spr_player_idle_left; 
    else if (sprite_index == spr_player_walk_up) sprite_index = spr_player_idle_up;
    else if (sprite_index == spr_player_walk_down) sprite_index = spr_player_idle_down;
}


// Attack
if (keyboard_check_pressed(vk_space))
{
    if (alarm[2] < 0){ 
        
    var _inst = instance_create_depth(x, y, depth, obj_attack);
    _inst.image_angle = facing;
    _inst.damage *= damage;
        alarm[2] = 60;
    
    }
}

//check if player dead
if (hp <= 0)
{
    game_restart();
}
