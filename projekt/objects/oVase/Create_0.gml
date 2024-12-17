flashAlpha = 0;
flashColor = c_white;

//randomize sprites
vase_sprites = [sVase1, sVase2, sVase3, sVase4];
sprite_index = vase_sprites[random_range(0,4)];


//see if was hit
wasHit = false;

function playSound(){
	audio_play_sound(snd_vase_break_low,0,false);
}