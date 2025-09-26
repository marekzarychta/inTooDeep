if (wrong_weight_anim) {
	scale = 1 + 0.15 * sin(degtorad(time)) * sin(degtorad(time));
	alfa = sin(degtorad(time)) * sin(degtorad(time));
	time += buff / 14;
	if (time >= 180) {
		num++;
		if (num >= how_many) {
			wrong_weight_anim = false;	
		}
		time = 0;

	}
}
