// Base Speed
move_speed = 1; 
flight = 1;
image_speed = -1;
var look_ahead = 32 * sign(move_speed);
lookDist = 8; //dist to look up & down
descend = false; //makes the bat descend when true
//i = 0; //debug variable

/*
downl = place_meeting(x-16, y+16, oWall);
downr = place_meeting(x+16, y+16, oWall);
if(!downl || !downr) // if not standing on a wall, delete
{
	instance_deactivate_object(id)
}

if(instance_place(x, y, all) != noone) // if inside any object, delete
{
	instance_deactivate_object(id)
}
*/

alarm[0] = oGlobalFunctions.boundIRandom(60*5, 60*15);