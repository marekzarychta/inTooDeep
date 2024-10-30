if !opened {

	chestHandling();
	
	if (marked && openable && keyboard_check_pressed(ord("E"))) && !oInventory.opened && oPlayer.isAlive {
    
	    openable = false;
		opened = true;
		interact();
		var itemsCount = irandom_range(2, 4);
		for (var i = 0; i < itemsCount; i++) {
			instance_create_layer(x, y - 8, oChest.layer, oTestCoin);
		}
	}	
} else {
	sprite_index = openedSprite;	
}
