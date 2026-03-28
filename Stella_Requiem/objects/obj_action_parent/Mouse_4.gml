if (obj_battle_manager.enemy_turn) exit; // Prevent Clicking on Enemy Turn 
if (instance_exists(obj_math_controller) || instance_exists(obj_qte_wheel)) exit;

// When clicked

action();