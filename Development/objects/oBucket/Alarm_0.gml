if (MinerQueue != 0)
{
	alarm[0] = 45;
	image_index = 1;
	MinerQueue -= 1;
	alarm[1] = 30;
	oPlayer.minerscore += 1;
}

else
{
	image_index = 0;
}

