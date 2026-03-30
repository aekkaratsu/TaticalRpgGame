if (state == MATH_STATE.PLAYING) {
    timer++;

    if (timer >= max_time) { 
        state = MATH_STATE.FAIL;
        result = 1;
    }
    
    if (keyboard_string != "") {
        for (var i = 1; i <= string_length(keyboard_string); i++) {
            var ch = string_char_at(keyboard_string, i);
            if (ch >= "0" && ch <= "9" ||  ch = "-") {
                player_input += ch;
            }
        }
        keyboard_string = "";
    }

    if (keyboard_check_pressed(vk_backspace)) {
        if (string_length(player_input) > 0) {
            player_input = string_delete(player_input, string_length(player_input), 1);
        }
    }

    if (keyboard_check_pressed(vk_enter)) {
        if (player_input != "") {
            check_answer();
        }
    }
}

if (state == MATH_STATE.SUCCESS || state == MATH_STATE.FAIL) {
    global.math_result = result;

    if (instance_exists(obj_math_generator)) {
        with (obj_math_generator) instance_destroy();
    }
    
    instance_destroy();
}