if (state == "walking") {
    var _hsp = lengthdir_x(walk_speed, move_dir);
    var _vsp = lengthdir_y(walk_speed, move_dir);
    move_and_collide(_hsp, _vsp, [titlemap]);
}