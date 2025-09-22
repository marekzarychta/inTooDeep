if (!place_meeting(x, y + 1, oWall) && !place_meeting(x, y + 1, oWallSemiSolid)) {
	timer_not_ground++;	
	if (yspd >= 5) {
		fallen_death = true;
	}
	
} else {
	if (fallen_death) {
			
		instance_destroy();
	} else {
		timer_not_ground = 0;	
	}
}