if (!place_meeting(x, y + yspd, oWall) && !place_meeting(x, y + yspd, oWallSemiSolid)) {
	timer_not_ground++;	
} else {
	if (timer_not_ground > buffer_not_ground) {
		fallen_death = true;
			
		instance_destroy();
	} else {
		timer_not_ground = 0;	
	}
}