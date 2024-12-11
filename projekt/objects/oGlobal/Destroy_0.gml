if (ds_exists(global.lista, ds_type_list)) {
	ds_list_destroy(global.lista);	
}

part_system_destroy(global.particleSystem);

part_type_destroy(walkParticleType);
part_type_destroy(fallLeftParticleType);
part_type_destroy(fallRightParticleType);
part_type_destroy(fallParticleType);
