if (instance_exists(obj_dialog)) exit;
    
if (talking == true) 
{
    InventoryAdd(obj_inventory, 1); // ID 1 as egg
    instance_destroy();
    instance_destroy(obj_tutorial_collectEgg)
    exit; 
}

if (instance_exists(obj_player) && distance_to_object(obj_player) < 8) // if not near enough cant talk
{
    can_interact = true;
    if (keyboard_check_pressed(input_key))
    {
        create_dialog(dialog); // Dialog is variable can set when placing spirte in the room then double click on it and set Variable
        talking = true;
    }
}
else 
{
    can_interact = false;
}