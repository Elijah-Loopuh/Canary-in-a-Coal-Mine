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

vDEBUG = true

//increased grip, sprint speed, carry cap, low gravity, infinite jumps
if vDEBUG
{
	grip = 0.5
	sprintPower = 4
	minercapacity = 999
	grav /= 2
}