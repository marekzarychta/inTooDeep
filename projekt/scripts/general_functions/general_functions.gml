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
	
	dashKey = keyboard_check(ord("F"));
	
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
    // Upewnij się, że `textBoxInstance` jest zainicjalizowana, jeśli jeszcze tego nie zrobiono
    if (!variable_instance_exists(id, "textBoxInstance")) {
        textBoxInstance = noone;
    }

    if (oPlayer.chestId == id && oPlayer.isAlive) {
        marked = true;    
    } else {
        marked = false;    
    }

    var dis = point_distance(x, 0, oPlayer.x, 0);

    if (place_meeting(x, y, oPlayer)) {
        openable = true; 
    } else {
        openable = false; 
    }

    sprite_index = closedSprite;    

    // Tworzenie lub usuwanie `oTextbox`
    if (openable && marked) {
        if (textBoxInstance == noone || !instance_exists(textBoxInstance)) { // Tylko jeśli textbox nie istnieje
            textBoxInstance = createTextbox(x, y - 20, "E - \nopen"); // Tworzymy textbox
        }
        sprite_index = markSprite;    
    } else {
        if (textBoxInstance != noone && instance_exists(textBoxInstance)) { // Jeśli istnieje textbox
            instance_destroy(textBoxInstance); // Usuwamy go
            textBoxInstance = noone; // Resetujemy wskaźnik
        }
    }
}



function interact() {
	//show_debug_message("interaktuje");
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
	var isSlope = false;
	if !place_meeting(RootObject.x + RootObject.xspd, RootObject.y - abs(RootObject.xspd) - 1, oWall) {
		while place_meeting(RootObject.x + RootObject.xspd, RootObject.y, oWall) { RootObject.y -= _subPixel };
		isSlope = true;
	} else {
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
	
	return isSlope;
}

function checkingForSlopesGoingDown(RootObject) {
	
	var _subPixel = 0.5;
	
	if RootObject.yspd >= 0 && !place_meeting(RootObject.x+ RootObject.xspd, RootObject.y + 1, oWall) && 
	place_meeting(RootObject.x + RootObject.xspd, RootObject.y + abs(RootObject.xspd) + 1, oWall) {
		while !place_meeting(RootObject.x + RootObject.xspd, RootObject.y + _subPixel, oWall) { RootObject.y += _subPixel; }
	}
}

function smooth(vel, targetSpeed, _smooth) {
	
	return (targetSpeed * (1 - _smooth) + vel * _smooth);
}
