if (part_emitter_exists(global.particleSystem, emitter))
	part_emitter_destroy(global.particleSystem, emitter);
if (part_emitter_exists(global.particleSystem, emitterR))
	part_emitter_destroy(global.particleSystem, emitterR);
	
ds_list_destroy(healContent);