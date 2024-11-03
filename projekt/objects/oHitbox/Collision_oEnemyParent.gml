/// @description Collision with Enemies

// oHitbox -> Collision Event with oEnemy
if (other.health_points != undefined && !other.wasHit) {
    other.health_points -= 10;  // Zadaj obrażenia przeciwnikowi]
	other.wasHit = true;
    show_debug_message("Wróg trafiony! Obecne HP wroga: " + string(other.health_points));
	
	var directionKnockback = point_direction(other.x, other.y, x, y);
	other.knockback_x = lengthdir_x(other.knockback_power, -directionKnockback);
    other.knockback_y = lengthdir_y(other.knockback_power, directionKnockback);
    other.knockback_duration = 15; // Czas trwania knockbacku
	
    // Sprawdź, czy przeciwnik zginął
    if (other.health_points <= 0) {
        other.isAlive = false;
        with (other) instance_destroy();  // Usuń przeciwnika
        show_debug_message("Wróg pokonany!");
    }
}

//instance_destroy();

//var offset_x = (image_xscale == 1) ? 32 : -32;