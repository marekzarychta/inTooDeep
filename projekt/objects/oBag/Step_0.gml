if !opened {

	chestHandling();
	
	if (marked && openable && keyboard_check_pressed(ord("E"))) && !oInventory.opened {
    
	    openable = false;
		opened = true;
		
		var size = ds_list_size(items);
		
		for (var i = 0; i < size; i++) {
			InventoryAdd(oInventory, 1);
		}
	}	
} else {
	instance_destroy(id);	
}

