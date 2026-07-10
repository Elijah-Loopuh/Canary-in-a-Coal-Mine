worm = 5;
drunk = 5;


width = room_width; 
height = room_height;
//i = 0 CYCLE COUNT DEBUG VARIABLE


SpawnEnemy(worm, oWorm);
SpawnEnemy(drunk, oDrunkMiner);


function SpawnEnemy(amount, type) 
{
	while (instance_number(type) < amount)
	{
		//i++
		xx = irandom(floor(room_width/32) -1);
		yy = irandom(floor(room_height/32) -1);
	
		px = xx * 32;
		py = yy * 32;
	
		instance_create_layer(px, py, "Instances", type);
		//show_debug_message(i)
	
	}
}


