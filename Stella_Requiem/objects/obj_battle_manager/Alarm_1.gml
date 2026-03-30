// Enemy turn
pending_enemy_damage = obj_battle_enemy.data.damage * random_range(0.7, 1.2);

waiting_for_qte = true;

scr_qte_start_random(obj_battle_enemy.data.difficulty);
