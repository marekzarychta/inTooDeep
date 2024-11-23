if (place_meeting(x, y + 1, oTracks)) {
	onTracks = true;	
} else {
	onTracks = false;
	moveTimer = moveBuffer;
	moveDir = 0;
}

var _subPixel = 0.5;

var text;
if !InventoryIsEmpty(oInventory) {
	text = "   deposit";
} else {
	text = "   retrieve";
}

if InventoryIsEmpty(oInventory) && ds_list_size(content) == 0 {
	text = "   deposit";	
}

chestHandling(text);
		
if ds_list_size(content) > 0 {
	sprite_index = fullSprite;
} else if ds_list_size(content) == 0 {
	sprite_index = closedSprite;	
}

if marked && openable && ds_list_size(content) == 0 {
	sprite_index = markSprite;	
} else if marked && openable && ds_list_size(content) > 0 {
	sprite_index = markSpriteFull;	
} 

if (marked && openable && keyboard_check_pressed(ord("E"))) && oPlayer.isAlive {
	InventoryListMove(content, 1);
}



if (onTracks) {
	
	if (moveTimer == 0) {


		if (oPlayer.inventoryWeight >= 1.5 * mass) {
			velStart = 4.5;	
			dist = 96;
		} else {
			velStart = 3.5;	
			dist = 80;
		}

		blockadeInstance = instance_create_layer(x + moveDir * (dist + 16/*sHitbox.sprite_width / 2*/), y, layer, oBlockade);
		blockadeInstance.parentObj = id;

		f = velStart * velStart / (2 * dist);
	}

	xspd = moveDir * (velStart - f * moveTimer);



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

	if (moveTimer < moveBuffer) {
		moveTimer++;	
	} 
}


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