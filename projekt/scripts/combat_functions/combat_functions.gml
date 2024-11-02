function attack() {
	
	// For now there is no hitbox, just the distance of 32 pixels
	var attack_range = 32;
	
	// We make the target the nearest instance of enemy parent and check if it's in range
	var targetEnemy = instance_nearest(x, y, oEnemyParent);
	
	// Add later what's commented out. So we want to check if we are on the same height
	// to attack the enemy but their sprite is larger than the player's, so the current
	// condition didn't work
	if(targetEnemy != noone && /*y == targetEnemy.y &&*/ point_distance(x, y, targetEnemy.x, targetEnemy.y) <= attack_range) {
		
		show_debug_message("attacking");	
		
		if (targetEnemy.health_points != undefined) {
			targetEnemy.health_points -= damage;
			show_debug_message("current enemy hp: " + string(targetEnemy.health_points));
		}
		
		var knockback_x = 10;  // Left-right knockback
        var knockback_y = -5; // Up knockback
		
		targetEnemy.xspd = knockback_x * sign(x - targetEnemy.x);
        targetEnemy.yspd = knockback_y;
		
		if (targetEnemy.health_points <= 0) {
            targetEnemy.isAlive = false;  
            with (targetEnemy) {
				instance_destroy(); 
			}
			show_debug_message("Enemy slain!");
        }
		
	}

}