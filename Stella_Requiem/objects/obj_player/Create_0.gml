//Initialze
move_speed = 3;

hp = 10;
hp_total = hp;
damage = 1;
charge = 0;
facing = 0;

//Leveling
level = 1;
xp = 0;
xp_require = 100; //xp - level require(increse)

function add_xp (_xp_to_add)
{
    xp += _xp_to_add
    if (xp >= xp_require)
    {
        level++;
        xp -= xp_require;
        xp_require = xp_require * 1.4
        
        // Status Increse
        damage++;
        hp_total += 5;
        hp = hp_total; //Reset HP
        damage += 0.8;
        
        //display dialog when level up
        create_dialog([
        {
            name: "Congrats",
            msg: $"You leveled up! Your stats are:\nLVL: {level}\nHp {hp_total}\nDamage {damage}" //Use $ to put to var in message
        }
        ])
    }    
}

audio_play_sound(snd_player_walk_eak,1,true);
audio_pause_sound(snd_player_walk_eak);