if (ds_exists(global.lista, ds_type_list)) {
	ds_list_destroy(global.lista);	
}

part_system_destroy(global.particleSystem);

part_type_destroy(walkParticleType);
part_type_destroy(fallLeftParticleType);
part_type_destroy(fallRightParticleType);
part_type_destroy(fallParticleType);
part_type_destroy(dashWhiteParticleType);
part_type_destroy(destructionParticleType);
part_type_destroy(jumpLeftParticleType);
part_type_destroy(jumpRightParticleType);


if (instance_exists(interface)) {
	instance_destroy(interface);	
}

if (instance_exists(camera)) {
	instance_destroy(camera);	
}
if (instance_exists(inventory)) {
	instance_destroy(inventory);	
}
