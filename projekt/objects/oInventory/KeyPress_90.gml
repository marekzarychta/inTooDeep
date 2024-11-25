//if opened {
	var itemRem = InventoryRemove(id);
	//show_debug_message(string(itemRem))
	if itemRem != noone {
		instance_destroy(itemRem);	
	}
	//show_debug_message("inv: "+string(ds_list_size(inventory)) + ", dep: " + string(ds_list_size(oDeposit.items)));
//}