torch_sprites = [sTorch, sTorchSnuff];
sprite_index = torch_sprites[0];

// flag to check if the torch was snuffed already
wasSnuffed = false;

function playSound() {
	audio_play_sound(snd_torch_snuff, 0, false);
}