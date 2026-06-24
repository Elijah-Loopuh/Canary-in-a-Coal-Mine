
centerX = oPlayer.x + sprite_get_width(sFatMiner)/2 - sprite_get_width(sCanary)/2
centerY = oPlayer.y + sprite_get_height(sFatMiner)/2 - sprite_get_height(sCanary)/2

//Calculate stopping distances
xStop = (xSpd * xSpd) / (2 * grip)
yStop = (ySpd * ySpd) / (2 * grip)

//Variable to hold the nearest miner for mathing
minerNearest = instance_nearest(centerX, centerY, oMiner)

//only do miner math when miners exist
if minerNearest == noone
{
	canaryX = centerX
	canaryY = centerY
}
else
{
	//doing miner math

	//Doing weighted averages to find the spot the canary wants to be
	canaryX = ((playerWeight) * centerX + (1 - playerWeight) * instance_nearest(centerX, centerY, oMiner).x)
	canaryY = ((playerWeight) * centerY + (1 - playerWeight) * instance_nearest(centerX, centerY, oMiner).y)
}


	//sets the target properly every frame
	if canaryX < centerX + maxDist
	{
		if canaryX > centerX - maxDist
		{
			xTgt = canaryX
		}
		else
		{
			xTgt = centerX - maxDist
		}
	}
	else
	{
		xTgt = centerX + maxDist
	}

	if canaryY < centerY + maxDist
	{
		if canaryY > centerY - maxDist
		{
			yTgt = canaryY
		}
		else
		{
			yTgt = centerY - maxDist
		}
	}
	else
	{
		yTgt = centerY + maxDist
	}
	
	
	//Control move speeds
		//X speeds
		if x > xTgt
		{
			if xSpd > 0 // handles if the target moves and canary is going the wrong way
			{
				xSpd -= grip	
			}
			else
			{
				if x > (xTgt + xStop)
				{
					xSpd -= grip
				}
				else
				{
					xSpd += grip
				}
			}
		}
		if x < xTgt
		{
			if xSpd < 0
			{
				xSpd += grip
			}
			else
			{
				if x < (xTgt - xStop)
				{
					xSpd += grip
				}
				else
				{
					xSpd -= grip
				}
			}
		}
		
		//Y speeds
		if y > yTgt
		{
			if ySpd > 0 // handles if the target moves and canary is going the wrong way
			{
				ySpd -= grip	
			}
			else
			{
				if y > (yTgt + yStop)
				{
					ySpd -= grip
				}
				else
				{
					ySpd += grip
				}
			}
		}
		if y < yTgt
		{
			if ySpd < 0
			{
				ySpd += grip
			}
			else
			{
				if y < (yTgt - yStop)
				{
					ySpd += grip
				}
				else
				{
					ySpd -= grip
				}
			}
		}
		
		if abs(xTgt - x) < snapDist
		{
			x = xTgt
			xSpd = 0
		}
		if abs(yTgt - y) < snapDist
		{
			y = yTgt	
			ySpd = 0
		}
		
		x += xSpd
		y += ySpd