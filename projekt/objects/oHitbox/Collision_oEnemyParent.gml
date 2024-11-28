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
if (other.health_points != undefined && !other.wasHit && isDamaging) {
	if(oEnemyParent.isAlive && !audio_is_playing(snd_attack_impact)){
		audio_play_sound(snd_attack_impact,0,false);
	}
    other.health_points -= 5;  // Zadaj obrażenia przeciwnikowi]
	other.wasHit = true;
    //show_debug_message("Wróg trafiony! Obecne HP wroga: " + string(other.health_points));
	
	var directionKnockbackX = sign(other.x - x);//point_direction(other.x, other.y, x, y);
	var directionKnockbackY = -1;//point_direction(other.x, other.y, x, y);
	other.knockback_x = other.knockback_power * directionKnockbackX; //lengthdir_x(other.knockback_power, -directionKnockback);
    other.knockback_y = other.knockback_power * directionKnockbackY;//lengthdir_y(other.knockback_power, -directionKnockback);
    other.knockback_duration = 10; // Czas trwania knockbacku
	
}

//instance_destroy();

//var offset_x = (image_xscale == 1) ? 32 : -32;