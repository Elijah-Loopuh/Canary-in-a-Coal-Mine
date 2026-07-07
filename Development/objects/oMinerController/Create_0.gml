
miner = room_width / 32 / 5; // NOTE KEEP UNDER ~200
width = room_width; 
height = room_height;
//i = 0 CYCLE COUNT DEBUG VARIABLE
SpawnMiners(miner);

function SpawnMiners(amount) 
{
	while (instance_number(oMiner) < amount)
	{
		//i++
		xx = irandom(floor(room_width/32) -1);
		yy = irandom(floor(room_height/32) -1);
	
		px = xx * 32;
		py = yy * 32;
	
		instance_create_layer(px, py, "Instances", oMiner);
		//show_debug_message(i)
	
	}
}


