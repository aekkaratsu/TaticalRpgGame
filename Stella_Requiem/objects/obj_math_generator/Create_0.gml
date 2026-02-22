a = 0;
b = 0;
operator = 0; // 0 = +, 1 = -, 2 = *
correct_answer = 0;

generate_problem();

function generate_problem() {
    var diff = obj_math_controller.difficulty;
    
    switch (diff) {
        case 1:
            a = irandom_range(1,10);
            b = irandom_range(1,10);
            operator = 0;
            correct_answer = a + b;
            break;
            
        case 2:
            a = irandom_range(5,20);
            b = irandom_range(1,10);
            operator = choose(0,1);
            
            if (operator == 0) {
                correct_answer = a + b;
            } else {
                correct_answer = a - b;
            }
            break;
        
        case 3:
            a = irandom_range(5,15);
            b = irandom_range(5,15);
            operator = choose(0,1,2);
            
            if (operator == 0) {
                correct_answer = a + b;
            } else if (operator == 1) {
                correct_answer = a - b;
            } else {
                correct_answer = a * b;
            }
            break;    
    }
}