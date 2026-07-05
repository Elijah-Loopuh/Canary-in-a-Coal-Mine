//Get inputs

rightKey = keyboard_check( ord( "D" ));
leftKey = keyboard_check( ord( "A" ));
jumpKeyPressed = keyboard_check_pressed( vk_space ) or keyboard_check_pressed( ord( "W" )); //true 1st step keys are held
jumpKey = keyboard_check( vk_space ) or keyboard_check( ord( "W" )); //true every step keys are held
sprintKey = keyboard_check( vk_shift );

//print position
//show_debug_message(x)
//show_debug_message(y)

//X Movement
	//Direction (right = positive, left = negative)
	if sprintKey
	{
		moveDir = sprintPower * (rightKey - leftKey)
	}
	else
	{
		moveDir = rightKey - leftKey
	}

	//Reducing grip when in the air
	if yspd == 0
	{
		grip = 0.12
	}
	else
	{
		grip = 0.05
	}
	
	//Return moveDirSmooth to 0 when moving in opposite direction or no keys pressed
	if sign(moveDir) != sign(moveDirSmooth)
	{
		if moveDirSmooth > 0
		{
			moveDirSmooth -= grip
		}
		
		if moveDirSmooth < 0
		{
			moveDirSmooth += grip
		}
	}
	
	//Increase moveDirSmooth when moving Right
	if moveDir > 0
	{		
		if moveDirSmooth < moveDir
		{
			moveDirSmooth += grip;
		}
		
		if moveDirSmooth > moveDir
		{
			moveDirSmooth -= grip;
		}
	}
	
	//Increase moveDirSmooth when moving Right
	if moveDir < 0
	{		
		if moveDirSmooth < moveDir
		{
			moveDirSmooth += grip;
		}
		
		if moveDirSmooth > moveDir
		{
			moveDirSmooth -= grip;
		}
	}
	
	//Set moveDirSmooth to 0 to prevent fluttering around 0 from float errors
	if abs(moveDirSmooth) < grip
	{
		moveDirSmooth = 0.0
	}
	
	//See above but for max speed
	if abs(moveDirSmooth - moveDir) < grip
	{
		moveDirSmooth = moveDir
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
		moveDirSmooth = 0;
	}

	//Move
	x += xspd;


//Y Movement
	//Gravity
	yspd += grav;
	
	//Cap falling speed
	if yspd > termVel { yspd = termVel };
	
	//Jump
	if jumpKeyPressed && (place_meeting( x, y + 1, oWall) || vDEBUG)
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
	if(minersCollected > minercapacity)
	{
		minersCollected -= 1;
	}
	if(minersCollected < minercapacity)
	{
		cancollect = true;
	}
	else
	{
		cancollect = false;
	}
	
	// Check Dead\Alive
	if (hp <= 0 || y > room_height)
	{
		reset_player();
	}
	
	// Player State


if(moveDir != 0)
{
	if(moveDir > 0){image_xscale = 1;}
	if(moveDir < 0){image_xscale = -1;}
	if(yspd > 0)
	{
		standin();
		if(moveDir > 1 || moveDir < -1){image_index = 12;}	
		else{image_index = 6;}
	}		
	if(yspd < 0)
	{
		standin();
		if(moveDir > 1 || moveDir < -1){image_index = 14;}	
		else{image_index = 5;}

	}
	if(yspd = 0)
	{
		standin();
		if(moveDir > 1 || moveDir < -1){image_index = 13;}	
		else{image_index = 4;}
	}
}

if(moveDir == 0)
{
	if(yspd > 0)
	{
		standin();
		image_index = 1;
	}		
	if(yspd < 0)
	{
		standin();
		image_index = 2;
	}
	if(yspd = 0)
	{
		 sprite_index = s_player_idle;
		 image_speed = 1;
	}
}

function standin()
{
	image_speed = 0;
	sprite_index = sFatMiner;
}





