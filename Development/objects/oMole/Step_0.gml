if(dead == false)
{
	look_ahead = 16 * sign(goDirection);
	canSee = !collision_line(x, y - 4, oPlayer.x, oPlayer.y, oWall, false, true);
	distance = distance_to_object(oPlayer)

	// Moveing Left to Right
	x += goDirection * gospeed;


	if(place_meeting(x, y, oWall) || !position_meeting(x + look_ahead, bbox_bottom + 1, oWall))
	{
		goDirection *= -1;
		image_xscale *= -1;
	}
	if(distance < AgroDistance && canSee)
	{
		image_index = 0;
		movetowardsplayer();
	}
	if(distance > AgroDistance or !canSee)
	{
		gospeed = 5;
		image_index = 1;
	}

	function movetowardsplayer()
	{

		gospeed = 1;
		if(oPlayer.x > x)
			{
				image_xscale = 1;
				goDirection = 1;
			}
			if(oPlayer.x < x)
			{
				image_xscale = -1;
				goDirection = -1;
			}
	}
}