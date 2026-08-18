//Insert Setup
randomise()
dir = irandom(3)
width = 32
size = 500

//Move and make space
for (i=0; i<1000000; i++)
{
	dir = irandom(3)
	
	
	if dir = 0
		x += width
	
	if dir = 1
		y -= width

	if dir = 2
		x -= width
	
	if dir = 3
		y += width
	
	
	if !place_meeting(x,y,oNoWall)
		instance_create_layer(x,y,"Instances",oNoWall)

	if instance_number(oNoWall) >= size
		{
			with oNoWall
			{
				if place_empty(x + oBuilder.width, y, oNoWall)
					instance_create_layer(x + oBuilder.width, y,"Instances",oWall)
	
				if place_empty(x - oBuilder.width, y, oNoWall)
					instance_create_layer(x - oBuilder.width, y,"Instances",oWall)
	
				if place_empty(x, y + oBuilder.width, oNoWall)
					instance_create_layer(x, y + oBuilder.width,"Instances",oWall)
	
				if place_empty(x, y - oBuilder.width, oNoWall)
					instance_create_layer(x, y - oBuilder.width,"Instances",oWall)
			}

			break
		}
}
