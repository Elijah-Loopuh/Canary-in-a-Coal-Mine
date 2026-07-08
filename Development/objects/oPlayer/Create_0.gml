//Moving
image_speed = 0;
image_index = 0;
moveDir = 0; // instant response, the direction the player wants to go. what key is pressed, as an integer value
moveSpd = 5; // max walking speed
xspd = 0;
yspd = 0;
gGrip = 0.12;// rate of change of moveDirSmooth on ground
aGrip = 0.05 // rate of change of moveDirSmooth in the air
sprintPower = 1.75; // sprint max speed multiplier
facing = 0;
//Jumping
grav = .35
termVel = 20;
jspd = -10;

//set depth
id.depth = 300;

DEBUG = 0

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