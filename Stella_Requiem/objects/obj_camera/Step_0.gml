var _target_zoom = 1;

if (force_zoom || keyboard_check(vk_space) || (instance_exists(obj_battle_manager) && obj_battle_manager.enemy_turn)) 
{
    follow = follow_enemy; 
    _target_zoom = 0.75; // Zoom in when obj_camera follows the obj_battle_enemy
} 
else 
{
    
    follow = obj_camera_center; 
    _target_zoom = 1; // Zoom out when obj_camera follows the obj_camera_center
}


if (follow != noone)
{
    xTo = follow.x;
    yTo = follow.y;

    //if (follow == follow_enemy) yTo -= -25; Prevent werid camera
}

// Smooth Paning camera fast when far with taget, slower when near
x += (xTo - x) / 25;
y += (yTo - y) / 25;

// Calculate the target width/height based on variable _target_zoom
// eg if _taget_zoom = 0.5 --> camera width and height will *0.5 too ( smaller / zoomin )
var _target_w = camWidth * _target_zoom;
var _target_h = camHeight * _target_zoom;


// Get the current size of the active camera
var _cur_w = camera_get_view_width(view_camera[0]);
var _cur_h = camera_get_view_height(view_camera[0]);


// Smoothly transition the size towards the target
// Note: 0.1 is slow/smooth. Change to 1 for instant zoom.
var _new_w = lerp(_cur_w, _target_w, 0.5); // use lerp to smoother camera eg. "x = lerp(current_x, target_x, 0.1 ");
var _new_h = lerp(_cur_h, _target_h, 0.5);


// --- Update Camera Settings ---
// Apply the new size to the camera
camera_set_view_size(view_camera[0], _new_w, _new_h);


// Calculate the new top-left position to keep the target centered
// Formula: Center Position - (Half of the Camera Size)
var _cam_x = x - (_new_w * 0.5);
var _cam_y = y - (_new_h * 0.5);


// Keep the camera inside the room boundaries
_cam_x = clamp(_cam_x, 0, room_width - _new_w); //use clamp to limited the room width and height eg. "clamp(<variable to check>, min, max)";
_cam_y = clamp(_cam_y, 0, room_height - _new_h);



// Apply the new position to the camera
camera_set_view_pos(view_camera[0], _cam_x, _cam_y);