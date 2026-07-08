// Moveing Left to Right
x += move_speed;

// Checking ahead
var look_ahead = 0 * sign(move_speed);

// Turn after check
if (place_meeting(x + look_ahead, y, oWall) || !position_meeting(x + look_ahead, bbox_bottom + 1, oWall))
{
	move_speed = -move_speed;
}

// Flip Direction
if(move_speed != 0)
{
	image_xscale = sign(move_speed);
}