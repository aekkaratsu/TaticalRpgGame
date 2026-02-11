//Damage from enemy
pending_enemy_damage = obj_battle_enemy.data.damage * random_range(0.7, 1.2);

//QTE start
waiting_for_qte = true;

//Use difficulty form enemy
scr_qte_start(obj_qte_wheel, obj_battle_enemy.data.difficulty);