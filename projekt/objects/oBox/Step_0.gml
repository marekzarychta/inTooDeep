if (moveTimer == 0) {
    blockadeInstance = instance_create_layer(x + moveDir * (dist + sHitbox.sprite_width / 2), y, layer, oBlockade);
	blockadeInstance.parentObj = id;
}

xspd = moveDir * (velStart - f * moveTimer);

show_debug_message(string(xspd))

var _subPixel = 0.5;
if (place_meeting(x + xspd, y, oWall) || place_meeting(x + xspd, y, oRock) || place_meeting(x + xspd, y, oPlayer)) {
    // Precyzyjne dopasowanie do przeszkody
    var _pixelCheck = _subPixel * sign(xspd);
    while !place_meeting(x + _pixelCheck, y, oWall) && !place_meeting(x + _pixelCheck, y, oPlayer) && !place_meeting(x + _pixelCheck, y, oRock) {
        x += _pixelCheck;
    }
    xspd = 0;
	moveTimer = moveBuffer;
}

if (blockadeInstance != noone && place_meeting(x + xspd, y, blockadeInstance)) {
    var _pixelCheck = _subPixel * sign(xspd);
    while !place_meeting(x + _pixelCheck, y, blockadeInstance) {
        x += _pixelCheck;
    }
    xspd = 0;
	moveTimer = moveBuffer;
}

x += xspd;

if (abs(xspd) == 0)
	yspd += grav;

if (yspd > termVel) {
    yspd = termVel;
}

if (place_meeting(x, y + yspd, oWall) || place_meeting(x, y + yspd, oPlayer)) {
    var _pixelCheck = _subPixel * sign(yspd);
    while !place_meeting(x, y + _pixelCheck, oWall) && !place_meeting(x, y + _pixelCheck, oPlayer) {
        y += _pixelCheck;
    }
    yspd = 0;
}

y += yspd;

if (yspd == 0 && place_meeting(x, y + 1, oWall)) {
    onGround = true;
} else {
    onGround = false;
}

if ((xspd == 0 || moveTimer == moveBuffer) && blockadeInstance != noone) {
	instance_destroy(blockadeInstance);	
	moveDir = 0;
	moveTimer = moveBuffer;
}

if (moveTimer < moveBuffer) {
	moveTimer++;	
} 
