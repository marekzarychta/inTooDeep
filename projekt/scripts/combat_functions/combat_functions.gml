// For now there is no hitbox, just the distance of 32 pixels
var attack_range = 32;

function attack(){

	// We make the target the nearest instance of enemy parent and check if it's in range
	var targetEnemy = instance_nearest(x, y, oEnemyParent);
	
	if(target != noone && y == targetEnemy.y && point_distance(x, y, targetEnemy.x, targetEnemy.y) <= attack_range) {
		
		
		
	}

	//show_debug_message("attacking");

}