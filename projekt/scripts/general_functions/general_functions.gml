function controlsSetup()
{
	bufferTime = 5;
	
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
	if (oPlayer.chestId == id) {
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
