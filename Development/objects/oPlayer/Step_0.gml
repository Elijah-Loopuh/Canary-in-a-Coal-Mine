//Get inputs

rightKey = keyboard_check( ord( "D" ));
leftKey = keyboard_check( ord( "A" ));
jumpKeyPressed = keyboard_check_pressed( vk_space ) or keyboard_check_pressed( ord( "W" )); //true 1st step keys are held
jumpKey = keyboard_check( vk_space ) or keyboard_check( ord( "W" )); //true every step keys are held
sprintKey = keyboard_check( vk_shift );
moveSmooth = 0.1; //horizontal acceleration

//X Movement
	//Direction (right = positive, left = negative)
	moveDir = rightKey - leftKey;
	
	//Return moveDirSmooth to 0 when no key pressed, or when moving in opposite direction
	if (sign(moveDir) != sign(moveDirSmooth)) || (moveDir == 0)
	{
		if moveDirSmooth > 0
		{
			moveDirSmooth -= moveSmooth
		}
		
		if moveDirSmooth < 0
		{
			moveDirSmooth += moveSmooth
		}
	}
	
	//Increase moveDirSmooth when moving Right
	if moveDir == 1
	{
		if moveDirSmooth <= moveDir
		{
			moveDirSmooth += moveSmooth;
		}
		else
		{
			moveDirSmooth = moveDir;
		}
	}
	
	//Decrease moveDirSmooth when moving left
	if moveDir == -1
	{
		if moveDirSmooth >= moveDir
		{
			moveDirSmooth -= moveSmooth;
		}
		else
		{
			moveDirSmooth = moveDir;
		}
	}
	
	//Set moveDirSmooth to 0 to prevent fluttering around 0 from float errors
	if abs(moveDirSmooth) < moveSmooth
	{
		moveDirSmooth = 0.0
	}
	
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
	xspd = moveDirSmooth * moveSpd;

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
	
	///checking if can collect more miners
	if(minersCollected < minercapacity)
	{
		cancollect = true;
	}
	else
	{
		cancollect = false;
	}