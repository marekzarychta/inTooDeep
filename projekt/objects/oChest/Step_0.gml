if !opened {

	chestHandling();
	
	if (marked && openable && keyboard_check_pressed(ord("E"))) && !oInventory.opened && oPlayer.isAlive {
    
	    openable = false;
		opened = true;
		interact();
		var itemsCount = 1//irandom_range(2, 4);
		//for (var i = 0; i < itemsCount; i++) {
		instance_create_layer(x, y - 8, oPlayer.layer, oCoin);
		//}
	}	
} else {
	sprite_index = openedSprite;	
	instance_destroy(textBoxInstance);
}
