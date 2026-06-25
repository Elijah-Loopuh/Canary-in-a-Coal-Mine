//put player in new room
room_goto(targetRoom)

//put player at proper position
other.x = targetX
other.y = targetY

//put canary on player
oCanary.x = targetX
oCanary.y = targetY

//record the last room the player was in to return to after ui
global.last_room = room

if (variable_instance_exists(id, "returnX"))
{
	global.returnX = returnX
	global.returnY = returnY
}

/*
show_debug_message(global.last_room)
*/