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