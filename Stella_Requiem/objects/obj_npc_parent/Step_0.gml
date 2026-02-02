if (instance_exists(obj_dialog)) exit;

if (instance_exists(obj_player) && distance_to_object(obj_player) < 8) // if not near enough cant talk
{
    can_talk = true;
    if (keyboard_check_pressed(input_key))
    {
        create_dialog(dialog); // Dialog is variable can set when placing spirte in the room then double click on it and set Variable
        
        if (final_npc) obj_dialog.next_room = true;
            if (goback_npc) obj_dialog.previous_room =true;
    }
}
else 
{
    can_talk = false;
}
    
