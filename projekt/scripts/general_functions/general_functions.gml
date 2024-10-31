function controlsSetup()
{
	bufferTime = 1;
	
	upKeyBuffered = 0;
	upKeyBufferTimer = 0;
}

function getControls()
{
	//direction
rightKey = keyboard_check(ord("D")) + keyboard_check(vk_right);
	rightKey = clamp( rightKey, 0, 1);


leftKey = keyboard_check(ord("A")) + keyboard_check(vk_left);
	leftKey = clamp (leftKey, 0, 1);
	
	//action
upKeyPressed = keyboard_check_pressed(ord("W")) + keyboard_check_pressed(vk_space);
	upKeyPressed = clamp (upKeyPressed, 0, 1);
upKey = keyboard_check(ord("W")) + keyboard_check(vk_space);
	upKey = clamp (upKey, 0, 1);
	
	downKey = keyboard_check(ord("S"));
	//downKey = clamp (downKey, 0, 1);
	
	//Jump key buffering
	if upKeyPressed
	{
		upKeyBufferTimer = bufferTime;
	}
	if upKeyBufferTimer > 0
	{
		upKeyBuffered = 1;
		upKeyBufferTimer--;
	} else {
		upKeyBuffered = 0;
	}

	
}

function chestHandling() {
	if (oPlayer.chestId == id && oPlayer.isAlive) {
		marked = true;	
	} else {
		marked = false;	
	}

	var dis = point_distance(x, 0, oPlayer.x, 0);


	if place_meeting(x, y, oPlayer) {
	    openable = true; 
	} else {
	    openable = false; 
	}

	sprite_index = closedSprite;	

	if openable && marked {
		sprite_index = markSprite;	
	}
}

function interact() {
	show_debug_message("interaktuje");
	oPlayer.isInteracting = true;
}

function toDown(RootObject) {
	var _pixelCheck = 0.9;	
	
	//Move as close to the wall as possible in 0.5px increments
	while !place_meeting(RootObject.x, RootObject.y + _pixelCheck, oWall)
	{
		RootObject.y += _pixelCheck;
	}	
}
function checkingForSlopes(RootObject) {
	
	var _subPixel = 0.5;
	if !place_meeting(RootObject.x + RootObject.xspd, RootObject.y - abs(RootObject.xspd) - 1, oWall) {
		while place_meeting(RootObject.x + RootObject.xspd, RootObject.y, oWall) { RootObject.y -= _subPixel };
	} else {
		//Walk up to wall precisely
		var _pixelCheck = _subPixel * sign(xspd);
	
		//Move as close to the wall as possible in 0.5px increments
		while !place_meeting(x+_pixelCheck, y, oWall) && !place_meeting(x+_pixelCheck, y, oBreakableWall)
		{
			x += _pixelCheck;
		}
	
		//Stop movement to collide
		xspd = 0;	
	}
	
	
}

function checkingForSlopesGoingDown(RootObject) {
	
	var _subPixel = 0.5;
	
	if RootObject.yspd >= 0 && !place_meeting(RootObject.x+ RootObject.xspd, RootObject.y + 1, oWall) && 
	place_meeting(RootObject.x + RootObject.xspd, RootObject.y + abs(RootObject.xspd) + 1, oWall) {
		while !place_meeting(RootObject.x + RootObject.xspd, RootObject.y + _subPixel, oWall) { RootObject.y += _subPixel; }
	}
}
