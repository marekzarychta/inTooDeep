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