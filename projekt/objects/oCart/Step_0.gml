if (place_meeting(x, y + 1, oTracks)) {
	onTracks = true;	
} else {
	onTracks = false;
	moveTimer = moveBuffer;
	moveDir = 0;
}

var _subPixel = 0.5;

var text;
if !InventoryIsEmpty(oInventory) && ds_list_size(content) != maxSize {
	text = "   deposit";
} else {
	text = "   retrieve";
}

if InventoryIsEmpty(oInventory) && ds_list_size(content) == 0 {
	text = "   deposit";	
}

chestHandling(text);
		
if ds_list_size(content) == maxSize {
	sprite_index = fullSprite;
} else if ds_list_size(content) == 0 {
	sprite_index = closedSprite;	
} else if ds_list_size(content) < maxSize && ds_list_size(content) > 0 {
	sprite_index = halfFullSprite;
}

if marked && openable && ds_list_size(content) == 0 {
	sprite_index = markSprite;	
} else if marked && openable && ds_list_size(content) == maxSize {
	sprite_index = markSpriteFull;	
} else if marked && openable && ds_list_size(content) < maxSize && ds_list_size(content) > 0 {
	sprite_index = markSpriteHalfFull;	
}

if (marked && openable && keyboard_check_pressed(ord("E"))) && oPlayer.isAlive {
	
	//odbieram wszystko z wagonika
	if (ds_list_size(content) == maxSize) || (ds_list_size(oInventory.inventory) == 0) {
		for (var i = ds_list_size(content) - 1; i >= 0; i--) {	
			var item = ds_list_find_value(content, i);	
			if item != noone && item.weight + oPlayer.inventoryWeight <= oPlayer.maxInventoryWeight {
				ds_list_add(oInventory.inventory, item);
				ds_list_delete(content, i);
				InventoryCalculateWeight(oInventory);
			} else {
				break;	
			}
		}
	} else { //przekazuję po kolei do wypełnienia
		var item = ds_list_find_value(oInventory.inventory, ds_list_size(oInventory.inventory) - 1);	
		if item != noone && item != undefined {
			ds_list_add(content, item);
			ds_list_delete(oInventory.inventory, ds_list_size(oInventory.inventory) - 1);
		}
	}
	mass = weightChangeValue[weightLvl];
	for (var i = ds_list_size(content) - 1; i >= 0; i--) {
		mass += ds_list_find_value(content, i).weight;
	}
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
		
		moveBuffer = ceil(velStart / f);
	}

	xspd = moveDir * (velStart - f * moveTimer);

	if (place_meeting(x + xspd, y, oBreakableWallOrange)) {
		var b = instance_place(x + xspd, y, oBreakableWallOrange);
	    if (b != noone) {
	        if (mass >= weightChangeValue[1] && abs(xspd) > 1) {
	            with (b) {
	                instance_destroy();
	            }
	        } else {
				moveDir *= -1;
				moveTimer = moveBuffer / 2;
				xspd = moveDir * (velStart - f * moveTimer);
	            // Check if there is already an instance of oTextbox in the same spot
	            //if (!instance_place(x, y - sprite_height, oTextboxPlayer)) {
				//	show_debug_message("x");
	            //    createFollowingTextbox(x-16, y-16, "it has too be havie");
	            //}
	        }
	    }
	}
	
	if (place_meeting(x + xspd, y, oBreakableWallRed)) {
		var b = instance_place(x + xspd, y, oBreakableWallRed);
	    if (b != noone) {
	        if (mass >= weightChangeValue[2] && abs(xspd) > 1) {
	            with (b) {
	                instance_destroy();
	            }
	        } else {
				moveDir *= -1;
				moveTimer = moveBuffer / 2;
				xspd = moveDir * (velStart - f * moveTimer);
	            // Check if there is already an instance of oTextbox in the same spot
	            //if (!instance_place(x, y - sprite_height, oTextboxPlayer)) {
				//	show_debug_message("x");
	            //    createFollowingTextbox(x-16, y-16, "it has too be havie");
	            //}
	        }
	    }
	}

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

show_debug_message(string(moveTimer));
if ((xspd == 0 || moveTimer == moveBuffer) && blockadeInstance != noone) {
	instance_destroy(blockadeInstance);	
	moveDir = 0;
	moveTimer = moveBuffer;
	xspd = 0;
}