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
if (other.health_points != undefined && !other.wasHit && isDashing) {
	if (other.isAlive) {
		audio_play_sound(snd_hit,0,false);
		part_emitter_region(global.particleSystem, emitter, other.x - 4 + other.image_xscale * 4, other.x + 4 + other.image_xscale * 4, other.bbox_top + 4, other.bbox_bottom - 4, ps_shape_ellipse, ps_distr_invgaussian);
		part_emitter_burst(global.particleSystem, emitter, oGlobal.hitParticleType, 100);
	}
	if (currentWeightLevel >= 1) {
		other.health_points -= 10;  // Zadaj obrażenia przeciwnikowi]
		other.death = true;
		other.flashAlpha = 0.8;
	} 
	
	if (other.attacking) {
		other.attacking = false;
		
		other.sprite_index = other.sprites[1];
		other.image_index = 0;
	}
	
	other.wasHit = true;
    //show_debug_message("Wróg trafiony! Obecne HP wroga: " + string(other.health_points));
	
	
	//-----------------------------------
	//!!DO EDYCJI - JAK STOIMY ZA ŚRODKIEM PRZECIWNIKA TO GO WYWALI W DRUGĄ STRONĘ!!
	
	//var directionKnockbackX = sign(other.bbox_right - bbox_left);//point_direction(other.x, other.y, x, y);
	var directionKnockbackX = face;
	//-----------------------------------

	var directionKnockbackY = -1;//point_direction(other.x, other.y, x, y);
	other.knockback_x = other.knockback_power * directionKnockbackX; //lengthdir_x(other.knockback_power, -directionKnockback);
    //other.knockback_y = other.knockback_power * directionKnockbackY;//lengthdir_y(other.knockback_power, -directionKnockback);
    other.knockback_duration = 10; // Czas trwania knockbacku
	
}

//instance_destroy();

//var offset_x = (image_xscale == 1) ? 32 : -32;