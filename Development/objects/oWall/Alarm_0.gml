id.depth = 150

//fancy world gen stuff

left = place_meeting(x-32, y, oWall);
right = place_meeting(x+32, y, oWall);
up = place_meeting(x, y-32, oWall);
down = place_meeting(x, y+32, oWall);

//fully surrounded 0
if(!left && !right && !up && !down){sprite_index = sAll_Sides_floor;}

//only left open 1
if(!left && right && up && down){sprite_index = sLeft_Middle_floor;}

//only right open 1
if(left && !right && up && down){sprite_index = sRight_Middle_floor;}

//only up open 1
if(left && right && !up && down){sprite_index = sMiddle_Top_floor;}

//only down open 1 
if(left && right && up && !down){sprite_index = sMiddle_Bottom_floor;}

//Top Left Corner 2 
if(!left && right && !up && down){sprite_index = sLeft_Top_floor;}

//Top Right Corner 2 
if(left && !right && !up && down){sprite_index = sRight_Top_floor;}

//Top Left Corner 2 
if(!left && right && up && !down){sprite_index = sLeft_Bottom_floor;}

//Top Right Corner 2
if(left && !right && up && !down){sprite_index = sRight_Bottom_floor;}

//Sidways middle skinny 3
if(!left && !right && up && down){sprite_index = sSkinny_Middle_floor;}

//middle bit if skinny 2
if(left && right && !up && !down){sprite_index = sSkinny_Middle_horizontal_floor;}

//middle side right 3
if(!left && right && !up && !down){sprite_index = sSkinny_Left_floor;}

//middle side left 3
if(left && !right && !up && !down){sprite_index = sSkinny_Right_floor;}


//top bit if skinny 3
if(!left && !right && !up && down){sprite_index = sSkinny_Top_floor;}

//bottom bit if skinny 3
if(!left && !right && up && !down){sprite_index = sSkinny_Bottom_floor;}

//fully surrounded 4
if(left && right && up && down){sprite_index = sTrue_Middle_floor;}
