//Moving
	image_speed = 0;
	image_index = 0;
	moveDir = 0; //instant response, the direction the player wants to go. what key is pressed, as an integer value
	moveSpd = 5; //max walking speed
	xspd = 0;
	yspd = 0;
	//grip is the ammount that xSpd can change per frame. multiply by xSpd to get max normal player acceleration in px/frame
	gGrip = 0.12; //grip on the ground (oWall, or the normal ground)
	aGrip = 0.05; //grip in the air
	oGrip = 0.05; //grip when over normal max xspd no matter what material
	sprintPower = 1.75; //sprint max speed multiplier
	facing = 0;

	//dashing
	dashCooldownMaster = 60*1; //set the dash cooldown in frames
	dashCooldown = dashCooldownMaster + 10; //tracks the cooldown, set to greater than to disable dashes
	dashSensitivityMaster = 60*0.25; //set the time between keypresses to dash, in frames
	dashSensitivity = dashSensitivityMaster; //tracks double presses of right key
	dashPower = 3.25; //dash speed multiplier
	
	//Jumping
	grav = .35
	termVel = 20;
	jspd = -10;
	doubleJMP = -1; //-1 = not unlocked, 1 = available, 0 = cooldown
	coyoteTimeMaster = 0.15*60; //allows jumping for a brief time after falling off an edge
	coyoteTime = coyoteTimeMaster;

//set depth
	id.depth = 300;

//miner points
	minersCollected = 0;
	minercapacity = 1;
	cancollect = true;
	minerscore = 0;

	vDEBUG = false;

// Health
	max_hp = 5;
	hp = max_hp;
	is_dead = false;
	attack_timer = 60;

// Stored Initial Position
	start_x = x;
	start_y = y;
	start_room = room;

//Reset Player
	reset_player = function()
	{
		x = start_x;
		y = start_y;
		room_goto(start_room); //goes back to spawn room for when the player died
	
		hp = max_hp;
		visible = true;
	
		// Reset Speed
		hspeed = 0;
		vspeed = 0;

		// Cam reset
		camera_set_view_pos(view_camera[0], x - (camera_get_view_width(view_camera[0]) / 2), y - (camera_get_view_height(view_camera[0]) / 2));
	}

// Damage	
	take_damage = function(_amount)
	{
		if(attack_timer <= 0)
		{
			hp -= _amount;
			attack_timer = 60;
			image_blend = c_red;
			alarm[1] = 20;
		}
	}
	
//general functions

	function standin() //manages player standing still
	{
		image_speed = 0;
		sprite_index = sFatMiner;
	}
	
	doDebugPowers = function() //gives player debug powers when debug is active
	{
		if vDEBUG
		{
				hp = 999; //inf hp
				minerscore = 10000; //inf money
				doubleJMP = 1;
		}
	}
	
	doUpdateMinerCarry = function() //checks if the player can carry more mienrs, caps miners at carry capacity.
	{
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
	}
	
	doDeath = function() //checks if the player is dead and resets if so
	{
		// Check Dead\Alive
		if (hp <= 0 || y > room_height)
		{
			persistent = false;
			oCanary.persistent = false;
			oPicAxe.persistent = false;
			room_goto(rDeathScreen);
			layer_set_visible(layer_get_id("PlayerScoreUI"), false);
		}
	}
	
	doDoubleJumpRefresh = function() //if on the ground, reset double jumps
	{
		//Refresh double Jump
		if (place_meeting(x, y+1, oWall) && doubleJMP = 0)
		{
				doubleJMP = 1
		}
	}
	
	doPlayerStates = function() //handles animations based on move speed and other stuff i think
	{
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
	}
	
	doUpdateKeys = function() //updates keys to see if they're pressed
	{
		rightKey = keyboard_check( ord( "D" ));
		leftKey = keyboard_check( ord( "A" ));
		jumpKeyPressed = keyboard_check_pressed( vk_space )// or keyboard_check_pressed( ord( "W" )); //true 1st step keys are held
		jumpKey = keyboard_check( vk_space )// or keyboard_check( ord( "W" )); //true every step keys are held
		sprintKey = keyboard_check( vk_shift );
		sprintKeyPressed = keyboard_check_pressed(vk_shift);
	}
	
//x axis moves
	
	doSetMoveDir = function() //sets moveDir (the target that xSpd smooths towards), accounts for move  direction and base sprinting
	{
		moveDir = rightKey - leftKey
	
		if sprintKey
		{
			moveDir *= sprintPower
		}
	}
	
	doChangeGrip = function() //changes grip for the player, based speed and what theyre standing on
	{
		//Change grip based off what surface player is on
		if place_meeting( x, y + 1, oWall) // checks if standing on floor
		{
			grip = gGrip;
		}
		else
		{
			grip = aGrip;
		}
	
		if (abs(xspd) >= 1.75) //checks for overspeed
		{
			grip = oGrip;
		}
	}
	
	doSmoothXspd = function() //smooths xSpd to moveDir
	{
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
	
		//Decrease xspd when moving left
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
	}
	
	doDash = function() //hard sets xSpd when dashing, and manages air float
	{
		//Manage dash activation
		if (dashCooldown <= dashCooldownMaster) //if over master, dont decrease cooldown. allows dashes to be turned off by setting cooldown higher than cooldown master
		{
			//move counters
			if (dashCooldown >= -100) //checks to prevent underflow errors :)
			{
				dashCooldown -= 1;
			}
			if (dashSensitivity >= -100) //checks to prevent underflow errors :)
			{
				dashSensitivity -= 1;
			}
		}
		
		if (dashCooldown <= 0) //cooldown check
		{		
			//dash checks
			if (sprintKeyPressed)
			{
				//do dash every frame
				xspd = sign(moveDir) * dashPower;
				dashCooldown = dashCooldownMaster;
				if (yspd > 0) {yspd = 0;} //float in air only if falling
			}
		}
	}
	
	doMoveX = function() //checks for collision and then moves the player on the x axis
	{
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
	}
	
//y axis moves
	
	doGravity = function() //apply gravity to yspd and cap it with terminal velocity
	{
		//Gravity
		yspd += grav;
	
		//Cap falling speed
		if yspd > termVel { yspd = termVel };	
	}
	
	doJump = function() //manages coyote time, tracks coyote time and deactivates double jump when it's used
	{
		//coyote time management
		if (place_meeting( x, y + 1, oWall)) //max out coyoteTime when on ground
		{
			coyoteTime = coyoteTimeMaster;
		}
		else if (coyoteTime >= -10) // underflow protection
		{
			coyoteTime --;	
		}

		//Jump
		if (jumpKeyPressed)
		{
			if (place_meeting( x, y + 1, oWall) || coyoteTime >= 0) //regular jump
			{
				yspd = jspd;
				coyoteTime = -1;
			}
			else if (doubleJMP == 1) //double jump
			{
				yspd = jspd * 0.75; //weaker jump
				doubleJMP = 0; //disable double jump
			}
		}
	}
	
	doMoveY = function() //checks for collision and moves player on y axis
	{
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
	}