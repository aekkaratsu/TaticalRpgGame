var diff = obj_qte_controller.difficulty;

switch (diff) {
    case 1: seq_length = 3;
	case 2: seq_length = 5;
    case 3: seq_length = 7;    
}

key_pool = [ 
    vk_left, vk_right, vk_up, vk_down 
]

key_labels = ["L",    "R",      "U",   "D"];

sequence = array_create(seq_length);
for (var i = 0; i < seq_length; i++) {
    sequence[i] = irandom(array_length(key_pool) - 1); // เก็บ index
}

current_index = 0; // กดถูกมาแล้วกี่ตัว
