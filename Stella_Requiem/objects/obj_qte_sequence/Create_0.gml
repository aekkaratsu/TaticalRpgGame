var diff = obj_qte_controller.difficulty;

switch (diff) {
    case 1: seq_length = 3;
	case 2: seq_length = 5;
    case 3: seq_length = 7;    
}

key_pool = [ 
    ord("A"), ord("D"), ord("W"), ord("S") 
]

key_labels = ["A",    "D",      "W",   "S"];

sequence = array_create(seq_length);
for (var i = 0; i < seq_length; i++) {
    sequence[i] = irandom(array_length(key_pool) - 1); // เก็บ index
}

current_index = 0; // กดถูกมาแล้วกี่ตัว
