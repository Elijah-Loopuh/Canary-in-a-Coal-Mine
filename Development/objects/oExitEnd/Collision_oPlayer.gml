
if keyboard_check_pressed( ord( "E" )) //true 1st step keys are held
{
	//record the last room the player was in to return to after ui

	//put player in new room
	room_goto(rWinScreen);

	//lower gravity in the low gravity gimmick room

	
	/*
	if (variable_instance_exists(id, "returnX")) // if returnX & Y are assigned, assign the global variables
	{
		global.returnX = returnX
		global.returnY = returnY
	}
	*/

	//show_debug_message(global.last_room)
}