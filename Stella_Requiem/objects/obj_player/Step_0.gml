// Check if dialogue or somethings apper then exit this event ( Player cant move )
if(instance_exists(obj_dialog)) exit;
if (room == rm_battle) {
    audio_pause_sound(snd_player_walk_eak);
    visible = false; 
    exit;
} else {
    visible = true;
}
if (obj_inventory.show_inventory = true) exit; 
// Check Input chage the ord to the numbers 1 , 0 ,-1
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

move_and_collide(_hor * move_speed, _ver * move_speed, [titlemap], undefined, undefined, undefined, move_speed, move_speed);//title(Titles_Col) for prevent player go through the walls

 
// Use condition to change sprites
if (_hor != 0 or _ver != 0)
{   
    audio_resume_sound(snd_player_walk_eak);
    if (_ver > 0) sprite_index = spr_player_main_walk_F;
    else if (_ver < 0) sprite_index = spr_player_main_walk_B;
    else if (_hor > 0) sprite_index = spr_player_main_walk_R;
    else if (_hor < 0) sprite_index = spr_player_main_walk_L; 
        
    facing = point_direction(0, 0, _hor, _ver);
    
} 
else //not moving
{   audio_pause_sound(snd_player_walk_eak);
    //Logic is checking player is moving which direction and then set to idle
    // == for compare, = for set value
	if (sprite_index == spr_player_main_walk_R) sprite_index = spr_player_main_idle_R;
    else if (sprite_index == spr_player_main_walk_L) sprite_index = spr_player_main_idle_L; 
    else if (sprite_index == spr_player_main_walk_B) sprite_index = spr_player_main_idle_B;
    else if (sprite_index == spr_player_main_walk_F) sprite_index = spr_player_main_idle_F;
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


