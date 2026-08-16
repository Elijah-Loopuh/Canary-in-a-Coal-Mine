image_speed = 0;
MinerQueue = 0;
flash = false;
frame = 1; //used to advance the frame the bucket is on

incrementFrame = function()
{
	if (frame < 3)
	{
		frame += 1;
	}
	else
	{
		frame = 1;
	}
}