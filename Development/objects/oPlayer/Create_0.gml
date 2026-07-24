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