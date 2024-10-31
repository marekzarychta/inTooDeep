if isAlive {

	HPManage();

	if place_meeting(x, y, oLadder) {
		isLadder = true;	
	} else {
		isLadder = false;
	}

	//Get inputs
	if !oInventory.opened
		getControls();



	var cratesInRange = []; 
	var horizontalRange = 48;
	var nearestCrate = noone; 
	var shortestDistance = 9999;


	// Modyfing speed and jump multipliers based on weight


	ChangeWeight();

	termVel = termVelValues[currentWeightLevel / 2];

	if yspd > 5.5 {
		can_break_floors = true;	
	} else {
		can_break_floors = false;	
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
	
	with (oBag) {
	    
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
	//Set xspd
	xspd = moveDir * moveSpd[currentWeightLevel];

	//X Collision
		//How close we can get to a wall etc.
	var _subPixel = .5;
	//Check wall collision
	if (place_meeting(x + xspd, y, oWall) || (place_meeting(x + xspd, y, oBreakableWall) && yspd == 0))
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
	
	if upKey && isLadder {
		yspd = -ladderSpd; 	
	} else if downKey && isLadder {
		yspd = ladderSpd;	
	} else if isLadder {
		yspd = 0;	
	}
	
	//If speed would exceed terminal velocity, cap it
	if yspd > termVel {yspd = termVel; };
	
	//Initiate jump
	if upKeyBuffered && jumpCount < jumpMax && onGround && !isLadder
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
    if (can_break_floors && place_meeting(x, y + yspd, oBreakableWall) && yspd > 0) {
        var breakableWall = instance_place(x, y + yspd, oBreakableWall);
        if (breakableWall != noone) {
            with (breakableWall) {
                instance_destroy();
            }
        }
    } else {
        // Move up to wall precisely
        var _pixelCheck = _subPixel * sign(yspd);

        // Move as close to the wall as possible in 0.5px increments
        while !place_meeting(x, y + _pixelCheck, oWall) && !place_meeting(x, y + _pixelCheck, oBreakableWall) {
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
	
//Check if on ground, reset timers
if (yspd == 0 && place_meeting(x, y + 1, oWall)) {
    onGround = true;
    jumpCount = 0;
    jumpHoldTimer = 0;
} else {
    onGround = false;
    // Start jump animation
    if (jumpStartTimer > 0) {
        sprite_index = sPlayerStartJump;
        jumpStartTimer--;
    } else if (yspd > 0) {
        // Fall animation
        sprite_index = sPlayerFall;
    } else if (!onGround && jumpCount > 0) {
        // Jump animation
        sprite_index = sPlayerJump;
    }

    //if (jumpCount == 0) {
    //    jumpCount = 1;
    //}
	
}


	InventoryCalculateWeight(oInventory);
	y += yspd;
}