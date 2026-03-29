global.seen_house_cg = false;

action = function ()
{
    audio_play_sound(snd_game_start,11,false);
    audio_stop_sound(snd_titlescreen);
    transition_start(rm_prologue, 0, 0, 0.02);
}