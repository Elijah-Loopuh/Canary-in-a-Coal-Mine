

if(oPlayer.moveDir > 0)
{
	LeftVRight = "Going Right ";
}
if(oPlayer.moveDir == 0)
{
	LeftVRight = "";
}
if(oPlayer.moveDir < 0)
{
	LeftVRight = "Going Left ";
}


if(oPlayer.yspd > 0)
{
	Yaxis = "& Falling ";
}
if(oPlayer.yspd < 0)
{
	Yaxis = "& Jumping ";
}
if(oPlayer.yspd = 0)
{
	Yaxis = "";
}

if(oPlayer.moveDir > 1 || oPlayer.moveDir < -1)
{
	Speed = "& Sprinting ";
}
else
{
	Speed = "";	
}
