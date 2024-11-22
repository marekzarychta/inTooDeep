if (moveTimer == 0) {
    blockadeInstance = instance_create_layer(x + moveDir * (dist + sHitbox.sprite_width), y, layer, oBlockade);
	
}

xspd = moveDir * (velStart - f * moveTimer);



// Kolizje dla osi X
var _subPixel = 0.5;
if (place_meeting(x + xspd, y, oWall) || place_meeting(x + xspd, y, oBlockade)) {
    // Precyzyjne dopasowanie do przeszkody
    var _pixelCheck = _subPixel * sign(xspd);
    while !place_meeting(x + _pixelCheck, y, oWall) && !place_meeting(x + _pixelCheck, y, oBlockade) {
        x += _pixelCheck;
    }
    xspd = 0;
	moveTimer = moveBuffer;
}

if (onGround) {
	x += xspd;
}

yspd += grav;

if (yspd > termVel) {
    yspd = termVel;
}

if (place_meeting(x, y + yspd, oWall)) {
    var _pixelCheck = _subPixel * sign(yspd);
    while !place_meeting(x, y + _pixelCheck, oWall) {
        y += _pixelCheck;
    }
    yspd = 0;
}

y += yspd;

// Sprawdzanie, czy obiekt jest na ziemi
if (yspd == 0 && place_meeting(x, y + 1, oWall)) {
    onGround = true;
} else {
    onGround = false;
}

if ((xspd == 0 || moveTimer == moveBuffer) && blockadeInstance != noone) {
	instance_destroy(blockadeInstance);	
	
	moveTimer = moveBuffer;
}

if (moveTimer < moveBuffer) {
	moveTimer++;	
} 
