// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InventoryIsEmpty(rootObject) {
    with (rootObject) {
        for (var i = 0; i < array_length(inventory); i++) {
            if (inventory[i] != -1) {
                return false;
            }
        }
    }
    return true;
}
function InventoryIsFull(rootObject) {
    with (rootObject) {
        for (var i = 0; i < array_length(inventory); i++) {
            if (inventory[i] == -1) {
                return false;
            }
        }
    }
    return true;
}

function InventorySearch(rootObject, itemType){
		for(var i = 0; i<INVENTORY_SLOTS;i++){
			if(rootObject.inventory[i] == itemType)
			{
				return(i);
			}
		}
}
	
function InventoryAdd(rootObject, itemType){
	if(!InventoryIsFull(rootObject)){
		var _slot = InventorySearch(rootObject, -1);
		if(_slot != -1)
		{
			with (rootObject) inventory[_slot] = itemType;
			return true;
		}
		else return false;
	}
	else
	{
		show_debug_message("Inventory full");
	}
}

function InventoryRemove(rootObject, itemType){
	if (!InventoryIsEmpty(rootObject)){
		var _slot = InventorySearch(rootObject, itemType);
		if (_slot != -1)
		{
			with (rootObject) inventory[_slot] = -1;
			return true;
		}
		else return false;
	}
	else
	{
		show_debug_message("Inventory empty");
	}
}