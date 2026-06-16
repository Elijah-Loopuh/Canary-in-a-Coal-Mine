

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

	//sets the canary properly every frame
	if canaryX < oPlayer.x + maxDist
	{
		if canaryX > oPlayer.x - maxDist
		{
			x = canaryX
		}
		else
		{
			x = oPlayer.x - maxDist
		}
	}
	else
	{
		x = oPlayer.x + maxDist
	}

	if canaryY < oPlayer.y + maxDist
	{
		if canaryY > oPlayer.y - maxDist
		{
			y = canaryY
		}
		else
		{
			y = oPlayer.y - maxDist
		}
	}
	else
	{
		y = oPlayer.y + maxDist
	}