/*
x = 0
y = 0
	
for (i = 0; i < room_height * room_width; i += width)
{
	//Check current space and place wall
	if place_empty(x, y, [oNoWall, oWall])
	{
		draw_sprite(sTrue_Middle_floor, 0, x, y);
	}
		
		
	//Move
	if x != room_width
		x += width
		
	else 
	{
		y += width
		x = 0
	}
		
}