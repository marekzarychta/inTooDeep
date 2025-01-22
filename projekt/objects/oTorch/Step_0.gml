if (timer >= buffer) {
	timer = 0;
	buffer = random(10) + 20;
	part_emitter_burst(global.particleSystem, emitter, oGlobal.torchParticleType, 1);		
}

timer++;