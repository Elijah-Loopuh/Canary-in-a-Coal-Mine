id.depth = 225

left = place_meeting(x-32, y, oWall);
right = place_meeting(x+32, y, oWall);
up = place_meeting(x, y-32, oWall);
down = place_meeting(x, y+32, oWall);

/*
if(!down) // if not standing on a wall, delete
{
	instance_deactivate_object(id)
}

if(instance_place(x, y, all) != noone) // if inside any object, delete
{
	instance_deactivate_object(id)
}
*/