// Countdown Timer Notice
if(gas_timer > 0)
{
	gas_timer--;
	is_gas_rising = false;
}
if(gas_timer <= 0)
{
	is_gas_rising = true;
		
	for (var i = 0; i < 2; i ++)
	{
		instance_create_layer(random_range(oCamera._camX - oCamera._camWidth / 2, oCamera._camX + oCamera._camWidth * 1.5), oCamera.targetY + oCamera._camHeight + 32, "Instances", oGasParticle); //create gas effect
	}
	
	if (frame_counter % (60*10) == 0)
	{
		oPlayer.take_damage(1);
	}
}

frame_counter += 1;

if (frame_counter > 4294967295) //overflow protection
{
	frame_counter = 0;
}

/*
// Camera Lock
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camWidth = camera_get_view_width(view_camera[0]);

x = _camX + (_camWidth / 2); 
y = _camY + 40;