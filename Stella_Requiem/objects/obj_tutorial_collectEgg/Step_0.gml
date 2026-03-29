

if (instance_exists(obj_player)) {
    var _dist = distance_to_object(obj_player);
    if (_dist <= detect_radius) {
        current_alpha = lerp(current_alpha, 1, 0.1);
    } else {
        current_alpha = lerp(current_alpha, 0, 0.1);
    }
}
blink_timer += 0.05;