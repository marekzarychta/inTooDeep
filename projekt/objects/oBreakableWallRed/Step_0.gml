scale = 1 + 0.15 * sin(degtorad(time)) * sin(degtorad(time));
time += buff / 60;
if (time >= 180) {
	num++;
	num %= how_many;
	time = 0;

}