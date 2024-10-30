if !opened {

	chestHandling();
		
	if (marked && openable && keyboard_check_pressed(ord("E"))) && !oInventory.opened && oPlayer.isAlive{
    
	    openable = false;
		//opened = true;
		
		var size = ds_list_size(items);
		var counter = 0;
		
		for (var i = 0; i < size; i++) {
			
			var it = ds_list_find_value(items, i);
			
			if it.weight + oPlayer.inventoryWeight <= oPlayer.maxInventoryWeight {
				InventoryAdd(oInventory, it);
				counter++;
			} else {
				
				break;	
			}
			
		}
		
		for (var j = 0; j < counter; j++) {
			show_debug_message(string(ds_list_find_value(items, 0)));
			ds_list_delete(items, 0);				
		}
	}
	
	if ds_list_size(items) == 0 {
	 opened = true;	
	}
	
} else {
	instance_destroy(id);	
}

