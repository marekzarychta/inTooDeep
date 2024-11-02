if mouse_x > x && mouse_x < x + w && mouse_y > y && mouse_y < y + h {
	sprite_index = sprite_hover;
	hover = true;
} else {
	sprite_index = sprite;	
	hover = false;
}

if hover && mouse_check_button_released(mb_left) /*&& !InventoryIsEmpty(oInventory) && choosenSize(oInventory) > 0*/ {
	if inInventory MoveItems(oInventory.inventory, global.lista);
	else MoveItems(global.lista, oInventory.inventory);
}