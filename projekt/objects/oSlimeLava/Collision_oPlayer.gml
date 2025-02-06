/// @description stun after being attacked
// You can write your code in this editor
if(oPlayer.isDashing){
if(!audio_is_playing(snd_slime_hit)) {
	
	audio_play_sound(snd_slime_hit, 0, false);
	part_emitter_region(global.particleSystem, emiterLeft, x - 15, x + 15, bbox_top + 4, bbox_top + 16, ps_shape_ellipse, ps_distr_invgaussian);
	part_emitter_burst(global.particleSystem, emiterLeft, oGlobal.slimeLavaHitParticleType, 200);
}
flashAlpha = 0.8;
stunned = true;
stun_duration = room_speed * 5; // Stun for 5 seconds
}