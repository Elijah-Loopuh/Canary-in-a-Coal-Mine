if keyboard_check_pressed( ord( "P"))
{
	pause = !pause
	if (pause)
	{
		audio_pause_sound(oGlobalFunctions.getCurrentSong());
	}
	else
	{
		audio_resume_sound(oGlobalFunctions.getCurrentSong());
	}
}