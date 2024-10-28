if oPlayer.isAlive {
	opened = !opened;

	if opened {
		but1 = instance_create_depth(0, 0, 20, oTestButton);

	
	} else {
		CloseInventory(id);	
	}
}