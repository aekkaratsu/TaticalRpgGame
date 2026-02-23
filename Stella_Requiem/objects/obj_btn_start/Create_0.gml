action = function ()
{
    audio_play_sound(snd_game_start,11,false);
    audio_stop_sound(snd_titlescreen);
    room_goto(Room1);
}