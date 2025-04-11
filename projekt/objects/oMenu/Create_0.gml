option = 0;

active = true;
keyboard = false;

prev_mouseX = mouse_x;
prev_mouseY = mouse_y;

upButton = [267, 109, 351, 136];
downButton = [267, 146, 351, 170];

time = 40;
vel = (sprite_height + 40) / time;
count = 0;

	audio_play_sound(snd_ambient, 0, true);

//if (sprite_exists(sMenuDwarfAnimation)) {
//	sMenuDwarfAnimation.speed = 0;
//}