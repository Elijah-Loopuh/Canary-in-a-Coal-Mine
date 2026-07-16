// Base Speed
goDirection = 1;
attack_cooldown = 120;
attack_timer = 0;
image_speed = 0;
gospeed = 5;

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
AgroDistance = 32*4;

function movetowardsplayer()
{
	if(oPlayer.x > x)
		{
			image_xscale = 1;
			move_speed = 1;
		}
		if(oPlayer.x < x)
		{
			image_xscale = -1;
			move_speed = -1;
		}
}