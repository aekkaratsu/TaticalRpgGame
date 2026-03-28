if (instance_exists(obj_dialog)) exit;

if (instance_exists(obj_player) && distance_to_object(obj_player) < 16) // if not near enough cant talk
{
    can_interact = true;
    if (keyboard_check_pressed(input_key))
    {
        instance_create_depth(0, 0, -1111, obj_cg_cola);
    }
}
else 
{
    can_interact = false;
}