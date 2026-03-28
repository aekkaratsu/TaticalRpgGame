function transition_start(_room, _t_x, _t_y, _speed = 0.05) {
    if (!instance_exists(obj_transition)) {
        var _inst = instance_create_depth(0, 0, -9999, obj_transition);
        _inst.target_room = _room;
        _inst.target_x = _t_x;      
        _inst.target_y = _t_y;      
        _inst.fade_speed = _speed;
    }
}