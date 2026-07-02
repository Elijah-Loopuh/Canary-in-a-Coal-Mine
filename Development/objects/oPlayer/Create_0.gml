//Moving
image_speed = 0;
image_index = 0;
moveDir = 0;
moveDirSmooth = 0.0;
moveSpd = 5;
xspd = 0;
yspd = 0;
grip = 0.3;
sprintPower = 2;
facing = 0;
//Jumping
grav = .35
termVel = 20;
jspd = -10;

//set depth
id.depth = 300;

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
	hp -= _amount;
}