if place_empty(x + 32, y, oNoWall)
	instance_create_layer(x + 32, y,"Instances",oWall)
	
if place_empty(x - 32, y, oNoWall)
	instance_create_layer(x - 32, y,"Instances",oWall)
	
if place_empty(x, y + 32, oNoWall)
	instance_create_layer(x, y + 32,"Instances",oWall)
	
if place_empty(x, y - 32, oNoWall)
	instance_create_layer(x, y - 32,"Instances",oWall)