/// @description Collision with Enemies

if place_meeting(x, y , oWall) && place_meeting(x, y , oEnemyParent) {
	var wall = instance_place(x, y, oWall);	
	var enemy = instance_place(x, y, oEnemyParent);	
	
	var wall_distance = abs(wall.x - oPlayer.x);  // Odległość do ściany
    var enemy_distance = abs(enemy.x - oPlayer.x);
	if (wall_distance < enemy_distance) {
        isDamaging = false; 
    } else {
        isDamaging = true; 
    }
	
}


// oHitbox -> Collision Event with oEnemy
if (other.current_health != undefined && other.timerEnemyHit == 0 && isDamaging) {
    LoseHP(other);  
	
    other.timerEnemyHit = other.bufferEnemyHit;
	other.image_index = 0;
	
}

//instance_destroy();

//var offset_x = (image_xscale == 1) ? 32 : -32;