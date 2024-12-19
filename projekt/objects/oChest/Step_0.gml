if !opened {

	chestHandling("");
	if (marked && openable && oPlayer.isInteracting) && !oInventory.opened && oPlayer.isAlive {
    
	    openable = false;
		opened = true;
		audio_play_sound(snd_chest,0,false);
		//var itemsCount = 1//irandom_range(2, 4);
		//for (var i = 0; i < itemsCount; i++) {
		instance_create_layer(x, y - 32, layer_get_id("Player_below"), contents);
		//}
	}	
} else {
	sprite_index = openedSprite;	
	if (instance_exists(textBoxInstance))
		instance_destroy(textBoxInstance);
}
