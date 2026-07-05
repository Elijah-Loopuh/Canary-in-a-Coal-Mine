
miner = room_width / 32 / 5; // NOTE KEEP UNDER ~200
width = room_width; 
height = room_height;


//runs til miner capacity is reached
while(instance_number(oMiner) != miner)
{
	SpawnMiners(x, y, width, height, miner);
}



function SpawnMiners(x, y, width, height, amount) 
	{
		//define collums and rows
		var cols = floor(width /32)
	    var rows = floor(height /32) 
	    {
			//run through all collums and rows
			 for (var yy = 0; yy < rows; yy++)
		    {
		        for (var xx = 0; xx < cols; xx++)
				{
					
					
					
					if (true)
					{
						if(random(1) < 0.1)
						{
								if(instance_number(oMiner) != amount)
								{
									instance_create_layer(
										x + xx * 32,
							            y + yy * 32,
										"Instances",
										oMiner);
								}
						}
					}
				}
			}
	    }
	}

