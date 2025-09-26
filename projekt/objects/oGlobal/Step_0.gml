/// @description Insert description here
// You can write your code in this editor

//timer for the coin ramp up
if oGlobal.coin_chain_timer > 0 {
    oGlobal.coin_chain_timer -= 1;
} else {
    oGlobal.coin_chain = 0;
}


//timer for coin pickup to avoid overlapping
if oGlobal.coin_sound_cooldown > 0 {
    oGlobal.coin_sound_cooldown -= 1;
}
if (!cutscene) {

	if (timer == 0) {
		alfa+= 0.01;
	}

	if (alfa > 1) {
		alfa_end = true;
		alfa = 1;	
	}

	if (alfa_end) {
			
		timer++;
		if (timer > 40) {
			alfa -= 0.01;
		}
	}
}
