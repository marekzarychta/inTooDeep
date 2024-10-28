if opened {
	var itemRem = InventoryRemove(id);
	if itemRem != noone {
		instance_destroy(itemRem);	
	}
}