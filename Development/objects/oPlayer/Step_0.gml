attack_timer --;


doUpdateKeys(); //registers keypresses

doDebugPowers(); //grants debus powers each step (hard set health and inf double jumps, etc)


//X Movement

doSetMoveDir(); //sets the target speed for direction and sprint

doChangeGrip(); //slippery in air and when fast

doSmoothXspd(); //uses grip and moveDir

doDash(); //overrides smoothed xSpd wit hard value

doMoveX(); //uses xSpd and multiplies it by moveSpd, checks for collision before moving


//Y Movement

doGravity(); //applies gravity to y axis

doJump(); //overrides gravity with jump and double jumps

doMoveY(); // check for collsion and move on y axis

	

//general 2
	
doUpdateMinerCarry(); //update signaling variables and kill over capacity miners

doDeath(); //if health is 0, reset (die)

doDoubleJumpRefresh(); //refresh jump if on the ground

doPlayerStates(); //update player animations