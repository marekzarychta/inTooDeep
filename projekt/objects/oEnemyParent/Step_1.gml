if (!place_meeting(x, y + 1, oWall) && !place_meeting(x, y + 1, oWallSemiSolid)) {
	timer_not_ground++;	
	
} else {
	if (timer_not_ground > buffer_not_ground) {
		fallen_death = true;
			
		instance_destroy();
	} else {
		timer_not_ground = 0;	
	}
}