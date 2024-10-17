//Get inputs

//X Movement
		//Direction
	

		//Get xspd
	xspd = moveDir * moveSpd;

	//X Collision
		//How close we can get to a wall etc.
	var _subPixel = .01;
	//Check wall collision
	if place_meeting(x + xspd, y, oWall)
	{
		
		var _pixelCheck = _subPixel * sign(xspd);
	
		//Move as close to the wall as possible in 0.5px increments
		while !place_meeting(x + _pixelCheck, y, oWall)
		{
			x += _pixelCheck;
		}
	
		moveDir *= -1;
	}

	//Move
	x += xspd;
	
//Y Movement
	//Gravity
	yspd += grav;
	
	if yspd > termVel {yspd = termVel; };
	
	//Initiate jump
	
	
	//Y Collision
	var _subPixel = .01;
	
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
		
		//Stop movement to collide
		yspd = 0;
	}
	
	
	y += yspd;