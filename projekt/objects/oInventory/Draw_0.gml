/// @description Insert description here
// You can write your code in this editor

draw_sprite_stretched(sInventory, 0, x+2, y, INVENTORY_SLOTS*16+4, 20);

for (var i = 0; i < INVENTORY_SLOTS; i++){
	var xx = x + (i mod INVENTORY_SLOTS) * 16 + 4;
	draw_sprite(sSlot,0,xx,y+2);
	if(inventory[i] != -1){
		draw_sprite_stretched(sItem,inventory[i],xx+3,y+6,10,10);
	}
}