if (state == "idle") {
    state = "walking";
    move_dir = irandom(359);
    alarm[0] = game_get_speed(gamespeed_fps) * random_range(1, 2);
} 
else {
    state = "idle";
    alarm[0] = game_get_speed(gamespeed_fps) * random_range(1, 3);
}