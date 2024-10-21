// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InventoryIsEmpty(rootObject) {
    with (rootObject) {
        var size = ds_list_size(inventory);
		if size == 0
			return true;
    }
    return false;
}
function InventoryIsFull(rootObject) {
    with (rootObject) {
        var size = ds_list_size(inventory);
		if size < INVENTORY_GRID_X * INVENTORY_GRID_Y
			return false;
    }
    return true;
}

function InventoryTakenPositon(rootObject, _x, _y){
	var size = ds_list_size(inventory);
	for(var i = 0; i < size; i++){
		var item = ds_list_find_value(rootObject.inventory, i);
		if(item.grid_x == _x && item.grid_y == _y)
		{
			return item;
		}
	}
		
	return noone;
}

	
function InventoryAdd(rootObject, itemType){
	if(!InventoryIsFull(rootObject)) {
		for (var _y = 0; _y < INVENTORY_GRID_Y; _y++) {
			for (var _x = 0; _x < INVENTORY_GRID_X; _x++) {
				if InventoryTakenPositon(rootObject, _x, _y) == noone {
				
					var item;
				
					if itemType == 1 {
						item = instance_create_depth(0, 0, 20, oTestCoin);		
					}
					item.grid_x = _x;
					item.grid_y = _y;
					item.value = irandom_range(5, 20);
					
					ds_list_add(rootObject.inventory, item);
					return true;
				}
			}
		}
		return false;
		
	}
	else
	{
		show_debug_message("Inventory full");
	}
}

function InventoryRemove(rootObject, itemType){
	var l;
	
	if itemType == 1 {
		l = oTestCoin;	
	}
	
	if (!InventoryIsEmpty(rootObject)){
		for (var _y = INVENTORY_GRID_Y - 1; _y >= 0; _y--) {
			for (var _x = INVENTORY_GRID_X - 1; _x >= 0 ; _x--) {
				var item = InventoryTakenPositon(rootObject, _x, _y);
				
			
				if item != noone && item.object_index == l {
					
					ds_list_delete(rootObject.inventory, ds_list_find_index(rootObject.inventory, item));
					instance_destroy(item);
					
					
					return true;
				}
			}
		}
		//show_debug_message(object_get_name(oTestCoin));
		return false;
	}
	else
	{
		show_debug_message("Inventory empty");
	}
}

function InventoryCalculateWeight(rootObject){
	if (!InventoryIsEmpty(rootObject)){
		_weight = 0;
		var size = ds_list_size(rootObject.inventory);
        for (var i = 0; i < size; i++) {
            _weight += ds_list_find_value(rootObject.inventory, i).weight;
        }
		oPlayer.inventoryWeight = _weight;
	}
}

function OpenInventory(rootObject) {
	draw_set_alpha(0.95);
	draw_sprite_stretched(sInventory, 0, x, y, inventory_w, inventory_h);
	draw_set_alpha(1);
	

	
	for (var i = 0; i < INVENTORY_GRID_Y; i++) {
		var _y = y + i * 16 + y_offset;
		for (var j = 0; j < INVENTORY_GRID_X; j++) {
			var _x = x + j * 16 + x_offset;
			draw_sprite(sGrid, 0, _x-1, _y-1);
			draw_sprite_stretched(sSlot, 0, _x, _y, 14, 14);
			
		}
		
	}	
	
	var size = ds_list_size(rootObject.inventory);
	
	for (var i = 0; i < size; i++) {
		var item = ds_list_find_value(rootObject.inventory, i);
		if item != rootObject.dragging_item
			draw_sprite_stretched(item.inv_sprite, 0, x + item.grid_x * 16 + x_offset + 2, y + item.grid_y * 16 + y_offset + 2, 10, 10);
	}
	
	if (rootObject.dragging_item != noone) {
		show_debug_message("tak");
	    draw_set_color(c_yellow); 
	    draw_sprite_stretched(rootObject.dragging_item.inv_sprite, 0, mouse_x, mouse_y, 10, 10); // Rysowanie przedmiotu w miejscu kursora
	}
}

function dragItem(rootObject) {
	var _x = -1;
	var _y = -1;
	if mouse_x > rootObject.x + x_offset && mouse_x < rootObject.x + x_offset + 16 * INVENTORY_GRID_X
			_x = floor((mouse_x - x - x_offset) / 16);  
		if mouse_y > rootObject.y + y_offset && mouse_y < rootObject.y + y_offset + 16 * INVENTORY_GRID_Y
			_y = floor((mouse_y - y - y_offset) / 16); 
		
	var item;
	
	//show_debug_message(_x + " " + _y);
	
	if _x != -1 && _y != -1 {
		item = InventoryTakenPositon(rootObject, _x, _y);	
	}
	
	if item != noone {
		rootObject.dragging_index = ds_list_find_index(rootObject.inventory, item);
		rootObject.dragging_item = item;
		
	}
}

function releaseItem(rootObject) {
	if (rootObject.dragging_item != noone) {
	    var _x = -1;
		var _y = -1;
		if mouse_x > rootObject.x + x_offset && mouse_x < rootObject.x + x_offset + 16 * INVENTORY_GRID_X
			_x = floor((mouse_x - x - x_offset) / 16);  
		if mouse_y > rootObject.y + y_offset && mouse_y < rootObject.y + y_offset + 16 * INVENTORY_GRID_Y
			_y = floor((mouse_y - y - y_offset) / 16);  
		
		var item;
	
		if _x != -1 && _y != -1 {
			item = InventoryTakenPositon(rootObject, _x, _y);	
		}
	
		if item == noone {
			rootObject.dragging_item.grid_x = _x;
			rootObject.dragging_item.grid_y = _y;
		}
	
	    rootObject.dragging_item = noone;
	    rootObject.dragging_index = -1;
	}	
}