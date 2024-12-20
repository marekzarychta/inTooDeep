if (spawn) {
	if (spawnTimer == 0 && count > 0) {
		spawnTimer = spawnBuffer;
		var skeleton = instance_create_layer(random_range(x - spawnRange, x + spawnRange), y, layer, entity);
		count--;
		skeleton.moveSpd = random_range(0.7, 1.3);
	}
	if (count == 0) {
		instance_destroy();	
	}
}

if (spawnTimer > 0) {
	spawnTimer--;	
}