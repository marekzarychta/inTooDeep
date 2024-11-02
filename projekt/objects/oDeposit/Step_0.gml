chestHandling();
		
if (marked && openable && keyboard_check_pressed(ord("E"))) && !oInventory.opened && oPlayer.isAlive {
    
	global.openedDep = true;
	with (oInventory) {
		event_perform(ev_keypress, ord("I"));		
	}
	
		
}
	
	
if (mouse_check_button_pressed(mb_right) && global.openedDep) {
    MarkItemDep(id);
}



