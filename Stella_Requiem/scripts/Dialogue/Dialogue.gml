function create_dialog(_messages){
    if (instance_exists(obj_dialog)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialog);
    _inst.messages = _messages;
    _inst.current_message = 0;
    

}

// High word with colors
char_colors = {
    "JeyGrude": c_green,
    "Player": c_aqua
   
}


// Array for store dialogues

dia_1 = [
{
    name:"JeyGrude",
    msg:"Hello!"
},
{
    name:"Player",
    msg:"Hi?"
}
]

// To using it you must set The Variable one the Rooms ( Double Click with your instance )
// Then click add variable the select " Expression Type " the call this array global.<arrayname>






























