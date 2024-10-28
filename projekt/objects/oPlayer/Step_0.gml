//Get inputs
if !oInventory.opened
	getControls();



var cratesInRange = []; 
var horizontalRange = 48;
var nearestCrate = noone; 
var shortestDistance = 9999;


// Modyfing speed and jump multipliers based on weight

if(inventoryWeight <= 3) {
	currentWeightLevel = weightLevels[0];
} else if (inventoryWeight <= 6) {
	currentWeightLevel = weightLevels[1];
} else if (inventoryWeight <= 10) {
	currentWeightLevel = weightLevels[2];
} else {
	currentWeightLevel = weightLevels[3];
}


//X Movement

	if place_meeting(x, y, oEnemy) {
		show_debug_message("Kolizja z wrogiem");	
	}

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
	}else if (moveDir ==0 && yspd == 0){
		sprite_index = sPlayerIdle;
	}
	//Set xspd
	xspd = moveDir * moveSpd[currentWeightLevel];

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

	//Move x
	x += xspd;
	
//Y Movement
	//Gravity
	yspd += grav;
	
	//If speed would exceed terminal velocity, cap it
	if yspd > termVel {yspd = termVel; };
	
	//Initiate jump
	if upKeyBuffered && jumpCount < jumpMax
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

    if (jumpCount == 0) {
        jumpCount = 1;
    }
	
}

	
	InventoryCalculateWeight(oInventory);
	y += yspd;
	