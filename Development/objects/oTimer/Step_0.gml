// Countdown Timer Notice
if(!is_gas_rising)
{
	gas_timer--;
	
	if(gas_timer <=0)
	{
		is_gas_rising = true
	}
	
	show_debug_message("It feels like it's harder to breath.");
}

// Camera Lock
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camWidth = camera_get_view_width(view_camera[0]);

x = _camX + (_camWidth / 2); 
y = _camY + 40;