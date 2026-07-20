

//pause management

	if  (oGlobalFunctions.isSongPlaying("any")) //check if playing song before doing any song related things
	{
		if keyboard_check_pressed( ord( "P")) //cycle pause on 'p' pressed
		{
			pause = !pause;
		}
		if (pause) //pause management
		{
			audio_pause_sound(oGlobalFunctions.getCurrentSongId());
		}
		else
		{
			audio_resume_sound(oGlobalFunctions.getCurrentSongId());
		}
	}


//events and their respective songs

	/*do conditionals this way so that the game wont crash if there is no song currently playing.*/
	if (room == rShop && !oGlobalFunctions.isSongPlaying(mBackroundMusic)) //if in shop and background music is not playing already
	{
		show_debug_message("shop song start")
		oGlobalFunctions.forcePlaySong(mBackroundMusic);
	}

	if (array_contains(oGlobalFunctions.getAllRoomIds(), room) && !oGlobalFunctions.isSongPlaying(mIntenseRunning))
	{
		show_debug_message("run song start")
		oGlobalFunctions.forcePlaySong(mIntenseRunning);
	}
	
	if (room == rBigTestingRoom && oGlobalFunctions.isSongPlaying("any")) //if in shop and background music is not playing already
	{
		show_debug_message("all songs stopped")
		oGlobalFunctions.stopAllSongs();
	}