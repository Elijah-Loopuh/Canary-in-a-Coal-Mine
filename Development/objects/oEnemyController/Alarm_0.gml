worm = 5;
drunk = 5;


width = room_width; 
height = room_height;
i = 0 


SpawnEnemy(worm, oWorm);
SpawnEnemy(drunk, oDrunkMiner);


function SpawnEnemy(amount, type) 
{
	while (instance_number(type) < amount && i < 10000)
	{
		i++
		xx = irandom(floor(room_width/32) -1);
		yy = irandom(floor(room_height/32) -1);
	
		px = xx * 32 + 16;
		py = yy * 32;
		
		if (place_meeting(px+16, py+1, oWall) && place_meeting(px-16, py+1, oWall) && !place_meeting(px, py, oNoEnemySpawn) && !place_meeting(px, py-16, oWall))
		{
			instance_create_layer(px, py+32, "Instances", type);
			//instance_create_layer(px, py+1, "Instances", oPointer);
		}
		//show_debug_message(i)
	
	}
}


