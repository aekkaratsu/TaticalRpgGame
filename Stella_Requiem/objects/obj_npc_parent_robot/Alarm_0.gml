if (state == "idle") {
    // Switch to walking
    state = "walking";
    
    // Pick a random direction (0 to 359 degrees)
    direction = irandom(359);
    
    // Set the speed
    speed = walk_speed;
    
    // Walk for 1 to 2 seconds
    alarm[0] = game_get_speed(gamespeed_fps) * random_range(1, 2);
} 
else {
    // Switch to idle
    state = "idle";
    
    // Stop moving
    speed = 0;
    
    // Stay idle for 1 to 3 seconds
    alarm[0] = game_get_speed(gamespeed_fps) * random_range(1, 3);
}