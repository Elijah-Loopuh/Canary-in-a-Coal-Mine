look_ahead = 16 * sign(move_speed);
canSee = !collision_line(x, y - 1, oPlayer.x, oPlayer.y, oWall, false, true);
distance = distance_to_object(oPlayer)
xdistance = oPlayer.x - x;
firing_distance = AgroDistance / 2;
x += move_speed;
if (attack_timer > 0)
{
	attack_timer--;	
}
if(place_meeting(x, y, oWall) || !position_meeting(x + look_ahead, bbox_bottom + 1, oWall))
	{
		move_speed *= -1;
		image_xscale *= -1;
	}
else
{
	
	if(distance < AgroDistance && canSee && distance > firing_distance)
	{
		movetowardsplayer();
	}
	if(distance <= firing_distance && canSee)
	{
		if(attack_timer <= 0)
		{
			move_speed = 0;
			instance_create_layer(x,y - 32, "Instances", oBeer)
			attack_timer = attack_cooldown;
		}
		else 
		{
			movetowardsplayer();
		}
	}
}


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