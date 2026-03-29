// 1. Block input if it's the enemy's turn or button is hidden
if (obj_battle_manager.enemy_turn || image_alpha <= 0) exit;

with (obj_action_start_atkbyparts) {
    is_selected = false;
}
// 2. Block input if the button is dimmed (meaning the target part is destroyed)
// We use < 0.9 to safely handle floating point precision
if (image_alpha < 0.9) exit; 

// 3. Execution: If all checks pass, run the button's action
action();