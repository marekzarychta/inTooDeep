if (place_meeting(x, y, oPlayer)) { 
	// pobieramy ruch gracza
	var px = oPlayer.xspd;

	var new_sprite;

	// wybieramy animację w zależności od ruchu gracza
	if (px != 0) {
		play_sound = true;
	    if (px > 0) new_sprite = plant_base + "_right";
	    else        new_sprite = plant_base + "_left";
	} else {
		play_sound = false;
	    new_sprite = plant_base + "_idle";
	}

	// ustawiamy sprite i gramy dzwiek
	sprite_index = asset_get_index(new_sprite);
	if (play_sound == true) {
		//audio_play_sound();
	}
} else {
    // jeśli gracz nie dotyka rośliny → neutralna
    sprite_index = asset_get_index(plant_base + "_idle");
}