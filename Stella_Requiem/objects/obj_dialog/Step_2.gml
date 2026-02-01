if (current_message < 0) exit;
var _str = messages[current_message].msg; //.msg behind is short name for calling from others

if (current_char < string_length(_str))
{
    current_char += char_speed * (1 = real(keyboard_check(input_key)));
    draw_message = string_copy(_str, 0, current_char);
}    
else if (keyboard_check_pressed(input_key))
{
    current_message++; // char++
    if (current_message >= array_length(messages)) //when char reach length inst_destory
    {
        instance_destroy();
        
        if (next_room) room_goto_next(); // if true go to next room 
            if (previous_room) room_goto_previous();
    }
    else 
    {
    	current_char = 0;
    }
}