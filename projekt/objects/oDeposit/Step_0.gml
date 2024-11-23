//treating interactive things like chests
var text;
if !InventoryIsEmpty(oInventory) {
	text = "   deposit";
} else {
	text = "   retrieve";
}

if InventoryIsEmpty(oInventory) && ds_list_size(global.lista) == 0 {
	text = "   deposit";	
}

chestHandling(text);
		
if ds_list_size(global.lista) > 0 {
	sprite_index = fullSprite;
} else if ds_list_size(global.lista) == 0 {
	sprite_index = closedSprite;	
}

if marked && openable && ds_list_size(global.lista) == 0 {
	sprite_index = markSprite;	
} else if marked && openable && ds_list_size(global.lista) > 0 {
	sprite_index = markSpriteFull;	
} 
		
if (marked && openable && keyboard_check_pressed(ord("E"))) /*&& !oInventory.opened*/ && oPlayer.isAlive {
    
	
	
	InventoryListMove(items, 0);
	
	
	
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

