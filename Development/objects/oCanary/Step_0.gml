//Calculate stopping distances
xStop = (xSpd * xSpd) / (2 * grip)
yStop = (ySpd * ySpd) / (2 * grip)

//Variable to hold the nearest miner for mathing
minerNearest = instance_nearest(oPlayer.x, oPlayer.y, oMiner)

//only do miner math when miners exist
if minerNearest == noone
{
	canaryX = oPlayer.x
	canaryY = oPlayer.y
}
else
{
	//doing miner math

	//Doing weighted averages to find the spot the canary wants to be
	canaryX = ((playerWeight) * oPlayer.x + (1 - playerWeight) * instance_nearest(oPlayer.x, oPlayer.y, oMiner).x)
	canaryY = ((playerWeight) * oPlayer.y + (1 - playerWeight) * instance_nearest(oPlayer.x, oPlayer.y, oMiner).y)
}


	//sets the target properly every frame
	if canaryX < oPlayer.x + maxDist
	{
		if canaryX > oPlayer.x - maxDist
		{
			xTgt = canaryX
		}
		else
		{
			xTgt = oPlayer.x - maxDist
		}
	}
	else
	{
		xTgt = oPlayer.x + maxDist
	}

	if canaryY < oPlayer.y + maxDist
	{
		if canaryY > oPlayer.y - maxDist
		{
			yTgt = canaryY
		}
		else
		{
			yTgt = oPlayer.y - maxDist
		}
	}
	else
	{
		yTgt = oPlayer.y + maxDist
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