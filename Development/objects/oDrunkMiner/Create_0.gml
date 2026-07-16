// Base Speed
move_speed = 1; 
attack_cooldown = 120;
attack_timer = 0;
image_speed = 1;

attack_startup_master = 30; //number of frames of startup 
attack_startup = attack_startup_master;

downl = place_meeting(x-16, y+16, oWall);
downr = place_meeting(x+16, y+16, oWall);

/*
if(!downl || !downr) // if not standing on a wall, delete
{
	instance_deactivate_object(id)
}

if(instance_place(x, y, all) != noone) // if inside any object, delete
{
	instance_deactivate_object(id)
}
*/


//Agro to player when in distance
//AgroDistance = 32*5;
AgroDistance = 32*15;
