if !in_inventory {
	if abs(xspd) < abs(fric) {
		xspd = 0;	
	}

	if onGround && xspd != 0 {
		xspd += fric;
	}




	//X Collision

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
	
	if place_meeting(x + xspd, y, oWallSemiSolid)
	{
		//Walk up to wall precisely
		var _pixelCheck = _subPixel * sign(xspd);
	
		//Move as close to the wall as possible in 0.5px increments
		while !place_meeting(x+_pixelCheck, y, oWallSemiSolid)
		{
			x += _pixelCheck;
		}
	
		//Stop movement to collide
		xspd = 0;
	}

	//Move X
	x += xspd;

	//Y Movement
	//Gravity
	yspd += grav;
	
	if yspd > termVel {yspd = termVel; };

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
	
		//Stop movement to collide
		yspd = 0;
	}
	
	if place_meeting(x, y + yspd, oWallSemiSolid)
	{
		//Move up to wall precisely
		var _pixelCheck = _subPixel * sign(yspd);
	
		//Move as close to the wall as possible in 0.5px increments
		while !place_meeting(x, y + _pixelCheck, oWallSemiSolid)
		{
			y += _pixelCheck;
		}
	
		//Stop movement to collide
		yspd = 0;
	}
	
	//Check if on ground
	if yspd >=0 && (place_meeting(x,y+1, oWall) || place_meeting(x,y+1, oWallSemiSolid)){
		onGround = true;
	} else {
		onGround = false;
	}


	y += yspd;

	if flyingTimer > 0 {
		flyingTimer--;	
	} else {
		collectable = true;	
	}

	if place_meeting(x, y, oPlayer) && collectable && weight + oPlayer.inventoryWeight <= oPlayer.maxInventoryWeight {
	
		//show_debug_message("Zebrano: " + string(id));
		InventoryAdd(oInventory, id);
		audio_play_sound(snd_pickup,0,false);
		createMiniTextbox(oPlayer.x,oPlayer.y, "weight", "+");
		if(debug_mode) show_debug_message("Updated weight: " + string(oPlayer.inventoryWeight));
		//instance_destroy(id);
	}
	
} 