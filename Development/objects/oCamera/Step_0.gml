//Fullscreen toggle
if keyboard_check_pressed(vk_f8) 
{ 
	window_set_fullscreen( !window_get_fullscreen() )	
}

//Exit if there is no player
if !instance_exists(oPlayer) exit;
if room == rDeathScreen exit;

//Get camera size
 _camWidth = camera_get_view_width(view_camera[0]);
 _camHeight = camera_get_view_height(view_camera[0]);

//Get camera target coordinates
 _camX = oPlayer.x - _camWidth/2;
 _camY = oPlayer.y - _camHeight/2;

//Constrain cam to room borders
_camX = clamp(_camX, 0, room_width - _camWidth)


if (keyboard_check( ord( "S" )) && targetY >_camY - _camHeight/4) //move up or down
{
	targetY += cam_speed;
	//show_debug_message("moving + away");
}
else if (keyboard_check( ord( "W" )) && targetY <_camY + _camHeight/4)
{
	targetY -= cam_speed;
	//show_debug_message("moving - away");
}
if !(keyboard_check( ord( "S" )) || keyboard_check( ord( "W" )))
{
	if targetY > clamp(_camY, 0, room_height - _camHeight) //return to normal coords
	{
		targetY -= cam_speed;
		//show_debug_message("moving - towards");
	}
	else if (targetY < clamp(_camY, 0, room_height - _camHeight))
	{
		targetY += cam_speed;
		//show_debug_message("moving + torwads");
	}
	
	if (abs(targetY - clamp(_camY, 0, room_height - _camHeight)) <= cam_speed)	//snap if close enough
	{
		targetY = clamp(_camY, 0, room_height - _camHeight);
		//show_debug_message("snapped");
	}
}

targetY = clamp(targetY, _camY - _camHeight/4, _camY + _camHeight/4); //stay close to endpoint coords (keeps target location on screen)
targetY = clamp(targetY, 0, room_height - _camHeight); //constrain inside room

camera_set_view_pos(view_camera[0], _camX, targetY); //go to target coords