if (image_alpha <= 0.2) exit;

is_selected = true;

action();

if (instance_exists(obj_camera)) {
    with (obj_camera) {
        // Change to force_zoom in the obj_camera
        force_zoom = !force_zoom; 
    }
}