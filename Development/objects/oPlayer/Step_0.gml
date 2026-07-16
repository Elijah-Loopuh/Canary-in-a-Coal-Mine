//Get inputs

rightKey = keyboard_check( ord( "D" ));
leftKey = keyboard_check( ord( "A" ));
//rightKeyPressed = keyboard_check_pressed( ord( "D" ));
//leftKeyPressed = keyboard_check_pressed( ord( "A" ));
jumpKeyPressed = keyboard_check_pressed( vk_space ) or keyboard_check_pressed( ord( "W" )); //true 1st step keys are held
jumpKey = keyboard_check( vk_space ) or keyboard_check( ord( "W" )); //true every step keys are held
sprintKey = keyboard_check( vk_shift );
sprintKeyPressed = keyboard_check_pressed(vk_shift);

//print position
//show_debug_message(x)
//show_debug_message(y)

 //debug permissions
	if vDEBUG
	{
			hp = 999; //inf hp
			minerscore = 10000; //inf money
	}

//X Movement
	//Direction (right = positive, left = negative)
	moveDir = rightKey - leftKey
	
	if sprintKey
	{
		moveDir *= sprintPower
	}

	//Reducing grip when in the air
	if place_meeting( x, y + 1, oWall) // checks if standing on floor
	{
		grip = 0.12
	}
	else
	{
		grip = 0.05
	}
	
	//smooth xspd to moveDir, less jarring
	//Return xspd to 0 when moving in opposite direction or no keys pressed
	if sign(moveDir) != sign(xspd)
	{
		if xspd > 0
		{
			xspd -= grip
		}
		
		if xspd < 0
		{
			xspd += grip
		}
	}
	
	//Increase xspd when moving Right
	if moveDir > 0
	{		
		if xspd < moveDir
		{
			xspd += grip;
		}
		
		if xspd > moveDir
		{
			xspd -= grip;
		}
	}
	
	//Increase xspd when moving Right
	if moveDir < 0
	{		
		if xspd < moveDir
		{
			xspd += grip;
		}
		
		if xspd > moveDir
		{
			xspd -= grip;
		}
	}
	
	//Set xspd to 0 to prevent fluttering around 0 from float errors
	if abs(xspd) < grip
	{
		xspd = 0.0
	}
	
	//See above but for max speed
	if abs(xspd - moveDir) < grip
	{
		xspd = moveDir
	}
	
	//Manage dash activation
	if (dashCooldown <= dashCooldownMaster) //if over master, dont decrease cooldown. allows dashes to be turned off by setting cooldown higher than cooldown master
	{
		//move trackers 
		dashCooldown -= 1;
		dashSensitivity -= 1;
	}
	
	if (dashCooldown <= 0) //cooldown check
	{		
		//dash checks
		if (sprintKeyPressed)
		{
				//do dash
				xspd = sign(moveDir) * dashPower;
				dashCooldown = dashCooldownMaster;
				if (yspd > 0) {yspd = 0;} //float in air only if falling
		}
	}


	//X collision
	var _subPixel = 0.5;
	if place_meeting( x + (xspd * moveSpd), y, oWall )
	{
		//Scoot up to wall precisely
		var _pixelCheck = _subPixel * sign((xspd * moveSpd));
		while !place_meeting( x + _pixelCheck, y, oWall )
		{
			x += _pixelCheck;
		}
	
		//Set xspd to zero to "collide
		xspd = 0;
	}
	
	//Move
	x += xspd * moveSpd;	



//Y Movement
	//Gravity
	yspd += grav;
	
	//Cap falling speed
	if yspd > termVel { yspd = termVel };

	//Jump
	if (jumpKeyPressed)
	{
		if (place_meeting( x, y + 1, oWall)) //regular jump
		{
			yspd = jspd;
		}
		else if (doubleJMP == 1) //double jump
		{
			yspd = jspd * 0.75; //weaker jump
			doubleJMP = 0; //disable double jump
		}
	}
	
	//Y collision
	 _subPixel = 0.5;
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
	
	//Refresh double Jump
	if (place_meeting(x, y+1, oWall) && doubleJMP = 0)
	{
			doubleJMP = 1
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
			sprite_index = sPlayerRunningAnimation;
			if(moveDir > 1 || moveDir < -1){image_speed = 2;}	
			else
			{
				image_speed = 1;
			}
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