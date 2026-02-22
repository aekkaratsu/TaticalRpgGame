function scr_math_parry_start(_diff)
{
    if (instance_exists(obj_math_controller)) return;

    var controller = instance_create_layer(0, 0, "Instances", obj_math_controller);

    with (controller)
    {
        state = MATH_STATE.PLAYING;
        difficulty = _diff;
        result = -1; //unfinish
        timer = 0;
        player_input = "";
    }
    
    
    instance_create_layer(0, 0, "Instances", obj_math_generator);
}