function create_dialog(_messages){
    if (instance_exists(obj_dialog)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialog);
    _inst.messages = _messages;
    _inst.current_message = 0;
    

}

// High word with colors
char_colors = {
    "JeyGrude": c_green,
    "Player": c_aqua,
    "Congrats": c_yellow,
    "Narrator": c_aqua
   
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

stu_trash_dia1 = [
{
    name:"Narrator",
    msg:"Behold this hollowed monument of human regret, a bottomless abyss where dreams of a healthy diet and functional electronics go to perish. It's not just a trash can" 
} ,

{
    name:"Narrator",
    msg:"it's a physical manifestation of my  I'll do it tomorrow'  attitude, currently holding more secrets and discarded takeout containers than your average CIA shredder." 
} ,    

{
    name:"Narrator",
    msg:"People say I should find a role model, so I looked at this trash can. It's sturdy, it takes everyone's crap without complaining, and even though it's literally garbage on the inside, it still manages to keep its lid shut and act like it's got its life together. We are basically twins, except it gets picked up more often than I do."
} ,

{
    name:"Narrator",
    msg:"What the FUCK is this shit?"
}
]

stu_can_dia1 = [
{
    name:"Narrator",
    msg:"The relic from adavnce era." 
} ,

{
    name:"Narrator",
    msg:"Peoples in advance era love it." 
} ,  
]  





// To using it you must set The Variable one the Rooms ( Double Click with your instance )
// Then click add variable the select " Expression Type " the call this array global.<arrayname>






























