if (!instance_exists(oMenu) && instance_exists(oShake) && !oShake.shaking) {
	sprite_index = sMenuDwarfAnimation;
}

if (image_index >= 18) {
	if (instance_exists(oMenuButton_start)) {
		oMenuButton_start.diff = true;
		instance_destroy();
	}
}
