//treating interactive things like chests
chestHandling();
		
if (marked && openable && keyboard_check_pressed(ord("E"))) && !oInventory.opened && oPlayer.isAlive {
    //when player opened -> open 2 windows
	global.openedDep = true;
	with (oInventory) {
		event_perform(ev_keypress, ord("I"));		
	}
		
}
	
	
if (mouse_check_button_pressed(mb_right) && global.openedDep) {
    MarkItemDep(id);
	//marking in deposit window
}

if (mouse_check_button_pressed(mb_left) && global.openedDep) {
    dragDepItem(id);
}

if (mouse_check_button_released(mb_left) && global.openedDep) {
	releaseItem(id);	
}

