if (instance_exists(obj_player)) {
    var _dist = distance_to_object(obj_player);
    if (_dist <= detect_radius) {
       instance_destroy();
}
}