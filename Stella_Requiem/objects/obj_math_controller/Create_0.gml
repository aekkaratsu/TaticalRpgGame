//== state ==
state = MATH_STATE.IDLE;
result = -1; // -1 = unfinish, 0 = success, 1 = fail

//== timer ==
timer = 0;
max_time = 180; //Adjustable

//== config ==
difficulty = 1;

//input
player_input = "";

//Check Answer
function check_answer()
{
    if (!instance_exists(obj_math_generator)) return;
        
    if (player_input == "") return;
    
    var correct = obj_math_generator.correct_answer;
    var player_num = real(player_input);
    
    if (player_num == correct)
    {
        state = MATH_STATE.SUCCESS;
        result = 0; // success
    }
    else
    {
        state = MATH_STATE.FAIL;
        result = 1; // fail
    }
}