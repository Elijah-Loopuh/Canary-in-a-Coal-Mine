
//math functions

		boundIRandom = function (lower, upper) // random int between lower and upper, inclusive on both sides
		{
			return irandom(upper - lower) + lower	
		}
		
		
		
//spawning functions
		
		function SpawnEnemy(amount, type, arial = false) 
		{
			i = 0
			
			while (instance_number(type) < amount && i < 10000)
			{
				i++
				xx = irandom(floor(room_width/32) -1);
				yy = irandom(floor(room_height/32) -1);
	
				px = xx * 32 + 16;
				py = yy * 32;
		
				if (((place_meeting(px+16, py+1, oWall) && place_meeting(px-16, py+1, oWall)) || arial)/*floor checks*/ && !place_meeting(px, py, oNoEnemySpawn)/*region check*/ && !place_meeting(px, py, oWall)/*inside wall check*/)
				{
					instance_create_layer(px, py+32, "Instances", type);
					//instance_create_layer(px, py+32, "Instances", oPointer);
				}
				//show_debug_message(i)
	
			}
		}
		
		
		function spawn_room_walls(x, y, width /*use room width*/, height /*use room height*/) // makes room wall boundaries
		{
		    var w = width/32 + 2;
		    var h = height/32 + 2;

		    for (var yy = 0; yy < h; yy++)
		    {
		        for (var xx = 0; xx < w; xx++)
		        {
		            // 2-tile thick border condition
		            if (xx < 2 || xx >= w - 2 || yy < 2 || yy >= h - 2)
		            {
		                instance_create_layer(
		                    x + xx * 32,
		                    y + yy * 32,
		                    "Instances",
		                    oWall
		                );
		            }
		        }
		    }
		}
		
		
		function spawn_walls(x, y, width /*use room width*/, height /*use room height*/) // replaces devMarker with proper walls
		{
		    var w = width/32 + 2;
		    var h = height/32 + 2;

		    for (var yy = 0; yy < h; yy++)
		    {
		        for (var xx = 0; xx < w; xx++)
		        {
					//show_debug_message(xx*32)
					//show_debug_message(yy*32)
		            //check for devmarker
		            if (position_meeting((xx*32)+1, (yy*32)+1, oDevMarker))
		            {
		                instance_create_layer(
		                    x + xx * 32,
		                    y + yy * 32,
		                    "Instances",
		                    oWall
		                );
						//show_debug_message("wall spawned");
		            }
		        }
		    }
		}
		
		
		function SpawnMiners(amount) 
		{
			i = 0;
			
			while (instance_number(oMiner) < amount && i < 100000)
			{
				i++
				xx = irandom(floor(room_width/32) -1);
				yy = irandom(floor(room_height/32) -1);
	
				px = xx * 32 + 16;
				py = yy * 32;
	
				if (place_meeting(px+16, py+1, oWall) && place_meeting(px-16, py+1, oWall)/*floor checks*/ && !place_meeting(px, py, oNoMinerSpawn)/*region*/ && !place_meeting(px, py, oWall)/*obstruction*/)
				{
					instance_create_layer(px, py+32, "Instances", oMiner);
					//instance_create_layer(px, py+32, "Instances", oPointer);
				}
				//show_debug_message(i)
	
			}
		}



//data structures press plus on left to expand :)

		//Room Data 2d array, holds ids & entrance coords
		{
			roomData = 
			[
			   /*"roomId", enterTopX, enterTopY, enterBottomX, enterBottomY*/
				[rLayer1Type1, 1568, 96, 224, 896],		//original				0
				[rLayer1Type2, 1632, 96, 192, 896],		//vertical shafts		1
				[rLayer1Type3, 1632, 96, 192, 864],		//layer cake			2
				[rLayer1Type4, 1664, 96, 1536, 768],	//fracking				3
				[rLayer1Type5, 1664, 96, 256, 672],		//pit					4
	
				[rLayer2Type1, 1664, 96, 160, 1664],	//floating islands		5
				[rLayer2Type2, 1664, 1824, 1248, 1824],	//pyramid				6
				[rLayer2Type3, 1728, 128, 1728, 1856],	//cave					7
			
				[rLayer3Type1, 1792, 96, 0, 0],			//great well			8
	
				[rBigTestingRoom, 0, 0, 2368, 1408]		//testing				9
			]
		}


		//the room path expressed as indicies of the roomData array
		{
			path =
			[
				boundIRandom(0, 4),		//layer1 (5 rooms)
				boundIRandom(5, 7),		//layer2 (3 rooms)
				8						//layer3 (not done, 3 rooms planned)
			]
		}
		
		
		//background music queue
		{
			queue = 
			[
				mBackroundMusic, 
				mIntenseRunning, 
				mTitleMusic, 
				mShopMusic, 
			]
		}
		
		
		//index of current song in the queue
		queuePosition = -1; //set to negative one when no song is playing
		

//array functions

	//music queue management
	
		getSongIndex = function(songId) //returns the index of the song id provided
		{
			return array_get_index(queue, songId);
		}

		getCurrentSongId = function() //returns the id of the current song
		{
			return queue[queuePosition];
		}
		
		getCurrentSongIndex = function() //returns the index of the currently playing song, wont crash when no song playing
		{
			return queuePosition;	
		}
		
		isSongPlaying = function(songId) //checks if a specific song is playing if inputted, or any song if input set to 'any'
		{
			if (songId == "any") //if checking any song, just make sure queue position is not on the null value
			{
				return queuePosition != -1;
			}
			else
			{
				return getCurrentSongIndex() == getSongIndex(songId);
			}
		}
		
		setQueue = function(input) //sets queue position to a ceratin index or song depending on input type
		{
			if (typeof(input) == "int64") //if integer passed in
			{
				queuePosition = array_length(queue)-1 % index; //overflow protection
			}
			else if (typeof(input) == "ref") //if song id passed in
			{
				queuePosition = getSongIndex(input) //set queue to position of that song
			}
		}
		
		stopAllSongs = function() //stops every song that exists in the queue
		{
			if isSongPlaying("any")
			{
				for (i = 0; i < array_length(queue); i++)
				{
					audio_stop_sound(getCurrentSongId());
				}
				queuePosition = -1; //indicate no song is playing
			}
		}
		
		playCurrentSong = function() //plays the song at index queuePosition
		{
			audio_play_sound(queue[queuePosition], 100, true);
		}
		
		forcePlaySong = function(songId) //stops all songs, then moves queue to provided song and plays that song
		{
			stopAllSongs(); //override other music
			setQueue(songId); //move to new song
			playCurrentSong(); //restart play
		}


	//room data
	
		getAllRoomIds = function() //returns the room id of every room in the current random path in order
		{
			Ids = []
			for (i = 0; i < array_length(path); i++;)
			{
				array_push(Ids, getRoomId(i));
			}
			return Ids;
		}

		getRoomId = function (rLayer) //returns the id for the room on that layer of the random path
		{
			return roomData	//main array to index
			[path[rLayer]]	//index to the randomized room
			[0]						// index for the roomId
		}

		getRoomTopX = function (rLayer) //returns the exit x coord of the top door of the room on the given layer, depending on the random path
		{
			return roomData	//main array to index
			[path[rLayer]]	//index to the randomized room
			[1]						// index for x value of the top entrance point
		}

		getRoomTopY = function (rLayer) //returns the exit y coord of the top door of the room on the given layer, depending on the random path
		{
			return roomData	//main array to index
			[path[rLayer]]	//index to the randomized room
			[2]						// index for y value of the top entrance point
		}

		getRoomBottomX = function (rLayer) //returns the exit x coord of the bottom door of the room on the given layer, depending on the random path
		{
			return roomData	//main array to index
			[path[rLayer]]	//index to the randomized room
			[3]						// index for x value of the bottom entrance point
		}

		getRoomBottomY = function (rLayer) //returns the exit y coord of the bottom door of the room on the given layer, depending on the random path
		{
			return roomData	//main array to index
			[path[rLayer]]	//index to the randomized room
			[4]						// index for y value of the bottom entrance point
		}