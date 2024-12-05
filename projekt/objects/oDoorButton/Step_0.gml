if (place_meeting(x, y - 2, oPlayer) && oPlayer.yspd > 0 && clickable) {

		oPlayer.yspd = -1;
	    clicking = true;
		target.opened = true;
		clickable = false;
		if (cutScene) {
			activateCutScene(doorX, doorY);
		}
		
} else if clicking {
	
	sprite_index = openingSprite;
	if image_index >= image_number - 1
		clicking = false;
		clicked = true;
}



if clicked {
	sprite_index = offSprite;
	if (instance_exists( textBoxInstance))
		instance_destroy(textBoxInstance);
}