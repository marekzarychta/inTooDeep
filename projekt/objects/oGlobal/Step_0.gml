/// @description Insert description here
// You can write your code in this editor

//timer for the coin ramp up
if oGlobal.coin_chain_timer > 0 {
    oGlobal.coin_chain_timer -= 1;
} else {
    oGlobal.coin_chain = 0;
}

if (keyboard_lastchar != vk_nokey && prev_char != keyboard_lastchar) {
	var _sign = keyboard_lastchar;
	prev_char = _sign;
	show_debug_message(string(_sign));
	if (ds_list_size(last_signs) == string_length(password)) {
		ds_list_delete(last_signs, 0);	
	}
	ds_list_add(last_signs, string(_sign));
}

if (!ejzert_mode) {
	
	var size = ds_list_size(last_signs);
	if (size >= string_length(password)) {
		var word = "";
		for (var i = 0; i < size; i++) {
			word += ds_list_find_value(last_signs, i);
		
		}
		if (word == password) {
			ejzert_mode = true;
			speed_run_timer = current_time;
			timer = 0;
			alfa = 0;
			alfa_end = false;
		}
	}
}

//timer for coin pickup to avoid overlapping
if oGlobal.coin_sound_cooldown > 0 {
    oGlobal.coin_sound_cooldown -= 1;
}
if (!cutscene) {

	if (timer == 0) {
		alfa+= 0.01;
	}

	if (alfa > 1) {
		alfa_end = true;
		alfa = 1;	
	}

	if (alfa_end) {
			
		timer++;
		if (timer > 40) {
			alfa -= 0.01;
			if (alfa <= 0) {
				alfa = 0;
				start_room_text_anim = false;
			}
		}
	}
}

if (room != endRoom && room != przejscie) {
	if(!audio_is_playing(snd_ambient)){
		audio_play_sound(snd_ambient,0,true);
	}	
}

if (room == demo) {
	
	if (!played_intro && !audio_is_playing(snd_level1_intro)) {
		snd_id = audio_play_sound(snd_level1_intro, 0, false);
		
	}
	
	if (!audio_is_playing(snd_id)) {
		played_intro = false;
		audio_play_sound(snd_level1_loop, 0, true);
	}
	
	
} else if (room == demo2) {
	if (!audio_is_playing(snd_level2_loop)) {
		snd_id = audio_play_sound(snd_level2_loop, 0, true);
	}
} else if (room == demo3) {
	
	if (!played_intro && !audio_is_playing(snd_level3_intro)) {
		snd_id = audio_play_sound(snd_level3_intro, 0, false);
		
	}
	
	if (!audio_is_playing(snd_id)) {
		played_intro = false;
		audio_play_sound(snd_level3_loop, 0, true);
	}
	
	
} else if (room == przejscie) {
	if (!played_intro && !audio_is_playing(snd_jingle_intro)) {
		snd_id = audio_play_sound(snd_jingle_intro, 0, false);
		
	}
	
	if (!audio_is_playing(snd_id)) {
		played_intro = false;
		audio_play_sound(snd_jingle_loop, 0, true);
	}
}