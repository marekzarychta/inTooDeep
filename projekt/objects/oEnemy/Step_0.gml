//Get inputs

//X Movement
	
	playerX = oPlayer.x;
	playerY = oPlayer.y;
	
	var dx = playerX - x;
	var dy = playerY - y;
	
	//if place_meeting(x, y, oPlayer) {
	//	show_debug_message("Kolizja");	
	//}
	
	
	
	if sqrt(dx * dx + dy * dy) < 72 /*&& changeDirTimer == 0*/ {
		moveDir = sign(dx);	
		//changeDirTimer = changeDirBuffer;
		following = true;
		followingTimer = followingBuffer;
	} else {
		if followingTimer > 0 {
			followingTimer--;	
		} else {
			following = false;	
		}
	}
	
	//if changeDirTimer > 0 {
	//	changeDirTimer--;	
	//} else {
	//	changeDirTimer = 0;	
	//}
	
	
	

	//Get xspd
	xspd = moveDir * moveSpd;

	if abs(dx) < 0.5 && following {
		xspd = 0;	
	}

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
	
		if !following && wallTimer == 0 {
			moveDir *= -1;
			wallTimer = wallBuffer;
		
			
		} else {
			if jumpCount < jumpMax
			{
				jumpCount++;
				jumpHoldTimer = jumpHoldFrames;
			}
	
			//jump based on timer
			if jumpHoldTimer > 0 {
				yspd = jspd;
				//Count down timer
				jumpHoldTimer--;
			}
			
			xspd = 0;
		}
		
	}
	
	if wallTimer > 0 {
		wallTimer--;	
			
	} else {
			
		wallTimer = 0;
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
		if (yspd < 0){
			jumpHoldTimer = 0;
		}
		//Stop movement to collide
		yspd = 0;
	}
	
	if yspd >=0 && place_meeting(x,y+1, oWall){
		//onGround = true;
		jumpCount = 0;
		jumpHoldTimer = 0;
	} else {
		//onGround = false;
		if jumpCount == 0{	jumpCount = 1;}
	}
	
	
	
	y += yspd;
	
	