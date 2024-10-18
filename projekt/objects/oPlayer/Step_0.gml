//Get inputs
getControls();
//X Movement

	if place_meeting(x, y, oEnemy) {
		show_debug_message("Kolizja z wrogiem");	
	}

		//Direction
	moveDir = rightKey - leftKey;

		//Get xspd
	xspd = moveDir * moveSpd;

	//X Collision
		//How close we can get to a wall etc.
	var _subPixel = .5;
	//Check wall collision
	if place_meeting(x + xspd, y, oWall)
	{
		//Walk up to wall precisely
		var _pixelCheck = _subPixel * sign(xspd);
	
		//Move as close to the wall as possible in 0.5px increments
		while !place_meeting(x+_pixelCheck, y, oWall)
		{
			x += _pixelCheck;
		}
	
		//Stop movement to collide
		xspd = 0;
	}

	//Move
	x += xspd;
	
//Y Movement
	//Gravity
	yspd += grav;
	
	if yspd > termVel {yspd = termVel; };
	
	//Initiate jump
	if upKeyBuffered && jumpCount < jumpMax
	{
		//Reset the buffer
		upKeyBuffered = false;
		upKeyBufferTimer = 0;
		
		//Add jump to count
		jumpCount++;
		
		//Set jump hold timer
		jumpHoldTimer = jumpHoldFrames[jumpCount-1];
		
	}
	//cut off jump
	if !upKey{
		jumpHoldTimer = 0;	
	}
	//jump based on timer
	if jumpHoldTimer > 0{
		yspd = jspd[jumpCount-1];
		//Count down timer
		jumpHoldTimer--;
	}
	
	//Y Collision
	var _subPixel = .5;
	
	//Check wall collision
	if place_meeting(x, y + yspd, oWall)
	{
		//Move up to wall precisely
		var _pixelCheck = _subPixel * sign(yspd);
	
		//Move as close to the wall as possible in 0.5px increments
		while !place_meeting(x, y + _pixelCheck, oWall)
		{
			y += _pixelCheck;
		}
		//Bonk
		if (yspd < 0){
			jumpHoldTimer = 0;
		}
		//Stop movement to collide
		yspd = 0;
	}
	
	//Check if on ground
	if yspd >=0 && place_meeting(x,y+1, oWall){
		onGround = true;
		jumpCount = 0;
		jumpHoldTimer = 0;
	} else {
		onGround = false;
		if jumpCount == 0{	jumpCount = 1;}
	}
	y += yspd;