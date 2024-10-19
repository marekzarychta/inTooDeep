if !opened {

	if (oPlayer.chestId == id) {
		marked = true;	
		show_debug_message(id);
	} else {
		marked = false;	
	}

	var dis = point_distance(x, 0, oPlayer.x, 0);

	show_debug_message(string(id) + ": " + string(dis))

	if place_meeting(x, y, oPlayer) {
	    openable = true; 
	} else {
	    openable = false; 
	}

	sprite_index = closedSprite;	

	if openable && marked {
		sprite_index = markSprite;	
	}



	if (marked && openable && keyboard_check_pressed(ord("E"))) {
    
	    openable = false;
		opened = true;
	}
} else {
	sprite_index = openedSprite;	
}

