// --- 1. เช็คพื้นฐานตามห้อง (เหมือนเดิม) ---
var _room_music = noone;
switch (room) {
    case rm_tutorial:        _room_music = snd_tutorial_theme; break;
    case road_path:          _room_music = snd_road_theme; break;
    case room_town:          _room_music = snd_town_theme; break;
    case room_town_collapse: _room_music = snd_town_collapse_theme; break;
    case rm_battle:          _room_music = snd_battle_theme; break;
}

// --- 2. เช็คเงื่อนไขพิเศษจากบทพูด หรือ Event (อัปเกรดตรงนี้!) ---
// ตัวอย่าง: ถ้าเล่นถึงช่วงเมืองถล่ม (global.play_collapse_dia) ให้เปลี่ยนเพลงทันทีแม้จะยังอยู่ในห้องเดิม
if (global.town_dia_part1 == true) {
    target_music = snd_town_collapse_theme;
} else {
    target_music = _room_music;
}

// --- 3. ลอจิกการเปลี่ยนเพลงแบบ Fade In / Fade Out ---
if (current_music != target_music) {
    
    // ก. ค่อยๆ เฟดเพลงเก่าออก
    if (audio_is_playing(music_instance)) {
        var _old_inst = music_instance; // เก็บ ID เพลงเก่าไว้
        audio_sound_gain(_old_inst, 0, fade_time); // สั่งให้ค่อยๆ เบาจนเงียบ
        // (Optional) ถ้าอยากให้ลบเพลงเก่าทิ้งจริงๆ ต้องใช้ Alarm ช่วย หรือปล่อยให้มันวนจนเงียบไปเองก็ได้ครับ
    }
    
    // ข. เริ่มเล่นเพลงใหม่
    if (target_music != noone) {
        music_instance = audio_play_sound(target_music, 100, true);
        audio_sound_gain(music_instance, 0, 0);         // เริ่มที่เสียงเงียบ (0)
        audio_sound_gain(music_instance, 1, fade_time); // ค่อยๆ ดังขึ้นจนสุด (1) ในเวลา 1 วินาที
    }
    
    current_music = target_music;
}