//Insert Setup

random_set_seed(oGlobalFunctions.savedSeed); //replaces persistent room

dir = irandom(3);

width = 32
size = 500
vectStartCoords = [x, y];
bucketDepth = irandom(size);
shopDepth = irandom(size);

//Wall all non-oNoWall spaces
function wallScan()
{
	x = 0
	y = 0
	
	for (i = 0; i < room_height * room_width; i += width)
	{
		//Check current space and place wall
		if place_empty(x, y, [oNoWall, oWall])
			instance_create_layer(x, y, "Instances", oWallPerfomance)
		
		
		//Move
		if x != room_width
			x += width
		
		else 
		{
			y += width
			x = 0
		}
		
	}
}



//Move and make space
for (i=0; i<10000; i++)
{
	dir = irandom(3)
	
	bucketDepth -= 1;
	shopDepth -= 1;
	if (bucketDepth <= 0)
	{
		instance_create_layer(x, y, "Instances", oBucket);
		bucketDepth = 100000000000000000;
	}
	if (shopDepth <= 0)
	{
		instance_create_layer(x, y, "Instances", oExitToShop);
		shopDepth = 100000000000000000;
	}
	
	
	if instance_number(oNoWall) >= size
		{
			/*with oNoWall
			{
				if place_empty(x + oBuilder.width, y, oNoWall)
					instance_create_layer(x + oBuilder.width, y,"Instances",oWall)
	
				if place_empty(x - oBuilder.width, y, oNoWall)
					instance_create_layer(x - oBuilder.width, y,"Instances",oWall)
	
				if place_empty(x, y + oBuilder.width, oNoWall)
					instance_create_layer(x, y + oBuilder.width,"Instances",oWall)
	
				if place_empty(x, y - oBuilder.width, oNoWall)
					instance_create_layer(x, y - oBuilder.width,"Instances",oWall)
			}*/

			//wallScan();
			//instance_destroy()
			break;
		}
		
	
	if !place_meeting(x,y,oNoWall)
		instance_create_layer(x,y,"Instances",oNoWall)
	
	
	if dir = 0
		x += width
	
	if dir = 1
		y -= width

	if dir = 2
		x -= width
	
	if dir = 3
		y += width
		
	if (instance_place(x, y, oWall))
	{
		x = vectStartCoords[0];
		y = vectStartCoords[1];
	}
}

alarm[0] = 2;

instance_create_layer(x, y, "Instances", oExitEnd)