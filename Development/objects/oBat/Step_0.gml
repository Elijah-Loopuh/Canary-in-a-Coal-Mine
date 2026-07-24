if(dead == false)
{
	// Moveing Left to Right
	x += move_speed
	y += flight
	var look_ahead = 32 * sign(move_speed);
	//old look distance settings
	//lowl = place_meeting(x-16, y+24, oWall);
	//lowr = place_meeting(x+16, y+24, oWall);
	//highl = place_meeting(x-16, y-96, oWall);
	//highr = place_meeting(x+16, y-96, oWall);

	lowl = place_meeting(x-lookDist, y+lookDist, oWall);
	lowr = place_meeting(x+lookDist, y+lookDist, oWall);
	highl = place_meeting(x-lookDist, y-lookDist, oWall);
	highr = place_meeting(x+lookDist, y-lookDist, oWall);

	if descend //coded to dive sometimes
	{
		flight = 3;	
	}
	if (highr || highl) //check for obstruction above to move down
	{
		flight = 1;
	}
	if (lowr || lowl) //check for obstruction below to move up
	{
		flight = -1;
		descend = false; //ascend after diving
	}
	if (highr || highl) && (lowr || lowl) //check for obstruction above & below to not move up or down
	{
		flight = 0	
	}

	// Turn after check
	if(place_meeting(x + look_ahead, y, oWall))
	{
		move_speed = -move_speed;
	}

	// Flip Direction
	if(move_speed != 0)
	{
		image_xscale = sign(move_speed);
	}
}