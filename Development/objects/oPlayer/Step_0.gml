//Get inputs

rightKey = keyboard_check( ord( "D" ));
leftKey = keyboard_check( ord( "A" ));
jumpKeyPressed = keyboard_check_pressed( vk_space ) or keyboard_check_pressed( ord( "W" ));
jumpKey = keyboard_check( vk_space );
sprintKey = keyboard_check( vk_shift );
//X Movement
	//Direction
	moveDir = rightKey - leftKey;
	
	//Sprint
	if (sprintKey == true)
	{
		moveSpd = 4;
	}
	else
	{
		moveSpd = 2;
	}

	
	//Get xspd
	xspd = moveDir * moveSpd;

	//X collision
	var _subPixel = 0.5;
	if place_meeting( x + xspd, y, oWall )
	{
		//Scoot up to wall precisely
		var _pixelCheck = _subPixel * sign(xspd);
		while !place_meeting( x + _pixelCheck, y, oWall )
		{
			x += _pixelCheck;
		}
	
		//Set xspd to zero to "collide
		xspd = 0;
	}

	//Move
	x += xspd;


//Y Movement
	//Gravity
	yspd += grav;
	
	//Cap falling speed
	if yspd > termVel { yspd = termVel };
	
	//Jump
	if jumpKeyPressed && place_meeting( x, y + 1, oWall)
	{
		yspd = jspd;
	}
	
	//Y collision
	var _subPixel = 0.5;
	if place_meeting( x, y + yspd, oWall )
	{
		//Scoot up to wall precisely
		var _pixelCheck = _subPixel * sign(yspd);
		while !place_meeting( x, y + _pixelCheck, oWall)
		{
			y +=_pixelCheck;
		}
		
		//Set yspd to 0 to collide
		yspd = 0;
	}
	
	//Move
	y += yspd;