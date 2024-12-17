part_emitter_region(global.particleSystem, emitter, bbox_left , bbox_right, bbox_top, bbox_bottom, ps_shape_rectangle, ps_distr_invgaussian);
//part_type_color1(oGlobal.destructionParticleType, c_red);
part_emitter_burst(global.particleSystem, emitter, oGlobal.destructionParticleType, 100 * image_xscale * image_yscale);
audio_play_sound(snd_wall_destroy, 0, false);		
part_emitter_destroy(global.particleSystem, emitter);

shakeCamera(18, 2.5, 0.5);
