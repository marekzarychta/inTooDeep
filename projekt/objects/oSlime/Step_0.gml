event_inherited();

// Stunning the slime
if (is_stunned) {
	sprite_index = sprites[1];
	image_speed = 1;
	moveSpd = 0;
    stun_duration -= 1;
    if (stun_duration <= 0) {
        is_stunned = false;
    }
} else {
		sprite_index = sprites[0];
		moveSpd = 0.6;
}

	// Check if the player is on top of the slime
		if (place_meeting(x, y, oPlayer)) {
			if(oPlayer.yspd>0){
		    // Check if the player's bottom edge is at the level of y - sprite height of the slime
		        // Player is on top of the slime
		        oPlayer.yspd = -1.25 + -1.25*(oPlayer.currentWeightLevel); // Adjust the value as needed for trampoline effect
			}
		}