// Movement variables
walk_speed = 1;
titlemap = layer_tilemap_get_id("Titles_Col");
state = "idle"; // Can be "idle" or "walking"

// Set the first alarm to trigger between 1 and 3 seconds
// game_get_speed(gamespeed_fps) equals 1 second in game time
alarm[0] = game_get_speed(gamespeed_fps) * random_range(1, 3);