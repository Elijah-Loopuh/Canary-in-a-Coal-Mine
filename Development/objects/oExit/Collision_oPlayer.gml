//record the last room the player was in to return to after ui
global.last_room = room

//put player in new room
room_goto(targetRoom)

//put player at proper position
other.x = targetX
other.y = targetY