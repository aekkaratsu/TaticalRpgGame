function create_dialog(_messages){
    if (instance_exists(obj_dialog)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialog);
    _inst.messages = _messages;
    _inst.current_message = 0;
    

}

// High word with colors
char_colors = {
    "Test": c_green
   
}


// Array for store dialogues

dia_1 = [
{
    name:"",
    msg:""
},
{
    name:"",
    msg:""
}
]































