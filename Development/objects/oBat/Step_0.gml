// Moveing Left to Right
x += move_speed
y += flight
var look_ahead = 32 * sign(move_speed);
lowl = place_meeting(x-16, y+24, oWall);
lowr = place_meeting(x+16, y+24, oWall);
highl = place_meeting(x-16, y-96, oWall);
highr = place_meeting(x+16, y-96, oWall);
if(lowr or lowl)
{
	flight = -1;
}
if(highr or highl)
{
	flight = 1;
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