if !clicking {

	chestHandling("push");
	
	if (marked && openable && keyboard_check_pressed(ord("E"))) && !oInventory.opened && oPlayer.isAlive {
    
	    clicking = true;
		target.opened = true;
	}	
} else {
	sprite_index = openingSprite;
	if image_index >= image_number - 1
		clicking = false;
}
