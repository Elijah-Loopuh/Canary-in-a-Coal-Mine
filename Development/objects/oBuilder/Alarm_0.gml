//Move and make space
if dir = 0
	x += width
	
if dir = 1
	y -= width

if dir = 2
	x -= width
	
if dir = 3
	y += width

if !place_meeting(x,y,oDevMarker)
	instance_create_depth(x,y,0,oBucket)

dir = irandom(3)
alarm[0] = 1