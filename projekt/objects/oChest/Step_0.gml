if !opened {

	if (oPlayer.chestId == id) {
		marked = true;	
	} else {
		marked = false;	
	}

	var dis = point_distance(x, 0, oPlayer.x, 0);


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
		
		var itemsCount = irandom_range(2, 4);
		for (var i = 0; i < itemsCount; i++) {
			instance_create_depth(x, y - 8, Room1.depth - 1, oCoin);
			
		}
	}
} else {
	sprite_index = openedSprite;	
}

