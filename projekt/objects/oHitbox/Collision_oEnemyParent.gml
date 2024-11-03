/// @description Collision with Enemies

// oHitbox -> Collision Event with oEnemy
if (other.health_points != undefined) {
    other.health_points -= 10;  // Zadaj obrażenia przeciwnikowi
    show_debug_message("Wróg trafiony! Obecne HP wroga: " + string(other.health_points));
    
	var knockback = 10; // Prędkość odrzutu
	var x_dir = (image_xscale == 1) ? 1: -1;
    other.xspd = knockback * x_dir;
	
    // Sprawdź, czy przeciwnik zginął
    if (other.health_points <= 0) {
        other.isAlive = false;
        with (other) instance_destroy();  // Usuń przeciwnika
        show_debug_message("Wróg pokonany!");
    }
}

instance_destroy();

//var offset_x = (image_xscale == 1) ? 32 : -32;