
miner = 12 // KEEP UNDER ~200 or buggy
width = room_width; 
height = room_height;
i = 0 


SpawnMiners(miner);

function SpawnMiners(amount) 
{
	while (instance_number(oMiner) < amount && i < 100000)
	{
		i++
		xx = irandom(floor(room_width/32) -1);
		yy = irandom(floor(room_height/32) -1);
	
		px = xx * 32 + 16;
		py = yy * 32;
	
		if (place_meeting(px+16, py+1, oWall) && place_meeting(px-16, py+1, oWall) && !place_meeting(px, py, oNoMinerSpawn) && !place_meeting(px, py-16, oWall))
		{
			instance_create_layer(px, py+32, "Instances", oMiner);
			//instance_create_layer(px, py+32, "Instances", oPointer);
		}
		//show_debug_message(i)
	
	}
}


