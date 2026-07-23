

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
	if (room == rShop && !oGlobalFunctions.isSongPlaying(mShopMusic)) //shop song
	{
		show_debug_message("shop song start");
		oGlobalFunctions.forcePlaySong(mShopMusic);
	}

	if (array_contains(oGlobalFunctions.getAllRoomIds(), room) && !oGlobalFunctions.isSongPlaying(mBackroundMusic) && room != rBigTestingRoom) //if on any room in the generated random path
	{
		show_debug_message("bg song start");
		oGlobalFunctions.forcePlaySong(mBackroundMusic); //background cave music
	}
	
	if (room == rMenu && !oGlobalFunctions.isSongPlaying(mTitleMusic)) //title song
	{
		show_debug_message("title song started");
		oGlobalFunctions.forcePlaySong(mTitleMusic);
	}
	
	if (room == rBigTestingRoom && oGlobalFunctions.isSongPlaying("any")) //stop all music in bigtesting room
	{
		show_debug_message("all songs stopped");
		oGlobalFunctions.stopAllSongs();
	}