
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
	
	if (collectable && instance_exists(oPlayer)) {
		if (abs(oPlayer.x - x) < 100 && abs(oPlayer.y - y) < 2) {
			var dir = sign(oPlayer.x - x);
			xspd = dir * magneticVel;
		}
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
	


if place_meeting(x, y, oPlayer) && collectable {
    
    oGlobal.gold += item_value;

    oGlobal.coin_chain += 1;
    oGlobal.coin_chain_timer = 30;

    var pitch = min(1.0 + oGlobal.coin_chain * 0.1, 2.0);

    // Sprawdź cooldown
    if oGlobal.coin_sound_cooldown <= 0 {
        var snd_inst = audio_play_sound(snd_pickup, 0, false);
        audio_sound_pitch(snd_inst, pitch);
        oGlobal.coin_sound_cooldown = 5; // np. 5 klatek = 0.083 sekundy
    }

    createMiniTextbox(oPlayer.x, oPlayer.y, "gold", "+");
    instance_destroy();
}



	
} 