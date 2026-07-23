if (room == rLayer3Type2) //the low grav room
{
	oPlayer.grav = 0.35/2;
	show_debug_message("low grav on");
}
else
{
	oPlayer.grav = 0.35;	
	show_debug_message("low grav off");
}