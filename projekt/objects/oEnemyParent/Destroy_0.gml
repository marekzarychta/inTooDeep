if (!fallen_death) {

	var i = instance_create_layer(x, y - 5, layer_get_id("Player_below"), oBone);
	i.sprite_index = sHeadBone
	i.xspd = colapse_dir * 3;
	i.yspd = -1;

	var bone_num = irandom_range(2, 5);

	for (var v = 0; v < bone_num; v++) {
	i = instance_create_layer(x + 4, y - 6 + v, layer_get_id("Player_below"), oBone);
	i.sprite_index = sBone
	i.xspd = colapse_dir * random_range(3, 5);
	i.yspd = -random(1.5);
	}
	
		audio_play_sound(snd_skeleton_fall, 0, false);
} else {
	var i = instance_create_layer(x, y - 5, layer_get_id("Player_below"), oBone);
	i.sprite_index = sHeadBone
	i.xspd = 0;
	i.yspd = 0;

	var bone_num = irandom_range(2, 5);

	for (var v = 0; v < bone_num; v++) {
		var bone_dir = (irandom_range(1, 2) * 2) - 3;
		i = instance_create_layer(x + 4, y - 6 + v, layer_get_id("Player_below"), oBone);
		i.sprite_index = sBone
		i.xspd = bone_dir * random_range(3, 5);
		i.yspd = -random(2.5);
	}	
}

