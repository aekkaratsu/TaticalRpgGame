messages = [];
current_message = -1; //deault -1 beacuse not started
current_char = 0; //control char appeared one by one
draw_message = "";

char_speed = 1; // how fast apper
input_key = vk_space; //skip
con_input_key = vk_enter;

gui_w = display_get_gui_width()
gui_h = display_get_gui_height()

next_room = false; // Default is false , You can set to "True" to trigger the step event on obj_enemy_parent
previous_room = false;

