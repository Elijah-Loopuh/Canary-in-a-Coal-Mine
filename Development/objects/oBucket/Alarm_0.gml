if (MinerQueue != 0)
{
	alarm[0] = 45;
	image_index = frame;
	incrementFrame();
	MinerQueue -= 1;
	alarm[1] = 30;
	oPlayer.minerscore += 2;
	oPlayer.totalscore += 2;
	oPlayer.totalminers += 1;
}

else
{
	image_index = 0;
}