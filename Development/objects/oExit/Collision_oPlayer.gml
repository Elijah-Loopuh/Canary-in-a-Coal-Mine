
if keyboard_check_pressed( ord( "E" )) //true 1st step keys are held
{
	//record the last room the player was in to return to after ui
	global.last_room = room

	//put player in new room
	room_goto(targetRoom)

	//put player at proper position
	other.x = targetX
	other.y = targetY

	//put canary on player
	oCanary.x = targetX
	oCanary.y = targetY

	other.xspd = 0
	other.yspd = 0

	if (variable_instance_exists(id, "returnX")) // if returnX & Y are assigned, assign the global variables
	{
		global.returnX = returnX
		global.returnY = returnY
	}


	//show_debug_message(global.last_room)
}