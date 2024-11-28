/// @description stun after being attacked
// You can write your code in this editor
if(!audio_is_playing(snd_slime_hit)) audio_play_sound(snd_slime_hit,0,false);
stunned = true;
stun_duration = room_speed * 5; // Stun for 5 seconds