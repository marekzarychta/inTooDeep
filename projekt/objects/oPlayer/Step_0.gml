// So basically this drops towards 0 every frame to make a 60 frames cooldown
// 0 means we can attack and then it resets back to whatever cooldown is set to

//if(hitbox_delay > 0) {
	//hitbox_delay -= 1;
//}
if (currentState != states.DEATH) {
	
	if (isActive) {
		getControls();
	}
	else {
		rightKey = 0;	
		leftKey = 0;	
	}
	
	moveDir = rightKey - leftKey;
	if (moveDir != 0) {
		face = moveDir;
	}
	
	//kolejnosc przejsc stanow jest bardzo wazna, bo moga sie nadpisywac
	if (currentState == states.IDLE) {
		#region IDLE_BEHAVIOUR
		var _subPixel = 0.5;
		xspd = smooth(xspd, 0, 0.86);
		
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
		}
	
	
	
		if (place_meeting(x + xspd, y, oWall))
		{
			checkingForSlopes(id);
		} 

		checkingForSlopesGoingDown(id);
		
		x += xspd;
		
		yspd += grav;
		
		//sprawdzanie kolizji
		if (place_meeting(x, y + yspd, oWall)) {
			
		    // Move as close to the wall as possible in 0.5px increments
		    while !place_meeting(x, y + _subPixel, oWall) {
		        y += _subPixel;
		    }
		    // Stop movement to collide
		    yspd = 0;  // Setting yspd to 0 only when truly colliding

		}
		
		if (place_meeting(x, y + 1, oLadder) && !downKey && abs(axisY<=0.5)) {
	    
		    // Move as close to the wall as possible in 0.5px increments
		    while !place_meeting(x, y + _subPixel, oLadder) {
		        y += _subPixel;
		    }

		    yspd = 0; 
		}
		
		obj = instance_place(x, y + yspd, oDoor);
	
		if (place_meeting(x, y + yspd, oDoor) && !obj.opened) {
			
			// Move as close to the wall as possible in 0.5px increments
			while !place_meeting(x, y + _subPixel, oDoor) {
				y += _subPixel;
			}

			// Stop movement to collide
			yspd = 0;
		}
		
		//przejscia w inne stany
		if (moveDir != 0) {
			currentState = states.WALK;
		}
		if (place_meeting(x, y, oLadder) && (upKey || downKey || (abs(axisY) > 0.5))) {
			currentState = states.LADDERIDLE;
		}
		if (yspd > 0) {
			currentState = states.FALL;
		}
		if (jumpKeyBuffered && jumpCount < jumpMax) {
			currentState = states.JUMP;
		}
		if (attackCooldownTimer == 0 && attackKey) {
			currentState = states.ATTACK;	
		}
		if (current_health <= 0) {
			currentState = states.DYING;	
		}
		
		
		sprite_index = sprites[states.IDLE];
		image_speed = 1;
		
		#endregion IDLE_BEHAVIOUR
	} else if (currentState = states.WALK) {
		#region	WALK_BEHAVIOUR
		
		var _subPixel = 0.5;
		xspd = smooth(xspd, moveDir * moveSpd[currentWeightLevel], 0.92);
		
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
		}
	
		if (place_meeting(x + xspd, y, oWall))
		{
			checkingForSlopes(id);
		} 

		checkingForSlopesGoingDown(id);
		
		x += xspd;
		yspd += grav;
		//sprawdzanie kolizji
		if (place_meeting(x, y + yspd, oWall)) {
			
		    // Move as close to the wall as possible in 0.5px increments
		    while !place_meeting(x, y + _subPixel, oWall) {
		        y += _subPixel;
		    }
		    // Stop movement to collide
		    yspd = 0;  // Setting yspd to 0 only when truly colliding

		}
		
		if (place_meeting(x, y + 1, oLadder) && !downKey && abs(axisY<=0.5)) {
	    
		    // Move as close to the wall as possible in 0.5px increments
		    while !place_meeting(x, y + _subPixel, oLadder) {
		        y += _subPixel;
		    }

		    yspd = 0; 
		}
		
		obj = instance_place(x, y + yspd, oDoor);
	
		if (place_meeting(x, y + yspd, oDoor) && !obj.opened) {
			
			// Move as close to the wall as possible in 0.5px increments
			while !place_meeting(x, y + _subPixel, oDoor) {
				y += _subPixel;
			}

			// Stop movement to collide
			yspd = 0;
		}
		
		//przejscia w inne stany
		if (attackCooldownTimer == 0 && attackKey) {
			currentState = states.ATTACK;	
		}
		if (jumpKeyBuffered && jumpCount < jumpMax) {
			currentState = states.JUMP;
		}
		if (yspd > 0) {
			currentState = states.FALL;
		}
		if (dashKey && dashCooldownTimer <= 0) {
			currentState = states.DASH;	
		}
		if (moveDir == 0) {
			currentState = states.IDLE;	
		}
		if (place_meeting(x, y, oLadder) && (upKey || downKey || (abs(axisY) > 0.5))) {
			currentState = states.LADDERIDLE;	
		}
		if (current_health <= 0) {
			currentState = states.DYING;	
		}
		
		sprite_index = sprites[states.WALK][currentWeightLevel];
		image_xscale = face;
		
		//Change movement animation based on weight
		sprite_index = movementSprites[currentWeightLevel];
		//Move slower at certain weights
		if (currentWeightLevel == 3 || currentWeightLevel == 1) {
			image_speed = clamp(abs(xspd)/moveSpd[currentWeightLevel], 0, 0.75);
		} else{
			image_speed = clamp(abs(xspd)/moveSpd[currentWeightLevel], 0, 1);
		}

		
		
		
		#endregion WALK_BEHAVIOUR
	} else if (currentState == states.FALL) {
		#region	FALL_BEHAVIOUR
		
		var _subPixel = 0.5;
		xspd = smooth(xspd, moveDir * moveSpd[currentWeightLevel], 0.92);
		
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
		}
	
	
	
		if (place_meeting(x + xspd, y, oWall))
		{
			checkingForSlopes(id);
		} 

		checkingForSlopesGoingDown(id);
		
		x += xspd;
		
		yspd += grav;
		
		if currentWeightLevel < 2 {
			termVel = termVelValues[0];
		} else {
			termVel = termVelValues[currentWeightLevel - 1]; // 2 and 3 -> 1 and 2
		}
		
		if (yspd > termVel) {
			yspd = termVel; 
		}
		
		//sprawdzanie kolizji
		if (place_meeting(x, y + yspd, oWall)) {
			
		    // Move as close to the wall as possible in 0.5px increments
		    while !place_meeting(x, y + _subPixel, oWall) {
		        y += _subPixel;
		    }
		    // Stop movement to collide
		    yspd = 0;  // Setting yspd to 0 only when truly colliding

		}
		
		if (place_meeting(x, y + 1, oLadder) && !downKey && abs(axisY<=0.5)) {
	    
		    // Move as close to the wall as possible in 0.5px increments
		    while !place_meeting(x, y + _subPixel, oLadder) {
		        y += _subPixel;
		    }

		    yspd = 0; 
		}
		
		obj = instance_place(x, y + yspd, oDoor);
	
		if (place_meeting(x, y + yspd, oDoor) && !obj.opened) {
			
			// Move as close to the wall as possible in 0.5px increments
			while !place_meeting(x, y + _subPixel, oDoor) {
				y += _subPixel;
			}

			// Stop movement to collide
			yspd = 0;
		}
		
		y += yspd;
		
		//przejscia w inne stany
		
		if (attackCooldownTimer == 0 && attackKey) {
			currentState = states.ATTACK;	
		}
		if (jumpKeyBuffered && jumpCount < jumpMax) {
			currentState = states.JUMP;
		}
		if (yspd == 0) {
			currentState = states.IDLE;	
		}
		if (xspd != 0) {
			currentState = states.WALK;	
		}
		if (place_meeting(x, y, oLadder) && (upKey || downKey || (abs(axisY) > 0.5))) {
			currentState = states.LADDERIDLE;	
		}
		if (yspd < 0) {
			currentState = states.FLYING;	
		}
		if (current_health <= 0) {
			currentState = states.DYING;	
		}
		
		sprite_index = sprites[states.FALL];
		
		#endregion FALL_BEHAVIOUR
	} else if (currentState == states.LADDERIDLE) {
		#region	LADDERIDLE_BEHAVIOUR
		
		//przejscia w inne stany
		
		if (current_health <= 0) {
			currentState = states.DYING;	
		}
		if ((upKey || downKey) && place_meeting(x, y, oLadder)) {
			currentState = states.LADDERCLIMB;	
		}
		if (yspd > 0 && !place_meeting(x, y, oLadder)) {
			currentState = states.FALL;	
		}
		if (yspd == 0 && !place_meeting(x, y, oLadder)) {
			currentState = states.WALK;
		}
		
		
		#endregion LADDERIDLE_BEHAVIOUR
	} else if (currentState == states.LADDERCLIMB) {
		#region	LADDERCLIMB_BEHAVIOUR
		
		//przejscia w inne stany
		
		if (current_health <= 0) {
			currentState = states.DYING;	
		}
		if ((!upKey && !downKey) && place_meeting(x, y, oLadder)) {
			currentState = states.LADDERIDLE;	
		}
		if (yspd > 0 && !place_meeting(x, y, oLadder)) {
			currentState = states.FALL;	
		}
		if (yspd == 0 && !place_meeting(x, y, oLadder)) {
			currentState = states.WALK;
		}
		
		
		#endregion LADDERCLIMB_BEHAVIOUR
	} else if (currentState == states.DASH) {
		#region	DASH_BEHAVIOUR
		
		//przejscia w inne stany
		
		if (current_health <= 0) {
			currentState = states.DYING;	
		}
		if (yspd > 0 && dashTimer == 0) {
			currentState = states.FALL;	
		}
		if (dashTimer == 0 && yspd == 0) {
			currentState = states.WALK;
		}
		if (attackCooldown == 0 && attackKey) {
			currentState = states.ATTACK;	
		}
		
		
		#endregion DASH_BEHAVIOUR
	} else if (currentState == states.DYING) {
		#region	DYING_BEHAVIOUR
		
		//przejscia w inne stany
		
		if (image_index >= image_number - 1) {
			currentState = states.DEATH;	
		}
		
		
		#endregion DYING_BEHAVIOUR
	
	} else if (currentState == states.ATTACK) {
		#region	ATTACK_BEHAVIOUR
		
		//przejscia w inne stany
		
		if (current_health <= 0) {
			currentState = states.DYING;	
		}
		if (dashKey && dashCooldownTimer <= 0) {
			currentState = states.DASH;	
		}
		if (xspd == 0) {
			currentState = states.IDLE;
		}
		if (xspd != 0) {
			currentState = states.WALK;
		}
		if (yspd > 0) {
			currentState = states.FALL;	
		}
		
		#endregion ATTACK_BEHAVIOUR
	} else if (currentState == states.JUMP) {
		#region	JUMP_BEHAVIOUR
		
		//przejscia w inne stany
		
		if (current_health <= 0) {
			currentState = states.DYING;	
		}
		if (jumpStartTimer == 0 && jumpCount > 0) {
			currentState = states.FLYING;	
		}
		if (yspd > 0) {
			currentState = states.FALL;	
		}
		
		#endregion JUMP_BEHAVIOUR
	} else if (currentState == states.FLYING) {
		#region	FLYING_BEHAVIOUR
		
		//przejscia w inne stany
		
		if (current_health <= 0) {
			currentState = states.DYING;	
		}
		if (yspd > 0) {
			currentState = states.FALL;	
		}
		
		#endregion FLYING_BEHAVIOUR
	}
} else {
	
	rightKey = 0;	
	leftKey = 0;	
	
}






//if(debug_mode){
//getControls();

//if (keyboard_check_pressed(ord("N"))) {
//    noclip = !noclip; // Przełącz tryb noclip
//    if (noclip) {
//		isAlive = false;
//        show_debug_message("Noclip: ON");
//    } else {
//		isAlive = true;
//        show_debug_message("Noclip: OFF");
//    }
//}
//}


//if (noclip) {
//		var multiplier = 1;
//		if(dashKey) multiplier = 2;
//		image_alpha = 0.5; // Gracz półprzezroczysty w trybie noclip
//	    // Swobodne poruszanie się w trybie noclip
//		 xspd = 2.5 * multiplier * (rightKey - leftKey + axisX);
//		 yspd = 2.5 * multiplier * (downKey - upKey + axisY);
	
//		x+=xspd;
//		y+=yspd;
//}
//else{
//image_alpha = 1; // Normalny wygląd
//}
//if isAlive {
	
//	HPManage(); //pamietac
	
//	InventoryCalculateWeight(oInventory); //pamietac
	
//	//przywrócenie predkosci po dashu
//	if (!isDashing && dashCooldownTimer == dashCooldown - 1) {
//		xspd = xspdTemp;
//	}

//	//Get inputs
//	if !oInventory.opened && isActive 
//	{
//		getControls();
//		window_set_cursor(cr_none);
//	}
//	else {
//		rightKey = 0;	
//		leftKey = 0;	
//	}

//	if (attackCooldownTimer > 0) {
//		attackCooldownTimer--;
	
//	}

//if(useKey){
//	isInteracting = true;
//}else{
//	isInteracting = false;
//}
//	// We perform an attack in the cooldown ends, we are on the ground and we press left mouse button
//	if (attackCooldownTimer == 0 && attackKey && !oInventory.opened && !isLadder) {
	
//		// Call the attack function from the combat_functions script
		
//		attackDir = face;
//		audio_play_sound(snd_axe,0,false);
		
		
//		//if(keyboard_check_pressed(vk_left)) {
//		//	attackDir = -1;
//		//} else if (keyboard_check_pressed(vk_right)) {
//		//	attackDir = 1;
//		//}
		
//		attackingTimer = 40;
//		image_index = 0;
//		// And reset the timer to cooldown value
//		attackCooldownTimer = attackCooldown;
	
//	}

//	var cratesInRange = []; 
//	var horizontalRange = 48;
//	var nearestCrate = noone; 
//	var shortestDistance = 9999;


	

//	// Modyfing speed and jump multipliers based on weight

//	ChangeWeight();

//	if currentWeightLevel < 2 {
//		termVel = termVelValues[0];
//	} else {
//		termVel = termVelValues[currentWeightLevel - 1]; // 2 and 3 -> 1 and 2
//	}

//	if yspd > 5.5 {
//		can_break_red = true;	
//	} else {
//		can_break_red = false;	
//	}
	
//	if yspd > 4.5 {
//		can_break_orange = true;	
//	} else {
//		can_break_orange = false;	
//	}
////X Movement

//	//if place_meeting(x, y, oEnemy) {
//	//	//show_debug_message("Kolizja z wrogiem");	
//	//}

//	//Direction not changing when dashing
//	if !isDashing {
//		if(axisX == 0) moveDir = rightKey - leftKey;
//		else moveDir = sign(axisX);
//	} else {
//		moveDir = face;	
//	}

//	if moveDir != 0 {
//		face = sign(moveDir);
//	}

//if (sprite_index == sPlayerRun) {
	
//    if(floor(image_index) == 1 || floor(image_index) == 7){
//		if(!audio_is_playing(snd_playerstep) && !audio_is_playing(snd_playerland)){
//        audio_play_sound(snd_playerstep, 0, false);
//		}
//	}
//}

//	with (oChest) {
	    
//		//Checking if chest is in range
		
//	    if (abs(other.x - x) <= horizontalRange  && abs(other.y - y) <= 2) {
//	        // Adding chest to array
//	        array_push(cratesInRange, id);
//	    }
//	}
	
//	with (oCart) {
	    
//		//Checking if cart is in range
		
//	    if (abs(other.x - x) <= horizontalRange  && abs(other.y - y) <= 2) {
//	        // Adding chest to array
//	        array_push(cratesInRange, id);
//	    }
//	}
		
//	for (var i = 0; i < array_length(cratesInRange); i++) {
//	    var crate = cratesInRange[i];
    
//	    // Caluclating distance
//	    var dist = abs(crate.x - x);
    
//	    // Finding shortes distance and chest id
//	    if (dist < shortestDistance) {
//	        nearestCrate = crate;
//	        shortestDistance = dist;
//	    }
//	}
//	//setting id nearest chest
//	chestId = nearestCrate;
	
//	//Flip horizontally according to movement direction
	
	
//		//Get xspd
//	if moveDir != 0
//	{
//		image_xscale = face;
//		if(yspd==0){
//		//Change movement animation based on weight
//		sprite_index = movementSprites[currentWeightLevel];
//		//Move slower at certain weights
//			if (currentWeightLevel == 3 || currentWeightLevel == 1) {
//				image_speed = clamp(abs(xspd)/moveSpd[currentWeightLevel], 0, 0.75);
//			} else{
//				image_speed = clamp(abs(xspd)/moveSpd[currentWeightLevel], 0, 1);
//			}

//		}
		
//	} else if (moveDir == 0 && yspd == 0) {
//		sprite_index = sPlayerIdle;
//		image_speed = 1;
//	}
	
	
	
//if (!isDashing) {
//    if (gamepad_is_connected(0)) { 
//        // Sterowanie za pomocą pada
//        if (abs(axisX) > 0) {
//            // Analogowy stick
//            xspd = smooth(xspd, axisX * moveSpd[currentWeightLevel], 0.92);
//        } else if (rightKey || leftKey) {
//            // D-Pad
//            xspd = smooth(xspd, moveDir * moveSpd[currentWeightLevel], 0.92);
//        } else {
//            // Neutralna pozycja
//            xspd = smooth(xspd, 0, 0.86);
//        }
//    } else { 
//        // Sterowanie za pomocą klawiatury
//        if (rightKey - leftKey != 0) {
//            xspd = smooth(xspd, moveDir * moveSpd[currentWeightLevel], 0.92);
//        } else {
//            xspd = smooth(xspd, 0, 0.86);
//        }
//    }
//}

	
//	//var cart = instance_place(x, y + 2, oCart);
//	//if (cart != noone) {
//	//	if (cart.xspd != 0) {
//	//		x += cart.xspd;
//	//	}
//	//}
	
//	//X Collision
//		//How close we can get to a wall etc.
//	var _subPixel = .5;
	
	
	
//	//Handle breakable walls
//	var breakableWalls = [
//    { wall: oBreakableWallOrange, weight: 2, message: "i need more weight" },
//    { wall: oBreakableWallRed, weight: 3, message: "i need more weight" }
//];
	
//	for (var i = 0; i < array_length(breakableWalls); i++) {
//	    var wall_info = breakableWalls[i];
//	    var wall_obj = wall_info.wall;
//	    var required_weight = wall_info.weight;
//	    var message = "i need more weight";

//	    if (place_meeting(x + sign(xspd), y, wall_obj) && dashTimer > 0) {
//	        var b = instance_place(x + sign(xspd), y, wall_obj);
//	        if (b != noone) {
//	            if (currentWeightLevel >= required_weight) {
//	                with (b) {
//	                    instance_destroy();
//	                }
//	            } else if currentWeightLevel < required_weight {
//	                if (!instance_exists(oTextboxPlayer)) {
//	                    createFollowingTextbox(x - 16, y - 16, message);
//	                }
//	            }
//	        }
//	    }
//	}


//	//if (place_meeting(x + xspd, y, oCart)) {
//	//	var cart = instance_place(x + xspd, y, oCart);
//	//    if (cart != noone) {
//	//		cart.vel = abs(xspd);
//	//		cart.moveDir = moveDir;
//	//	}
//	//}
//	if (place_meeting(x + xspd, y, oBox) && isDashing) {
//		var box = instance_place(x + xspd, y, oBox);
//	    if (box != noone) {
//			box.moveDir = sign(moveDir);
			
//			box.moveTimer = 0;
//			dashTimer = 0;
//		}
//	}
	
//	//Check wall collision
//	var obj = instance_place(x + xspd, y, oDoor);
//	if  (place_meeting(x + xspd, y, oDoor) && !obj.opened) {
//		var _pixelCheck = _subPixel * sign(xspd);
	
//		//Move as close to the wall as possible in 0.5px increments
//		while !place_meeting(x+_pixelCheck, y, oDoor)
//		{
//			x += _pixelCheck;
//		}
	
//		if (!instance_exists(oTextboxPlayer)) {
//	        createFollowingTextbox(x - 16, y - 16, "this opens somewhere else");
//	    }
//		//Stop movement to collide
//		xspd = 0;	
//		isBlocked = true;
//	} else {
//		isBlocked = false;	
//	}
	
	
	
//	if (place_meeting(x + xspd, y, oWall)) // || (place_meeting(x + xspd, y, oBreakableWallOrange) && yspd == 0)
//	{
//		checkingForSlopes(id);
//		isBlocked = true;
//	} else {
//		isBlocked = false;	
//	}

//	checkingForSlopesGoingDown(id);

//	//Move x
//	x += xspd;
	
////Y Movement
//	//Gravity
	
//	if isLadder {
//		grav = 0; 	
//	} else {
//		grav = .163;	
//	}
//	if topLadder {
//		grav = 0;	
//	} else {
//		grav = .163;	
//	}
	
//	yspd += grav;
	
//	// Ladders
//	    // Sterowanie za pomocą klawiatury
//	    if ((upKey || axisY <0) && isLadder) {
//	        yspd = -ladderSpd; // Wspinaczka do góry
//	    } else if ((downKey || axisY > 0) && isLadder) {
//	        yspd = ladderSpd; // Zejście na dół
//	    } else if (isLadder) {
//	        yspd = 0;
//	        if (currentWeightLevel == 3) {
//	            yspd = weightLadderSlip; // Ślizganie się przy maksymalnym obciążeniu
//	        }
//	    }
	
	
//	//If speed would exceed terminal velocity, cap it
//	if yspd > termVel {yspd = termVel; };
	
//	//Initiate jump - cannot jump on ladders
//	if jumpKeyBuffered && jumpCount < jumpMax && onGround && !isDashing
//	{
//		//Reset the buffer
//		jumpKeyBuffered = false;
//		jumpKeyBufferTimer = 0;
		
//		audio_play_sound(snd_jump, 0, false);
//		//Add jump to count
//		jumpCount++;
//		jumpStartTimer = jumpDuration;
		
//		//Set jump hold timer
//		jumpHoldTimer = jumpHoldFrames[jumpCount-1];
		
//	}
	
//	//cut off jump
//	if !jumpKey{
//		jumpHoldTimer = 0;	
//	}
//	//jump based on timer
//	if jumpHoldTimer > 0{
//		yspd = jspd[jumpCount-1][currentWeightLevel];
//		//Count down timer
//		jumpHoldTimer--;
//	}

//	//Y Collision
//	var _subPixel = .5;
	
//	if (place_meeting(x, y + yspd, oEnemyParent) && currentWeightLevel >= 2 && yspd > 3) {
//		var enemy = instance_place(x, y + yspd, oEnemyParent);
//		//show_debug_message("tak")
//		with (enemy) {
//			health_points = 0;
//		}
//		if (enemy.isAlive) {
//			yspd = -2;
//		}
//	}
//	obj = instance_place(x, y + yspd, oDoor);
	
//	if (place_meeting(x, y + yspd, oDoor) && !obj.opened) {
//		var _pixelCheck = _subPixel * sign(yspd);

//		// Move as close to the wall as possible in 0.5px increments
//		while !place_meeting(x, y + _pixelCheck, oDoor) {
//			y += _pixelCheck;
//		}

//		// Bonk
//		if (yspd < 0) {
//			jumpHoldTimer = 0;
//		}

//		// Stop movement to collide
//		yspd = 0;
//	}
	
	
//	// Check wall collision
//	if (place_meeting(x, y + yspd, oWall)) {
//	    if (can_break_orange && place_meeting(x, y + yspd, oBreakableWallOrange) && yspd > 0) {
//	        var breakableWall = instance_place(x, y + yspd, oBreakableWallOrange);
//	        if (breakableWall != noone) {
//	            with (breakableWall) {
//	                instance_destroy();
//	            }
//	        }
//	    } 
//		if (can_break_red && place_meeting(x, y + yspd, oBreakableWallRed) && yspd > 0) {
//	        var breakableWall = instance_place(x, y + yspd, oBreakableWallRed);
//	        if (breakableWall != noone) {
//	            with (breakableWall) {
//	                instance_destroy();
//	            }
//	        }
//	    } 
//	}
	
	
//	if (place_meeting(x, y + yspd, oWall)) {
		
	
//	    // Move up to wall precisely
//	    var _pixelCheck = _subPixel * sign(yspd);

//	    // Move as close to the wall as possible in 0.5px increments
//	    while !place_meeting(x, y + _pixelCheck, oWall) {
//	        y += _pixelCheck;
//	    }
//	    // Bonk
//	    if (yspd < 0) {
//	        jumpHoldTimer = 0;
//	    }
//	    // Stop movement to collide
//	    yspd = 0;  // Setting yspd to 0 only when truly colliding

		
//	}

//	// Checking if the player is on the ladder
//	    // Sterowanie za pomocą klawiatury
//	    if (place_meeting(x, y, oLadder) && (upKey || downKey || (abs(axisY) > 0.5)) && !isDashing) {
//	        isLadder = true;
//	        topLadder = false;
//		}
//		if !place_meeting(x, y, oLadder) {
//		isLadder = false;
//		topLadder = false;
//		}
	
//	//if place_meeting(x, y + 2, oLadder) && isLadder && !place_meeting(x, y, oLadder) {
//	//	isLadder = false;
//	//	topLadder = true;
//	//}
	
//	if !isLadder && yspd == 0 && onGround && moveDir != 0 && dashKey && dashCooldownTimer <= 0 && !isDashing { //if player is on ground and dont touching ladder start dash
//		xspdTemp = xspd;
//		dashTimer = dashBuffer;
//	}
	
	
//	//if !downKey
	
//	//if !downKey && isDashing {
//	//	dashTimer = 0;	
//	//}
//	//if(debug_mode) show_debug_message("xspd: "+string(xspd));
//	//if(debug_mode) show_debug_message("xspdTemp: "+string(xspdTemp));
//	if dashTimer > 0 {
//		dashTimer--;	
//		isDashing = true;
//		hasDashed = true;
//		xspd = smooth(xspd, (sign(moveDir) * moveSpd[currentWeightLevel] * 1.2), 0.6);
		
//		if attackingTimer > 0 {
//			attackingTimer = 0;
//			if (instance_exists(hitbox)) {
//				instance_destroy(hitbox);	
//			}
//		}
		
//	} else if dashTimer == 0 {
//		isDashing = false;
//		dashTimer--;
//		dashCooldownTimer = dashCooldown;	
//		if (hasDashed && !instance_exists(oDashCooldownBar)) { // Pasek tworzy się tylko po dashu
//        var cooldownBar = instance_create_depth(x, y, -10, oDashCooldownBar);
//    }
//		if(debug_mode) show_debug_message("dash cooldown");
		
//	}
	
//	if dashCooldownTimer > 0 {
//		dashCooldownTimer--;	
//	} else if dashCooldownTimer == 0 {
//		dashCooldownTimer--;
//		if(debug_mode) show_debug_message("dash rdy");	
//	}
	
//	//checking top ladder
	
//	y += yspd;
	
//	if (!place_meeting(x, y, oLadder) && place_meeting(x, y + 1, oLadder) && !topLadder && !downKey && abs(axisY<=0.5)) {
	    
//		var _subPixel = 0.5;
		
//	    // Move up to wall precisely
//	    var _pixelCheck = _subPixel;

//	    // Move as close to the wall as possible in 0.5px increments
//	    while !place_meeting(x, y + _pixelCheck, oLadder) {
//	        y += _pixelCheck;
//	    }

//	    // Stop movement to collide
//		isLadder = false;
//		topLadder = true;
//	    yspd = 0;  // Setting yspd to 0 only when truly colliding
//	}
	

	
//	//Check if on ground, reset timers
//	if ((yspd == 0 && (place_meeting(x, y + 1, oWall) || place_meeting(x, y + 1, oDoor))) || (yspd == 0 && topLadder)) {
//		if (wasMidair && !audio_is_playing(snd_playerland)) {
//	        // Odtwarzamy dźwięk tylko przy pierwszym kontakcie z ziemią
//	        audio_play_sound(snd_playerland, 0, false);
//	    }
//		onGround = true;
//		wasMidair = false;
//	    jumpCount = 0;
//	    jumpHoldTimer = 0;
//	} else {
//	    onGround = false;
//		wasMidair = true;
//	    // Start jump animation
//	    if (jumpStartTimer > 0) {
//	        jumpStartTimer--;
//	    } 

//		if !isLadder && !isDashing && attackingTimer == 0 {
//			if (jumpStartTimer > 0) {
//		        sprite_index = sPlayerStartJump;
//				image_speed = 1;
//		    } else if (yspd > 0) {
//		        // Fall animation
//		        sprite_index = sPlayerFall;
//				image_speed = 1;
//		    } else if (!onGround && jumpCount > 0) {
//		        // Jump animation
//		        sprite_index = sPlayerJump;
//				image_speed = 1;
//		    }	
//		}
//	}


	
	
	

	
//	//ladders
//	if yspd<0 && isLadder {
//		sprite_index = sPlayerLadderClimb;
//		image_speed = 1;
//	} 
//	else if isLadder {
//		sprite_index = sPlayerLadderIdle;
//		image_speed = 1;
//	}
//	if timerEnemyHit > 0 {
//		sprite_index = sPlayerGotHit;
//		image_speed = 1;
//	}
	
//	if attackingTimer > 0 {
//		image_xscale = attackDir;
//		image_speed = 1;
//		if(sprite_index != sPlayerAttack){
//		sprite_index = sPlayerAttack;
//		}
//		if image_index == 2 {
//			hitbox = attack();	
//		}
//		attackingTimer--;
//	}
	
//	if isDashing {
//		sprite_index = sPlayerDash;
//		image_speed = 1;
//	}
	
//} else if isdying {
//	instance_destroy(backpack);
//	if(sprite_index !=sPlayerDying){
//		sprite_index = sPlayerDying;
//		image_speed = 1;
//		if image_index >= image_number - 1 {
//			isdying = false;	
//		}
//	} else {
//		sprite_index = sPlayerDying;	
//		image_speed = 1;
//		image_index = image_number - 1;
//	}

//	if reviveTimer == 0 && !isAlive {
//		reviveTimer = reviveBuffer;	
//	}

//	if reviveTimer > 0 && !isAlive {
//		reviveTimer--;
//		if reviveTimer == 0 {
//			event_perform(ev_keypress, vk_enter);	
//		}	
//	}
//}

