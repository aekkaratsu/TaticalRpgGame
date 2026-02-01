// When triggerd move "to" player ( -2 pixel )
x -= 2;
if (x < xstart - 20)
{
    alarm[1] = 1;
}
else {
	alarm[0] = 1;
}