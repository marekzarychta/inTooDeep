part_emitter_region(global.particleSystem, emitter, bbox_left , bbox_right, bbox_top, bbox_bottom, ps_shape_rectangle, ps_distr_invgaussian);
//part_type_color1(oGlobal.destructionParticleType, c_orange);
part_emitter_burst(global.particleSystem, emitter, oGlobal.destructionParticleType, 50 * image_xscale * image_yscale);

part_emitter_destroy(global.particleSystem, emitter);

shakeCamera(18, 2, 0.5);

