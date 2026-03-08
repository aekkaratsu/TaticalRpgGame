is_music_playing = true;
image_speed = 0;
image_index = 0;

audio_play_sound(snd_titlescreen,1,true);
action = function ()
{
    is_music_playing = !is_music_playing;
    
    if (is_music_playing == true)
    {
        audio_resume_sound(snd_titlescreen);
        image_alpha = 1;
    }
    else {
    {
        audio_pause_sound(snd_titlescreen);
        image_alpha = 0.1;
    }
    }
}