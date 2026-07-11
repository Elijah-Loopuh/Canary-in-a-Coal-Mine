
//math functions

		boundIRandom = function (lower, upper) // random int between lower and upper, inclusive on both sides
		{
			return irandom(upper - lower) + lower	
		}



//data structures

		//Room Data 2d array, holds ids & entrance coords
		global.roomData = 
		[
		   /*"roomId", enterTopX, enterTopY, enterBottomX, enterBottomY*/
			[rLayer1Type1, 1568, 96, 224, 896],		//original				0
			[rLayer1Type2, 1632, 96, 192, 896],		//vertical shafts		1
			[rLayer1Type3, 1632, 96, 192, 864],		//layer cake			2
			[rLayer1Type4, 1664, 96, 1536, 768],	//fracking				3
			[rLayer1Type5, 1664, 96, 256, 672],		//pit					4
	
			[rLayer2Type1, 1664, 96, 160, 1664],	//floating islands		5
			[rLayer2Type2, 1664, 1824, 1248, 1824],	//pyramid				6
			[rLayer2Type3, 0, 0, 0, 0],				//empty					7
	
			[rBigTestingRoom, 0, 0, 2368, 1408]		//testing				8
		]

		// the room path expressed as indicies of the roomData array
		global.path =
		[
			boundIRandom(0, 4),		//layer1 (5 rooms)
			boundIRandom(5, 7)		//layer2 (3 rooms)
									//layer3 (none made yet)
		]



// array extraction functions

		getRoomId = function (rLayer)
		{
			return global.roomData	//main array to index
			[global.path[rLayer]]	//index to the randomized room
			[0]						// index for the roomId
		}

		getRoomTopX = function (rLayer)
		{
			return global.roomData	//main array to index
			[global.path[rLayer]]	//index to the randomized room
			[1]						// index for x value of the top entrance point
		}

		getRoomTopY = function (rLayer)
		{
			return global.roomData	//main array to index
			[global.path[rLayer]]	//index to the randomized room
			[2]						// index for y value of the top entrance point
		}

		getRoomBottomX = function (rLayer)
		{
			return global.roomData	//main array to index
			[global.path[rLayer]]	//index to the randomized room
			[3]						// index for x value of the bottom entrance point
		}

		getRoomBottomY = function (rLayer)
		{
			return global.roomData	//main array to index
			[global.path[rLayer]]	//index to the randomized room
			[4]						// index for y value of the bottom entrance point
		}