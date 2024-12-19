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
	if (other.isAlive) {
		audio_play_sound(snd_hit,0,false);
		part_emitter_region(global.particleSystem, emiter, other.x - 4 + other.image_xscale * 4, other.x + 4 + other.image_xscale * 4, other.bbox_top + 4, other.bbox_bottom - 4, ps_shape_ellipse, ps_distr_invgaussian);
		part_emitter_burst(global.particleSystem, emiter, oGlobal.hitParticleType, 100);
	}
    other.health_points -= 5;  // Zadaj obrażenia przeciwnikowi]
	other.wasHit = true;
	other.flashAlpha = 0.8;
    //show_debug_message("Wróg trafiony! Obecne HP wroga: " + string(other.health_points));
	
	
	//-----------------------------------
	//!!DO EDYCJI - JAK STOIMY ZA ŚRODKIEM PRZECIWNIKA TO GO WYWALI W DRUGĄ STRONĘ!!
	var directionKnockbackX = sign(other.x - x);//point_direction(other.x, other.y, x, y);
	//-----------------------------------

	var directionKnockbackY = -1;//point_direction(other.x, other.y, x, y);
	other.knockback_x = other.knockback_power * directionKnockbackX; //lengthdir_x(other.knockback_power, -directionKnockback);
    other.knockback_y = other.knockback_power * directionKnockbackY;//lengthdir_y(other.knockback_power, -directionKnockback);
    other.knockback_duration = 10; // Czas trwania knockbacku
	
}

//instance_destroy();

//var offset_x = (image_xscale == 1) ? 32 : -32;