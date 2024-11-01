chestHandling();
		
if (marked && openable && keyboard_check_pressed(ord("E"))) && !oInventory.opened && oPlayer.isAlive {
    
	//openable = false;
		
	var size = ds_list_size(items);
	var counter = 0;
		
	with (oInventory) {
		event_perform(ev_keypress, ord("I"));	
		
	}
	opened = true;
	for (var i = 0; i < size; i++) {
			
		var it = ds_list_find_value(items, i);
			
		if it.weight + oPlayer.inventoryWeight <= oPlayer.maxInventoryWeight {
			InventoryAdd(oInventory, it);
			counter++;
		} else {
				
			break;	
		}
			
	}
		
}
	



