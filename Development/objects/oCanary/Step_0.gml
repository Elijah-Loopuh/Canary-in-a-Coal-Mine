//Player & nearest miner positions for mathing
playerX = oPlayer.x
playerX = oPlayer.y

//Variable to hold the nearest miner for mathing
minerNearest = instance_nearest(oPlayer.x, oPlayer.y, oMiner)

//Updating miner coords
minerX = minerNearest.x
minerY = minerNearest.y


//Setting pos to between miner and player
/*
x = ((playerWeight * oPlayer.x) + ((1 - playerWeight) * minerX)) / 2
y = ((playerWeight * oPlayer.y) + ((1 - playerWeight) * minerY)) / 2
*/

x = (2 * oPlayer.x + instance_nearest(oPlayer.x, oPlayer.y, oMiner).x) / 3
y = (2 * oPlayer.y + instance_nearest(oPlayer.x, oPlayer.y, oMiner).y) / 3