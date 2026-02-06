
if (obj_battle_manager.enemy_turn) exit;

action(); 

if (instance_exists(obj_camera)) {
    with (obj_camera) {
        // Change to force_zoom in the obj_camera
        force_zoom = !force_zoom; 
    }
}