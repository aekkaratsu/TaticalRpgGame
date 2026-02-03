// Show the message icon over the npc
draw_self();

if (can_interact && !instance_exists(obj_dialog))
{
    draw_sprite(spr_talk, 0, x, y - 16); // y-16 is on top of npc
    
}