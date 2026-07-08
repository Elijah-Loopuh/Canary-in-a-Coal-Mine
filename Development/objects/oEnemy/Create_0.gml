// Base Speed
move_speed = 1; 

image_speed = 1;

down = place_meeting(x, y+32, oWall);


if(!down) // if not standing on a wall, delete
{
	instance_deactivate_object(id)
}
if(instance_place(x, y, all) != noone) // if inside any object, delete
{
	instance_deactivate_object(id)
}