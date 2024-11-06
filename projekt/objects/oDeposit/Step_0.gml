//treating interactive things like chests
chestHandling();
		
if (marked && openable && keyboard_check_pressed(ord("E"))) /*&& !oInventory.opened*/ && oPlayer.isAlive {
    
	if !InventoryIsEmpty(oInventory) {
	
		for (var i = ds_list_size(oInventory.inventory) - 1; i >= 0 ; i--) {	
			var item = ds_list_find_value(oInventory.inventory, i);	
			if item != noone {
				//ListAdd(items, item);	
				ds_list_add(items, item);
				ds_list_delete(oInventory.inventory, i);
			}
		}
	} else {
		
		
		
		for (var i = ds_list_size(items) - 1; i >= 0 ; i--) {	
			var item = ds_list_find_value(items, i);	
			if item != noone && item.weight + oPlayer.inventoryWeight <= oPlayer.maxInventoryWeight {
				//ListAdd(items, item);	
				ds_list_add(oInventory.inventory, item);
				ds_list_delete(items, i);
				InventoryCalculateWeight(oInventory);
			} else {
				break;	
			}
		}
	}
	
	
	//when player opened -> open 2 windows
	//global.openedDep = true;
	//with (oInventory) {
	//	//event_perform(ev_keypress, ord("I"));	
	//	inventoryActiveFunc();
	//}
}

//===========DOTYCZY GUI==============


//if (marked && openable && keyboard_check_pressed(ord("R"))) /*&& !oInventory.opened*/ && oPlayer.isAlive {
//    //when player opened -> open 2 windows
//	//global.openedDep = true;
//	//with (oInventory) {
//	//	//event_perform(ev_keypress, ord("I"));	
//	//	inventoryActiveFunc();
//	//}
//	if !InventoryIsFull(oInventory) {	
//		var item = Remove(items);	
//		if item != noone {
//			ListAdd(oInventory.inventory, item);	
//		}
//	}
//}


	
	
//if (mouse_check_button_pressed(mb_right) && global.openedDep) {
//    MarkItemDep(id);
//	//marking in deposit window
//}

//if (mouse_check_button_pressed(mb_left) && global.openedDep) {
//    dragDepItem(id);
//}

//if (mouse_check_button_released(mb_left) && global.openedDep) {
//	releaseItem(id);	
//}

