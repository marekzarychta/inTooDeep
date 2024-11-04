// Sprawdź, czy przeciwnik zginął
if (health_points <= 0) {
    isAlive = false;
    //with (other) instance_destroy();  // Usuń przeciwnika
    //show_debug_message("Wróg pokonany!");
}

//X Movement
if isAlive {
	playerX = oPlayer.x;
	playerY = oPlayer.y;
	
	var dx = playerX - x;
	var dy = playerY - y;
	
	//if place_meeting(x, y, oPlayer) {
	//	//show_debug_message("Kolizja");	
	//}
	image_xscale = -moveDir;
	
	if oPlayer.isAlive {
		if sqrt(dx * dx + dy * dy) < 144 /*&& changeDirTimer == 0*/ {
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
	} else {
		following = false;	
	}
	
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

	if abs(dx) < 0.5 && following {
		xspd = 0;	
	}

	//X Collision
	//How close we can get to a wall etc.
	var _subPixel = .5;
	//Check wall collision
	if place_meeting(x + xspd, y, oWall) 
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
	if !following {
	
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
	} 
	

	//Move
	x += xspd;
}


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
		onGround = true;
		//jumpCount = 0;
		//jumpHoldTimer = 0;
	} else {
		onGround = false;
		//if jumpCount == 0{	jumpCount = 1;}
	}
	
	if (attacking) {
	    if (attackTimer > 0) {
	        attackTimer--;
	        //show_debug_message("Attacking in progress. Attack Timer: " + string(attackTimer));
	        sprite_index = sprites[2];  // Ustaw animację ataku
	    } else {
	        attacking = false;
	        //show_debug_message("Attack ended.");
	    }
	}
	
	y += yspd;
	
	
	//Select sprite depending on movement
	
	if isAlive {
		if attacking {
			//show_debug_message("tak")
			sprite_index = sprites[2];
		} else if(xspd == 0){
			sprite_index = sprites[0];
		} else if(xspd != 0){
			sprite_index = sprites[1];
		}
	} else {
		sprite_index = sprites[4];	
	}
	
	//tu dodac warunek do ataku, nw jaki