// Prevent index out of bound

if (current_message < 0 || current_message >= array_length(messages)) exit;
    
var _str = messages[current_message].msg; // Behind "." is for calling the other
var _len = string_length(_str);
var _key_board_input = keyboard_check_pressed(input_key) && can_input; // Use "Pressed" to detect only 1 times input

if (current_char < _len)
{
    if (_key_board_input) 
    {
        // Case A : immediately diplay all the message
        current_char = _len; // 0 1 2 3 4 ...
    }
    else 
    {
        // Case B ; Reveling char one by one base on char_speed
        current_char += char_speed; 
    }
    
    // Copy _str and draw
    draw_message = string_copy(_str, 0, floor(current_char));
}    

// When finished revealing Char
else if (_key_board_input)
{
    // Check is next message is validable?
    if (current_message < array_length(messages) - 1) 
    {
        // if true go to next message and set the current_char to 0
        current_message++;
        current_char = 0;
    }
    else 
    {
        // Check the coodition ( By set the variable on npc Instance you can make some of this become true )
        if (next_room) room_goto_next();
        else if (previous_room) room_goto_previous();
        
        instance_destroy(); 
    }
}
    