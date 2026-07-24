if(dead == false)
{
	look_ahead = 16 * sign(move_speed);
	canSee = !collision_line(x, y - 1, oPlayer.x, oPlayer.y, oWall, false, true);
	distance = distance_to_object(oPlayer)
	xdistance = oPlayer.x - x;
	firing_distance = AgroDistance / 2;
	x += move_speed;
	if (attack_timer > 0 && attack_timer > -100)
	{
		attack_timer--;	
	}


	if(place_meeting(x, y, oWall) || !position_meeting(x + look_ahead, bbox_bottom + 1, oWall)) //if running into wall, turn around
	{
		move_speed *= -1;
		image_xscale *= -1;
	}
	else //attack startup code
	{
	
		if(distance < AgroDistance && canSee && distance > firing_distance) //if can see but cant shoot
		{
			movetowardsplayer();
		}
	
		if(distance <= firing_distance && canSee) //if player is a valid target
		{
			if(attack_timer <= 0 && attack_startup > attack_startup_master) //if can attack & not in startup
			{
				attack_startup = attack_startup_master; //start attack startup
			}
			else 
			{
				movetowardsplayer();
			}
		}
	}

	if (attack_startup <= attack_startup_master && attack_startup >= 0) //if attack startup is running
	{
		move_speed = 0;
		attack_startup --;
	}

	if (attack_startup <= 0) //if attack startup is done
	{
		attack_timer = attack_cooldown; //reset timers
		attack_startup = attack_startup_master + 10;
		movetowardsplayer(); //reset move speed after attack startup ends
	
		if (distance <= firing_distance && canSee) //if player is a valid target
		{
			instance_create_layer(x,y - 32, "Instances", oBeer) //shoot beeer
		}
	}
}