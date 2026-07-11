// Base Speed
move_speed = 1; 
flight = 1;
image_speed = -1;
var look_ahead = 32 * sign(move_speed);

downl = place_meeting(x-16, y+80, oWall);
downr = place_meeting(x+16, y+80, oWall);

if(!downl || !downr) // if not standing on a wall, delete
{
	instance_deactivate_object(id)
}

if(instance_place(x, y, all) != noone) // if inside any object, delete
{
	instance_deactivate_object(id)
}
