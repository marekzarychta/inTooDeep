if !opened {

	chestHandling();
} else {
	sprite_index = openedSprite;	
}


if (openable && keyboard_check_pressed(ord("E"))) {
    
    instance_change(oChestOpen, true);
	InventoryAdd(oInventory,1);
}