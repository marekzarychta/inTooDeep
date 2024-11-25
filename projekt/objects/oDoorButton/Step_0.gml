if (!clicking && clickable) {

	chestHandling("push");
	
	if (marked && openable && keyboard_check_pressed(ord("E"))) && !oInventory.opened && oPlayer.isAlive {
    
	    clicking = true;
		target.opened = true;
		clicked = true;
		activateCutScene(doorX, doorY);
	}	
} else if clickable {
	sprite_index = openingSprite;
	if image_index >= image_number - 1
		clicking = false;
}

if clicked {
	clickable = false;
}

if !clickable {
	sprite_index = offSprite;
	instance_destroy(textBoxInstance);
}