// Alarm 0 ; Player Turn

x += 2; // When action player will move toward +2 pixel

if (x > xstart + 20)
{
    alarm[1] = 1; // Alarm 1 Trigger to make playe move -2 pixel (go back to the position)
}
else 
{
	alarm[0] = 1;
}