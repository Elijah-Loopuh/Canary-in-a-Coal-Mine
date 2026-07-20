// Base Speed
move_speed = 1; 
attack_cooldown = 120;
attack_timer = 0;
image_speed = 1;

attack_startup_master = 30; //number of frames of startup 
attack_startup = attack_startup_master + 10; //greaster than master = idle, less than = currently in startup, 0 = attack & reset

downl = place_meeting(x-16, y+16, oWall);
downr = place_meeting(x+16, y+16, oWall);


//Agro to player when in distance
//AgroDistance = 32*5;
AgroDistance = 32*15;

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