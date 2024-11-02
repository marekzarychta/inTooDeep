if isAlive {

	HPManage();
	
	

	//Get inputs
	if !oInventory.opened
		getControls();



	var cratesInRange = []; 
	var horizontalRange = 48;
	var nearestCrate = noone; 
	var shortestDistance = 9999;


	// Modyfing speed and jump multipliers based on weight


	ChangeWeight();

	if currentWeightLevel < 2 {
		termVel = termVelValues[0];
	} else {
		termVel = termVelValues[currentWeightLevel - 1]; // 2 and 3 -> 1 and 2
	}

	if yspd > 5.5 {
		can_break_red = true;	
	} else {
		can_break_red = false;	
	}
	
	if yspd > 4.5 {
		can_break_orange = true;	
	} else {
		can_break_orange = false;	
	}
//X Movement

	//if place_meeting(x, y, oEnemy) {
	//	show_debug_message("Kolizja z wrogiem");	
	//}

		//Direction
	moveDir = rightKey - leftKey;

	if moveDir != 0 {
		face = moveDir;
	}

	//Check Collision with chest

	with (oChest) {
	    
		//Checking if chest is in range
		
	    if (abs(other.x - x) <= horizontalRange  && abs(other.y - y) <= 2) {
	        // Adding chest to array
	        array_push(cratesInRange, id);
	    }
	}
		
	for (var i = 0; i < array_length(cratesInRange); i++) {
	    var crate = cratesInRange[i];
    
	    // Caluclating distance
	    var dist = abs(crate.x - x);
    
	    // Finding shortes distance and chest id
	    if (dist < shortestDistance) {
	        nearestCrate = crate;
	        shortestDistance = dist;
	    }
	}
	//setting id nearest chest
	chestId = nearestCrate;
	
	//Flip horizontally according to movement direction
	
	
		//Get xspd
	if moveDir != 0
	{
		image_xscale = moveDir;
		if(yspd==0){
		//Change movement animation based on weight
		sprite_index = movementSprites[currentWeightLevel];
		//Move slower at certain weights
		if (currentWeightLevel == 4 || currentWeightLevel == 1){
			image_speed = 0.75;
		}else{
			image_speed = 1;
		}
		}
	}else if (moveDir ==0 && yspd == 0) {
		sprite_index = sPlayerIdle;
	}
	//Set xspd with smoothing
	xspd = smooth(xspd, moveDir * moveSpd[currentWeightLevel]);

	//X Collision
		//How close we can get to a wall etc.
	var _subPixel = .5;
	//Check wall collision
	if (place_meeting(x + xspd, y, oWall)) // || (place_meeting(x + xspd, y, oBreakableWallOrange) && yspd == 0)
	{
		checkingForSlopes(id);
	}

	checkingForSlopesGoingDown(id);

	//Move x
	x += xspd;
	
//Y Movement
	//Gravity
	
	if isLadder {
		grav = 0; 	
	} else {
		grav = .163;	
	}
	
	yspd += grav;
	
	//ladders
	if upKey && isLadder {
		yspd = -ladderSpd; 	
	} else if downKey && isLadder {
		yspd = ladderSpd;	

	} else if isLadder {
		yspd = 0;
		if currentWeightLevel == 3 {
			yspd = weightLadderSlip;
		}
	}
	
	//If speed would exceed terminal velocity, cap it
	if yspd > termVel {yspd = termVel; };
	
	//Initiate jump - cannot jump on ladders
	if upKeyBuffered && jumpCount < jumpMax && onGround
	{
		//Reset the buffer
		upKeyBuffered = false;
		upKeyBufferTimer = 0;
		
		//Add jump to count
		jumpCount++;
		jumpStartTimer = jumpDuration;
		
		//Set jump hold timer
		jumpHoldTimer = jumpHoldFrames[jumpCount-1];
		
	}
	
	//cut off jump
	if !upKey{
		jumpHoldTimer = 0;	
	}
	//jump based on timer
	if jumpHoldTimer > 0{
		yspd = jspd[jumpCount-1][currentWeightLevel];
		//Count down timer
		jumpHoldTimer--;
	}

	//Y Collision
	var _subPixel = .5;
	
// Check wall collision
if (place_meeting(x, y + yspd, oWall)) {
    if (can_break_orange && place_meeting(x, y + yspd, oBreakableWallOrange) && yspd > 0) {
        var breakableWall = instance_place(x, y + yspd, oBreakableWallOrange);
        if (breakableWall != noone) {
            with (breakableWall) {
                instance_destroy();
            }
        }
    } else if (can_break_red && place_meeting(x, y + yspd, oBreakableWallRed) && yspd > 0) {
        var breakableWall = instance_place(x, y + yspd, oBreakableWallRed);
        if (breakableWall != noone) {
            with (breakableWall) {
                instance_destroy();
            }
        }
    } else {
        // Move up to wall precisely
        var _pixelCheck = _subPixel * sign(yspd);

        // Move as close to the wall as possible in 0.5px increments
        while !place_meeting(x, y + _pixelCheck, oWall) && !place_meeting(x, y + _pixelCheck, oBreakableWallOrange) {
            y += _pixelCheck;
        }

        // Bonk
        if (yspd < 0) {
            jumpHoldTimer = 0;
        }

        // Stop movement to collide
        yspd = 0;  // Setting yspd to 0 only when truly colliding
    }
}

	//checking is player on ladder
	if place_meeting(x, y, oLadder) && (upKey || downKey) {
		isLadder = true;	
	} 
	if !place_meeting(x, y, oLadder) {
		isLadder = false;
	}
	//checking top ladder
	if (!place_meeting(x, y, oLadder) && place_meeting(x, y + 1, oLadder) && !isLadder && !downKey) {
	    
		var _subPixel = 0.5;
		
	    // Move up to wall precisely
	    var _pixelCheck = _subPixel;

	    // Move as close to the wall as possible in 0.5px increments
	    while !place_meeting(x, y + _pixelCheck, oLadder) {
	        y += _pixelCheck;
	    }

	    // Stop movement to collide
		isLadder = false;
	    yspd = 0;  // Setting yspd to 0 only when truly colliding
	}

	
	//Check if on ground, reset timers
	if (yspd == 0 && place_meeting(x, y + 1, oWall)) {
	    onGround = true;
	    jumpCount = 0;
	    jumpHoldTimer = 0;
	} else {
	    onGround = false;
	    // Start jump animation
	    if (jumpStartTimer > 0) {
	        jumpStartTimer--;
	    } 

		if !isLadder {
			if (jumpStartTimer > 0) {
		        sprite_index = sPlayerStartJump;
		    } else if (yspd > 0) {
		        // Fall animation
		        sprite_index = sPlayerFall;
		    } else if (!onGround && jumpCount > 0) {
		        // Jump animation
		        sprite_index = sPlayerJump;
		    }	
		}
	}


	InventoryCalculateWeight(oInventory);
	y += yspd;
	
	
	//ladders
	if upKey && isLadder {
		sprite_index = sPlayerLadderClimb;
	} 
	else if isLadder {
		sprite_index = sPlayerLadderIdle;
	}
}

	