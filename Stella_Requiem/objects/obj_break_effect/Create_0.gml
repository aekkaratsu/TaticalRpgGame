// Randomize rotation for visual variety
image_angle = random(360);

// Randomize scale between 0.8x and 1.2x
var _size = random_range(0.8, 1.2);
image_xscale = _size;
image_yscale = _size;

// Play explosion sound effect (Uncomment if needed)
// if (audio_exists(snd_explosion)) audio_play_sound(snd_explosion, 1, false);