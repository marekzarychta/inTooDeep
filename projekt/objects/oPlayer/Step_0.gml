// So basically this drops towards 0 every frame to make a 60 frames cooldown
// 0 means we can attack and then it resets back to whatever cooldown is set to

//if(hitbox_delay > 0) {
	//hitbox_delay -= 1;
//}

if(debug_mode){
getControls();

if (keyboard_check_pressed(ord("N"))) {
    noclip = !noclip; // Przełącz tryb noclip
    if (noclip) {
		isAlive = false;
        show_debug_message("Noclip: ON");
    } else {
		isAlive = true;
        show_debug_message("Noclip: OFF");
    }
}
}

if (noclip) {
		var multiplier = 1;
		if(keyboard_check(vk_shift)) multiplier = 2;
		image_alpha = 0.5; // Gracz półprzezroczysty w trybie noclip
	    // Swobodne poruszanie się w trybie noclip
	    if (rightKey) xspd = 2.5 * multiplier;
	    if (leftKey) xspd = -2.5 * multiplier;
		if ((rightKey - leftKey) == 0) xspd = 0;
	    if (upKey) yspd = -2.5 * multiplier;
	    if (downKey) yspd = 2.5 * multiplier;
		if ((upKey - downKey) == 0) yspd = 0;
	
		x+=xspd;
		y+=yspd;
}
else{
image_alpha = 1; // Normalny wygląd

if isAlive {

	HPManage();
	
	InventoryCalculateWeight(oInventory);
	
	

	//Get inputs
	if !oInventory.opened
		getControls();
		
	else {
		rightKey = 0;	
		leftKey = 0;	
	}

	if (attackCooldownTimer > 0) {
		attackCooldownTimer--;
	
	}

	// We perform an attack in the cooldown ends, we are on the ground and we press left mouse button
	if (attackCooldownTimer == 0 && mouse_check_button_pressed(mb_left) && !oInventory.opened && !isLadder) {
	
		// Call the attack function from the combat_functions script
		audio_play_sound(snd_axe,0,false);
		if (mouse_x > x) {
			attackDir = 1;
		} else {
			attackDir = -1;	
		}
		
		
		//if(keyboard_check_pressed(vk_left)) {
		//	attackDir = -1;
		//} else if (keyboard_check_pressed(vk_right)) {
		//	attackDir = 1;
		//}
		
		attackingTimer = 40;
		image_index = 0;
		// And reset the timer to cooldown value
		attackCooldownTimer = attackCooldown;
	
	}

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
	//	//show_debug_message("Kolizja z wrogiem");	
	//}

	//Direction not changing when dashing
	if !isDashing {
		moveDir = rightKey - leftKey;
	} else {
		moveDir = face;	
	}

	if moveDir != 0 {
		face = moveDir;
	}

if (sprite_index == sPlayerRun) {
	
    if(floor(image_index) == 1 || floor(image_index) == 7){
		if(!audio_is_playing(snd_playerland)){
        audio_play_sound(snd_playerland, 0, false);
		}
	}
}

	with (oChest) {
	    
		//Checking if chest is in range
		
	    if (abs(other.x - x) <= horizontalRange  && abs(other.y - y) <= 2) {
	        // Adding chest to array
	        array_push(cratesInRange, id);
	    }
	}
	
	with (oCart) {
	    
		//Checking if cart is in range
		
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
		image_xscale = face;
		if(yspd==0){
		//Change movement animation based on weight
		sprite_index = movementSprites[currentWeightLevel];
		//Move slower at certain weights
		//if (currentWeightLevel == 4 || currentWeightLevel == 1){
		//	image_speed = 0.75;
		//}else{
		//	image_speed = 1;
		//}
		}
	} else if (moveDir == 0 && yspd == 0) {
		sprite_index = sPlayerIdle;
	}

	
	
	//Set xspd with smoothing and dash
	if (isDashing) {
		xspd = moveDir * (moveSpd[currentWeightLevel] + dashAddSpd);//smooth(xspd, moveDir * (moveSpd[currentWeightLevel] + dashAddSpd));
	} else {
		if abs(xspd) <= moveSpd[currentWeightLevel] && moveDir != 0 {
			xspd = smooth(xspd, moveDir * moveSpd[currentWeightLevel], 0.91);
		} else if moveDir == 0 {
			xspd = smooth(xspd, moveDir * moveSpd[currentWeightLevel], 0.86);
		} else {
			xspd = moveDir * moveSpd[currentWeightLevel];
		}
	}
	
	//var cart = instance_place(x, y + 2, oCart);
	//if (cart != noone) {
	//	if (cart.xspd != 0) {
	//		x += cart.xspd;
	//	}
	//}
	
	//X Collision
		//How close we can get to a wall etc.
	var _subPixel = .5;
	
	if (place_meeting(x + xspd, y, oBreakableWallOrange) && dashTimer > 0) {
	    var b = instance_place(x + xspd, y, oBreakableWallOrange);
	    if (b != noone) {
	        if (currentWeightLevel >= 2 && abs(xspd) >= moveSpd[currentWeightLevel] + 0.1) {
	            with (b) {
	                instance_destroy();
	            }
	        } else {
	            // Check if there is already an instance of oTextbox in the same spot
	            if (!instance_exists(oTextboxPlayer)) {
					//show_debug_message("x");
	                createFollowingTextbox(x-16, y-16, "i need more weight");
	            }
	        }
	    }
	}
	if (place_meeting(x + xspd, y, oBreakableWallRed) && dashTimer > 0) {
	    var b = instance_place(x + xspd, y, oBreakableWallRed);
	    if (b != noone) {
	        if (currentWeightLevel >= 3 && abs(xspd) >= moveSpd[currentWeightLevel] + 0.1) {
	            with (b) {
	                instance_destroy();
	            }
	        } else {
	            // Check if there is already an instance of oTextbox in the same spot
	            if (!instance_exists(oTextboxPlayer)) {
					//show_debug_message("x");
	                createFollowingTextbox(x-16, y-16, "i need more weight");
	            }
	        }
	    }
	}

	//if (place_meeting(x + xspd, y, oCart)) {
	//	var cart = instance_place(x + xspd, y, oCart);
	//    if (cart != noone) {
	//		cart.vel = abs(xspd);
	//		cart.moveDir = moveDir;
	//	}
	//}
	if (place_meeting(x + xspd, y, oBox) && isDashing) {
		var box = instance_place(x + xspd, y, oBox);
	    if (box != noone) {
			box.moveDir = moveDir;
			
			box.moveTimer = 0;
			dashTimer = 0;
		}
	}
	
	//Check wall collision
	var obj = instance_place(x + xspd, y, oDoor);
	if  (place_meeting(x + xspd, y, oDoor) && !obj.opened) {
		var _pixelCheck = _subPixel * sign(xspd);
	
		//Move as close to the wall as possible in 0.5px increments
		while !place_meeting(x+_pixelCheck, y, oDoor)
		{
			x += _pixelCheck;
		}
	
		if (!instance_exists(oTextboxPlayer)) {
	        createFollowingTextbox(x - 16, y - 16, "this opens somewhere else");
	    }
		//Stop movement to collide
		xspd = 0;	
		isBlocked = true;
	} else {
		isBlocked = false;	
	}
	
	
	
	if (place_meeting(x + xspd, y, oWall)) // || (place_meeting(x + xspd, y, oBreakableWallOrange) && yspd == 0)
	{
		checkingForSlopes(id);
		isBlocked = true;
	} else {
		isBlocked = false;	
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
	if topLadder {
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
	if upKeyBuffered && jumpCount < jumpMax && onGround && !isDashing
	{
		//Reset the buffer
		upKeyBuffered = false;
		upKeyBufferTimer = 0;
		
		audio_play_sound(snd_jump, 0, false);
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
	
	if (place_meeting(x, y + yspd, oEnemyParent) && can_break_orange) {
		var enemy = instance_place(x, y + yspd, oEnemyParent);
		//show_debug_message("tak")
		with (enemy) {
			health_points = 0;
		}
	}
	obj = instance_place(x, y + yspd, oDoor);
	
	if (place_meeting(x, y + yspd, oDoor) && !obj.opened) {
		var _pixelCheck = _subPixel * sign(yspd);

		// Move as close to the wall as possible in 0.5px increments
		while !place_meeting(x, y + _pixelCheck, oDoor) {
			y += _pixelCheck;
		}

		// Bonk
		if (yspd < 0) {
			jumpHoldTimer = 0;
		}

		// Stop movement to collide
		yspd = 0;
	}
	
	
	// Check wall collision
	if (place_meeting(x, y + yspd, oWall)) {
	    if (can_break_orange && place_meeting(x, y + yspd, oBreakableWallOrange) && yspd > 0) {
	        var breakableWall = instance_place(x, y + yspd, oBreakableWallOrange);
	        if (breakableWall != noone) {
	            with (breakableWall) {
	                instance_destroy();
	            }
	        }
	    } 
		if (can_break_red && place_meeting(x, y + yspd, oBreakableWallRed) && yspd > 0) {
	        var breakableWall = instance_place(x, y + yspd, oBreakableWallRed);
	        if (breakableWall != noone) {
	            with (breakableWall) {
	                instance_destroy();
	            }
	        }
	    } 
	}
	
	
	if (place_meeting(x, y + yspd, oWall)) {
		
		var wall = instance_nearest(x,y,oWall);
		show_debug_message("player y: "+string(y)+"; floor y: "+string(wall.y));
	
	    // Move up to wall precisely
	    var _pixelCheck = _subPixel * sign(yspd);

	    // Move as close to the wall as possible in 0.5px increments
	    while !place_meeting(x, y, oWall) {
	        y += _pixelCheck;
	    }
		show_debug_message("new y: "+string(y));
	    // Bonk
	    if (yspd < 0) {
	        jumpHoldTimer = 0;
	    }
	    // Stop movement to collide
	    yspd = 0;  // Setting yspd to 0 only when truly colliding

		
	}

	//checking is player on ladder
	if place_meeting(x, y, oLadder) && (upKey || downKey) && !isDashing {
		isLadder = true;	
		topLadder = false;
	} 
	if !place_meeting(x, y, oLadder) {
		isLadder = false;
		topLadder = false;
	}
	
	//if place_meeting(x, y + 2, oLadder) && isLadder && !place_meeting(x, y, oLadder) {
	//	isLadder = false;
	//	topLadder = true;
	//}
	
	if !isLadder && yspd == 0 && onGround && moveDir != 0 && dashKey && dashCooldownTimer <= 0 && !isDashing { //if player is on ground and dont touching ladder start dash
   
		dashTimer = dashBuffer;
	}
	
	
	//if !downKey
	
	//if !downKey && isDashing {
	//	dashTimer = 0;	
	//}
	
	if dashTimer > 0 {
		dashTimer--;	
		isDashing = true;
		hasDashed = true;

	} else if dashTimer == 0 {
		isDashing = false;
		dashTimer--;
		dashCooldownTimer = dashCooldown;	
		if (hasDashed && !instance_exists(oDashCooldownBar)) { // Pasek tworzy się tylko po dashu
        var cooldownBar = instance_create_depth(x, y, -10, oDashCooldownBar);
    }
		if(debug_mode) show_debug_message("dash cooldown");
		
	}
	
	if dashCooldownTimer > 0 {
		dashCooldownTimer--;	
	} else if dashCooldownTimer == 0 {
		dashCooldownTimer--;
		if(debug_mode) show_debug_message("dash rdy");	
	}
	
	//checking top ladder
	
	y += yspd;
	
	if (!place_meeting(x, y, oLadder) && place_meeting(x, y + 1, oLadder) && !topLadder && !downKey) {
	    
		var _subPixel = 0.5;
		
	    // Move up to wall precisely
	    var _pixelCheck = _subPixel;

	    // Move as close to the wall as possible in 0.5px increments
	    while !place_meeting(x, y + _pixelCheck, oLadder) {
	        y += _pixelCheck;
	    }

	    // Stop movement to collide
		isLadder = false;
		topLadder = true;
	    yspd = 0;  // Setting yspd to 0 only when truly colliding
	}
	

	
	//Check if on ground, reset timers
	if ((yspd == 0 && (place_meeting(x, y + 1, oWall) || place_meeting(x, y + 1, oDoor))) || (yspd == 0 && topLadder)) {
		if (wasMidair && !audio_is_playing(snd_playerland)) {
	        // Odtwarzamy dźwięk tylko przy pierwszym kontakcie z ziemią
	        audio_play_sound(snd_playerland, 0, false);
	    }
		onGround = true;
		wasMidair = false;
	    jumpCount = 0;
	    jumpHoldTimer = 0;
	} else {
	    onGround = false;
		wasMidair = true;
	    // Start jump animation
	    if (jumpStartTimer > 0) {
	        jumpStartTimer--;
	    } 

		if !isLadder && !isDashing && attackingTimer == 0 {
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


	
	
	
	if isDashing {
		sprite_index = sPlayerDash;
	}
	
	//ladders
	if upKey && isLadder {
		sprite_index = sPlayerLadderClimb;
	} 
	else if isLadder {
		sprite_index = sPlayerLadderIdle;
	}
	if timerEnemyHit > 0 {
		sprite_index = sPlayerGotHit;	
	}
	
	if attackingTimer > 0 {
		image_xscale = attackDir;
		if(sprite_index != sPlayerAttack){
		sprite_index = sPlayerAttack;
		}
		if image_index == 2 {
			attack();	
		}
		attackingTimer--;
	}
} else if isdying {
	instance_destroy(backpack);
	if(sprite_index !=sPlayerDying){
	sprite_index = sPlayerDying;
	}
	if image_index >= image_number  {
		isdying = false;	
	}
} else if !isAlive{
	//trzeba zmienic sprite na lezacego
	sprite_index = sPlayerDead;	
}

if reviveTimer == 0 && !isAlive {
	reviveTimer = reviveBuffer;	
}

if reviveTimer > 0 && !isAlive {
	reviveTimer--;
	if reviveTimer == 0 {
		event_perform(ev_keypress, vk_enter);	
	}	
}
}

