x = oPlayer.x+ 16 * facing
y = oPlayer.y
if(oPlayer.moveDir < 0)
{
	facing = -1;
}
if(oPlayer.moveDir > 0)
{
	facing = 1;
}

if (attack_timer > 0)
{
	attack_timer--;	
}
if (mouse_check_button_pressed(mb_left) && !swinging && attack_timer == 0)
{
	visible = true
	mask_index = sPixAxe
	swinging = true; 
	swing_progress = 0;

}
if(swinging)
{
	swing_progress++; 
	t = swing_progress / swing_time;
	if(facing == 1)
	{
	image_angle = lerp(45, -110, t);
	}
		if(facing == -1)
	{
	image_angle = lerp(-45, 110, t);
	}
	image_xscale = facing;
	

	
	if(t >= 1)
	{
		mask_index = NoHitBox; 
		image_angle = 0;
		swinging = false;
		visible = false;
		attack_timer = 15;
	}
}