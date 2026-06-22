//Moving
moveDir = 0;
moveDirSmooth = 0.0;
moveSpd = 2;
xspd = 0;
yspd = 0;
grip = 0.1;
sprintPower = 3

//Jumping
grav = 0.275;
termVel = 6;
jspd = -5.5;

//miner points
minersCollected = 0;
minercapacity = 1;
cancollect = true;
minerscore = 0;

vDEBUG = false;

// Health
max_hp = 1;
hp= max_hp;
is_dead = false;

// Stored Initial Position
start_x = x;
start_y = y;

//Reset Player
reset_player = function()
{
	x = start_x;
	y = start_y;
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
	hp -= _amount;
}