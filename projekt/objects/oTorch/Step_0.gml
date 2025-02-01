if (isLit) {
	if (timer >= buffer) {
		timer = 0;
		buffer = random(10) + 20;
		//part_emitter_burst(global.particleSystem, emitter, oGlobal.torchParticleType, random(2));		
	}

	timer++;

	if (floor(image_index) > prevIndex) {
	
		prevIndex = floor(image_index);
	
		part_emitter_burst(global.particleSystem, emitter, oGlobal.torchParticleType, random(2));		
	}

	if (floor(image_index) == 0) {
		prevIndex = 0;
	}
} else {
	sprite_index = notLitSprite;
	if (instance_exists(light)) {
		if (light.scale_x > 0 || light.scale_y > 0) {
			light.scale_x -= 0.1;
			light.scale_y -= 0.1;
			light.sigma -= 0.01;
			light.x_scaleDiff = 0;
			light.y_scaleDiff = 0;
			if (light.scale_x < 0) light.scale_x = 0;
			if (light.scale_y < 0) light.scale_y = 0;
			if (light.sigma < 0.01) light.sigma = 0.01;
		} else {
			instance_destroy(light.id);
		}
	}
}