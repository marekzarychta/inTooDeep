// Sprawdź, czy przeciwnik zginął

	
	
	//if place_meeting(x, y, oPlayer) {
	//	//show_debug_message("Kolizja");	
	//}

		image_xscale = -moveDir;
	
	
	//if changeDirTimer > 0 {
	//	changeDirTimer--;	
	//} else {
	//	changeDirTimer = 0;	
	//}
	
	
	

	//Get xspd
	if onGround
		xspd = moveDir * moveSpd;
	else 
		xspd = 0;
	
	if (knockback_duration > 0) {
	    // Odrzut
	    xspd = knockback_x;
	    yspd = knockback_y;

	    // Zmniejszaj czas trwania odrzutu
	    knockback_duration--;

	    // Powoli zmniejszaj prędkość odrzutu (opcjonalnie dla efektu oporu)
	    knockback_x *= 0.8;
	    knockback_y *= 0.8;
	} else {
	    // Normalne poruszanie się, gdy knockback się skończy
	    knockback_x = 0;
	    knockback_y = 0;
	}


	//X Collision
	//How close we can get to a wall etc.
	
	
	var _subPixel = .5;
	
	var obj = instance_place(x + xspd, y, oDoor);
	if  (place_meeting(x + xspd, y, oDoor) && !obj.opened) {
		
		if wallTimer == 0 {
			moveDir *= -1;
			wallTimer = wallBuffer;
		} 
		
	}
	
	//Check wall collision
	if place_meeting(x + xspd, y, oWall) || place_meeting(x + xspd, y, oLogicalWall)
	{
		
		isSlope = checkingForSlopes(id);
	
		if !following && wallTimer == 0 && !isSlope {
			moveDir *= -1;
			wallTimer = wallBuffer;
		
			
		} else {
			//if jumpCount < jumpMax
			//{
			//	jumpCount++;
			//	jumpHoldTimer = jumpHoldFrames;
			//}
	
			////jump based on timer
			//if jumpHoldTimer > 0 {
			//	yspd = jspd;
			//	//Count down timer
			//	jumpHoldTimer--;
			//}
			
			//xspd = 0;
			
		}
		
	}
	
	checkingForSlopesGoingDown(id);
	
	
	if wallTimer > 0 {
		wallTimer--;	
			
	} else {
			
		wallTimer = 0;
	}
	
	//Check edge falling
	//Setting check side, so set width of the sprite
	
		var edgeDir = id.sprite_width / 2;
	
		//if there is not a floor object has to come back
		if !place_meeting(x - edgeDir , y + 2, oWall) && edgeTimer == 0 && !isSlope {
			edgeTimer = edgeBuffer;
			moveDir *= -1;
		
		}
				
		//Setting buffor to make sure that object will leave a danger zone
	
		if edgeTimer > 0 {
			edgeTimer--;	
			
		} else {
			
			edgeTimer = 0;
		}
	
			
		if(xspd == 0 && !stunned){
			sprite_index = sprites[0];
		} else if(xspd != 0 && !stunned){
			sprite_index = sprites[1];
		}
		
		if(place_meeting(x+xspd,y,oLogicalWall)){
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
	if place_meeting(x, y + yspd, oWall) || place_meeting(x, y + yspd, oLogicalWall)
	{
		//Move up to wall precisely
		var _pixelCheck = _subPixel * sign(yspd);
	
		//Move as close to the wall as possible in 0.5px increments
		while !place_meeting(x, y + _pixelCheck, oWall) && !place_meeting(x, y + _pixelCheck, oLogicalWall)
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
	
	if yspd >=0 && (place_meeting(x,y+1, oWall)||place_meeting(x,y+1, oLogicalWall)){
		onGround = true;
		//jumpCount = 0;
		//jumpHoldTimer = 0;
	} else {
		onGround = false;
		//if jumpCount == 0{	jumpCount = 1;}
	}
	
	
	y += yspd;
	
	
	//Select sprite depending on movement
	
	
	
	
	
	
	//tu dodac warunek do ataku, nw jaki