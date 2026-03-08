// Enter the Battle stance , Set player_data to variable data obj_battle_< player/ enemy >

if (instance_exists(obj_dialog)) exit;
if (instance_exists(obj_battle_switcher)) exit;

    
var _switcher = instance_create_depth(0, 0, 0, obj_battle_switcher);


_switcher.player_data = self;
_switcher.enemy_data = other; // Structs
_switcher.original_room = room;

audio_pause_sound(snd_player_walk_eak)
room_goto(rm_battle);