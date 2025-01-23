function attack() {

    with(oEnemyParent) {
        wasHit = false;
    }

    //if(hitbox_delay == 0) {
    var offset_x = (image_xscale == 1) ? 13 : -13 // Ustaw odpowiednią pozycję względem kierunku
    var hitbox = instance_create_layer(x + offset_x, y - 8, oPlayer.layer, oHitbox);
    hitbox.image_xscale = 1.6;
    hitbox.life = 20;
   
	return hitbox;
}

function attackEnemy(_id) {
    var valoffset = 12;
    var offset_x = (-face == 1) ? valoffset : -valoffset // Ustaw odpowiednią pozycję względem kierunku
    var hitbox = instance_create_layer(x + offset_x, y - 16, oPlayer.layer, oHitboxEnemy);
    hitbox.image_xscale = 0.75;
    hitbox.life = 22;
    hitbox.idEnemy = _id;
	hitbox.face = face;
}