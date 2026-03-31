var _cam = view_camera[0];

if (shake_time > 0) {
    var _ran_x = random_range(-shake_power, shake_power);
    var _ran_y = random_range(-shake_power, shake_power);
    
    
    camera_set_view_pos(_cam, base_x + _ran_x, base_y + _ran_y);
    
    shake_time--;
} 
else {
    
    camera_set_view_pos(_cam, base_x, base_y);
    instance_destroy();
}