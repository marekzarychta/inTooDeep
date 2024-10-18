//Get inputs

//X Movement
	
	playerX = oPlayer.x;
	playerY = oPlayer.y;
	
	var dx = playerX - x;
	var dy = playerY - y;
	
	if dx == 0 && dy == 0 {
		show_debug_message("Kolizja");	
	} else if sqrt(dx * dx + dy * dy) < 72 {
		moveDir = sign(dx);	
		following = true;
	} else {
		following = false;	
	}
	
	

		//Get xspd
	xspd = moveDir * moveSpd;

	//X Collision
	//How close we can get to a wall etc.
	var _subPixel = .5;
	//Check wall collision
	if place_meeting(x + xspd, y, oWall) 
	{
		
		var _pixelCheck = _subPixel * sign(xspd);
	
		//Move as close to the wall as possible in 0.5px increments
		while !place_meeting(x + _pixelCheck, y, oWall)
		{
			x += _pixelCheck;
		}
	
		if !following {
			moveDir *= -1;
		} else {
			xspd = 0;	
		}
	}
	
	//Check edge falling
	//Setting check side, so set width of the sprite
	if !following {
	
		var edgeDir = oEnemy.sprite_width * sign(xspd) / 2;
	
		//if there is not a floor object has to come back
		if !place_meeting(x + edgeDir , y + 0.1, oWall) && edgeTimer == 0 {
			edgeTimer = edgeBuffer;
			moveDir *= -1;
		
		}
	
		//Setting buffor to make sure that object will leave a danger zone
	
		if edgeTimer > 0 {
			edgeTimer--;	
		} else {
			edgeTimer = 0;
		}
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
	
	