if (play) {
	if(image_index==1){
		if(!audio_is_playing(snd_rockfall)){
			audio_play_sound(snd_rockfall,0,false);
		}
	}
	if(image_index==11){
		if(!audio_is_playing(snd_purr)){
			audio_play_sound(snd_purr,0,false);
		}		
	}
	image_speed = 0.5;
	if (image_index >= image_number - 1) {
		play = false;
		image_speed = 0;
		image_index = image_number - 1;
	}
}