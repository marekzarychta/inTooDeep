// Sprawdź, czy przeciwnik zginął
if (health_points <= 0 && isAlive) {
    isAlive = false;
    //with (other) instance_destroy();  // Usuń przeciwnika
    //show_debug_message("Wróg pokonany!");
	dying = true;
	image_index = 0;
}

//X Movement
if isAlive {
	playerX = oPlayer.x;
	playerY = oPlayer.y;
	
	var dx = playerX - x;
	var dy = playerY - y;
	
	if IsInRangeAttack() && !attacking && !wasHit {
		image_index = 0;
		attacking = true;
		face = -moveDir;
	} 
	

	
	//if place_meeting(x, y, oPlayer) {
	//	//show_debug_message("Kolizja");	
	//}
	if attacking 
		image_xscale = face;
	else
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
	
	if (attacking && !(knockback_duration > 0)) {
		xspd = 0;	
	}
	
	var _subPixel = .5;
	
	var obj = instance_place(x + xspd, y, oDoor);
	if  (place_meeting(x + xspd, y, oDoor) && !obj.opened) {
		
		if !following && wallTimer == 0 {
			moveDir *= -1;
			wallTimer = wallBuffer;
		} 
		
		if following {
			var _pixelCheck = _subPixel * sign(xspd);
	
			//Move as close to the wall as possible in 0.5px increments
			while !place_meeting(x+_pixelCheck, y, oDoor)
			{
				x += _pixelCheck;
			}
	
			//Stop movement to collide
			xspd = 0;	
		}
	}
	
	if (wasHit && attackTimer == attackBuffer) {
		wasHit = false;
		attackTimer = 0;
	}
	
	if (wasHit && !(knockback_duration > 0)) {
		xspd = 0;
		attackTimer++;
	}
	
	//Check wall collision
	if place_meeting(x + xspd, y, oWall) 
	{
		

	    if !place_meeting(x + xspd, y - abs(xspd) - 1, oWall) {
	        while place_meeting(x + xspd, y, oWall) {
	            y -= _subPixel
	        };
	        isSlope = true;
	    } else {
			if following {
		        //Walk up to wall precisely
		        var _pixelCheck = _subPixel * sign(xspd);

		        //Move as close to the wall as possible in 0.5px increments
		        while !place_meeting(x + _pixelCheck, y, oWall) {
		            x += _pixelCheck;
		        }
		        xspd = 0;
			} else {
				moveDir *= -1;
			}
	    }
		
	}
	
	checkingForSlopesGoingDown(id);
	
	
	if wallTimer > 0 {
		wallTimer--;	
			
	} else {
			
		wallTimer = 0;
	}
	
	
	if !attacking {
			
		if(xspd == 0){
			sprite_index = sprites[0];
		} else if(xspd != 0){
			sprite_index = sprites[1];
		}
		
	} else {
		sprite_index = sprites[2];
		
		if image_index == 2 {
			audio_play_sound(snd_skeleton_attack,0,false);
			attackEnemy(id);	
			//show_debug_message(string(image_index));
		}
		
		if image_index >= image_number {
			attacking = false;	
		}
	}

//var distance_from_spawn = abs(x - initial_x);
//if (nearest_logical_wall != noone) {

//	//enemy ignores logical walls if is following player or is far enough to come back to starting point
//    if (following || distance_from_spawn > distance_to_logical_wall_x-8) {
//		ignores_logical_walls = true;
//    }
	
//	else{
//      if(!place_meeting(x - moveDir,y,oLogicalWall)) ignores_logical_walls = false;
//    }
//}

//if (!following && distance_from_spawn > distance_to_logical_wall_x-8){
//		moveDir = sign(initial_x - x);
//		//show_debug_message("zmienil se kierunek ruchu na: " + string(moveDir));
//	}

var logicalBlockade = instance_place(x + xspd, y, oLogicalWall);

var diff = 0;
if (instance_exists(logicalBlockade)) {
	diff = logicalBlockade.x - initial_x;
}

if !following && diff * moveDir > 0 {
	moveDir *= -1;
}

if (following) {
	
}

	if (!following) {
		if (x >= initial_x + range) {
			moveDir = -1;	
		} else if (x <= initial_x - range) {
			moveDir = 1;
		}
	}

	//Move
	x += xspd;
} else if dying {
	if(death_flag == 1) {
		sprite_index = sprites[3];
	} else if(death_flag == 2) {
		sprite_index = sprites[5];
		show_debug_message("AAAHAHAHAHAHAHHAA");
	}
	
	if image_index >= image_number - 1 {
		dying = false;	
		var task = ds_list_find_value(global.task_list, 1);
		task.counter++;
	}
} else {
	sprite_index = sprites[4];	
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
	

	
	
	y += yspd;
	
	
	//Select sprite depending on movement
	
	
	
	
	
	
	//tu dodac warunek do ataku, nw jaki