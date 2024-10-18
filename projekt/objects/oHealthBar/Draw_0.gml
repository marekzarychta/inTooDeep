/// @description Insert description here
// You can write your code in this editor

draw_sprite_stretched(sHealthBar, 0, x,y, MAX_HEALTH*16+6, 16);

for (var i = 0; i < MAX_HEALTH; i++){
	var xx = x + (i mod MAX_HEALTH) * 16 + 3;
	draw_sprite_stretched(sHealthPoint,0,xx,y+3,16,10);
}