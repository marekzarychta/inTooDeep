/// @description stun after being attacked
// You can write your code in this editor
if(!audio_is_playing(snd_slime_hit)) {
	
	audio_play_sound(snd_slime_hit, 0, false);
	part_emitter_region(global.particleSystem, emiterLeft, x, x, oHitbox.bbox_bottom - 1, oHitbox.bbox_bottom, ps_shape_line, ps_distr_gaussian);
	part_emitter_burst(global.particleSystem, emiterLeft, oGlobal.slimeParticleType, 80);
	part_emitter_burst(global.particleSystem, emiterLeft, oGlobal.slimeRightParticleType, 80);
}
flashAlpha = 0.8;
stunned = true;
stun_duration = room_speed * 5; // Stun for 5 seconds