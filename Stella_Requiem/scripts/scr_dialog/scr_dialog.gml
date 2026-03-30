function create_dialog(_messages){
    if (instance_exists(obj_dialog)) return;
        
    var _inst = instance_create_depth(0, 0, -10000, obj_dialog);
    _inst.messages = _messages;
    _inst.current_message = 0;
    

}

// Hilight words
char_colors = {
    "JeyGrude": c_green,
    "Player": c_aqua,
    "Congrats": c_yellow,
    "Narrator": c_aqua,
    "JeyGrude" : c_aqua,
    "Philia" : c_white,
    "????" : c_black,
    
}


// Array for store dialogues

dia_1 = [
{
    name:"JeyGrude",
    msg:"Hello!",
    name:"Player",
    msg:"Hi?"
}
    
]

stu_trash_dia1 = [
{
    name:"JeyGrude",
    msg:"Behold this hollowed monument of human regret, a bottomless abyss where dreams of a healthy diet and functional electronics go to perish. It's not just a trash can" ,
} ,
{
    name:"JeyGrude",
    msg:"it's a physical manifestation of my  I'll do it tomorrow'  attitude, currently holding more secrets and discarded takeout containers than your average CIA shredder." ,
},
{
    name:"JeyGrude",
    msg:"People say I should find a role model, so I looked at this trash can. It's sturdy, it takes everyone's crap without complaining, and even though it's literally garbage on the inside, it still manages to keep its lid shut and act like it's got its life together. We are basically twins, except it gets picked up more often than I do.",
},
{
    name:"JeyGrude",
    msg:"What the is this?"
}
]


inter_item_test = [
{
    name:"JeyGrude",
    msg:"Don't Know what is it." 
},{
    
    name:"JeyGrude",
    msg:"Is maybe relic form advance era." 
} ,  
]  

// To using it you must set The Variable one the Rooms ( Double Click with your instance )
// Then click add variable the select " Expression Type " the call this array global.<arrayname>





























