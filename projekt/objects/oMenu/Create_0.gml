option = 0;

active = true;
level_select = false;
keyboard = false;

prev_mouseX = mouse_x;
prev_mouseY = mouse_y;

upButton = [267, 109, 351, 136];
midButton = [253, 146, 364, 169];
downButton = [267, 183, 351, 206];

time = 40;
sprite_index = sMenuUI;
vel = (sprite_height + 40) / time;
count = 0;

	audio_play_sound(snd_ambient, 0, true);

// Tworzenie instancji obiektu QR GUI
//instance_create_layer(0, 0, "GUI", oItch);


//if (sprite_exists(sMenuDwarfAnimation)) {
//	sMenuDwarfAnimation.speed = 0;
//}