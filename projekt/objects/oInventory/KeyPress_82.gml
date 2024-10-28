if opened {
	var itemRem = InventoryRemove(id);
	show_debug_message(string(itemRem))
	if itemRem != noone {
		instance_destroy(itemRem);	
	}
}