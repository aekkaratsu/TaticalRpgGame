if (instance_exists(obj_dialog)) exit;

if (instance_exists(obj_player) && distance_to_object(obj_player) < 8) // if not near enough cant talk
{
    can_interact = true;
    if (keyboard_check_pressed(input_key))
    {
        instance_create_depth(0, 0, -9999, obj_cg_name);
    }
}
else 
{
    can_interact = false;
}