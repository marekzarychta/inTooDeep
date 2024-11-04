/// @description Collision with Enemies

// oHitbox -> Collision Event with oEnemy
if (other.health_points != undefined && !other.wasHit) {
    other.health_points -= 20;  // Zadaj obrażenia przeciwnikowi]
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