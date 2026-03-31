// --- 1. เช็คพื้นฐานตามห้อง (เหมือนเดิม) ---
var _room_music = noone;
switch (room) {
    case rm_tutorial:        _room_music = snd_tutorial_theme; break;
    case road_path:          _room_music = snd_road_theme; break;
    case room_town:          _room_music = snd_town_theme; break;
    case room_town_collapse: _room_music = snd_town_collapse_theme; break;
    case rm_battle:          _room_music = snd_battle_theme; break;
    case rm_town_player_house: _room_music = snd_fireclacking; break;
}


if (global.town_dia_part1 == true) {
    target_music = snd_town_collapse_theme;
} else {
    target_music = _room_music;
}


if (current_music != target_music) {
    
    
    if (audio_is_playing(music_instance)) {
        var _old_inst = music_instance; 
        audio_sound_gain(_old_inst, 0, fade_time); 
       
    }
    
    // ข. เริ่มเล่นเพลงใหม่
    if (target_music != noone) {
        music_instance = audio_play_sound(target_music, 100, true);
        audio_sound_gain(music_instance, 0, 0);         // เริ่มที่เสียงเงียบ (0)
        audio_sound_gain(music_instance, 1, fade_time); // ค่อยๆ ดังขึ้นจนสุด (1) ในเวลา 1 วินาที
    }
    
    current_music = target_music;
}