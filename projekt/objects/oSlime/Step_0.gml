event_inherited();


// Stunning the slime
if (stunned) {
	sprite_index = sprites[2];
	moveSpd = 0;
    stun_duration -= 1;

} else {
		moveSpd = 0.6;
}
if (stun_duration <= 0) {
        stunned = false;
}
		// Klatki animacji (tutaj możesz dostosować przesunięcia dolnej krawędzi dla różnych klatek)
var bottom_offsets = [
    0,  // Klatka 1
    2,  // Klatka 2
    -7,  // Klatka 3
    -11,  // Klatka 4
    -11,  // Klatka 5
    -11,  // Klatka 6
    -7, // Klatka 7
    2, // Klatka 8
    3,  // Klatka 9
    -2  // Klatka 10
];

// Ustawienie przesunięcia dolnej krawędzi
var bottom_offset = bottom_offsets[floor(image_index)];
if(sprite_index == sprites[1]){
	offset = bottom_offset;
}else{
	offset = 0;
}
	// Check if the player is on top of the slime
		if (place_meeting(x, y+offset, oPlayer)) {
			if(oPlayer.yspd>0){
		        // Play bounce sound
				audio_play_sound(snd_bounce, 0, false);
				part_emitter_region(global.particleSystem, emiterLeft,x, x, oPlayer.bbox_bottom - 1, oPlayer.bbox_bottom, ps_shape_line, ps_distr_gaussian);
				part_emitter_burst(global.particleSystem, emiterLeft, oGlobal.slimeParticleType, 80);
				part_emitter_burst(global.particleSystem, emiterLeft, oGlobal.slimeRightParticleType, 80);
		        oPlayer.yspd = -2.5 + -2.5*(oPlayer.currentWeightLevel); // Adjust the value as needed for trampoline effect
			}
}
		
