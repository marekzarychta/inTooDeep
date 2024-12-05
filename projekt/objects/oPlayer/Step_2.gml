/// @description Insert description here
// You can write your code in this editor
if (instance_exists(backpack)) {
	backpack.image_xscale = oPlayer.image_xscale;
	backpack.x = x;
	backpack.y = y;
	if(!isLadder){
	backpack.layer = layer_get_id("Player_below");
	backpack.sprite_index = backpackSprites[currentWeightLevel];
	}else{
	backpack.layer = layer_get_id("Player_overlay");
	backpack.sprite_index = backpackSpritesClimb[currentWeightLevel];

	}
}
//show_debug_message(string(image_speed));