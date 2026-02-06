image_alpha = 0

// Condition for Check if button trasparent = 0 then cant press

action =  function ()
{
     if (instance_exists(obj_camera)) 
    {
        obj_camera.force_zoom = false; // Get camera to center then buttons tranperent to 0
        with (obj_atkpart_1) {image_alpha = 0;} 
        with (obj_atkpart_2) {image_alpha = 0;}
        with (obj_atkpart_3) {image_alpha = 0;}
        with (obj_atkpart_cancel) {image_alpha = 0;}
    }
    
}