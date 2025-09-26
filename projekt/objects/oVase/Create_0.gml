flashAlpha = 0;
flashColor = c_white;

//randomize sprites
vase_sprites = [sVase1, sVase2, sVase3, sVase4];
sprite_index = vase_sprites[random_range(0,4)];


//see if was hit
wasHit = false;

sounds = [snd_vase_break, snd_vase_break_low, snd_vase_break_2];

function playSound() {
    var index = irandom(array_length(sounds) - 1);
    audio_play_sound(sounds[index], 0, false);
}
