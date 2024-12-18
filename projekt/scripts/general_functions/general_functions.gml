function emittingDestruction(_howMany, _id) {
	part_emitter_region(global.particleSystem, emitter, _id.bbox_left , _id.bbox_right, _id.bbox_top, _id.bbox_bottom, ps_shape_rectangle, ps_distr_invgaussian);
	//part_type_color1(oGlobal.destructionParticleType, c_red);
	part_emitter_burst(global.particleSystem, emitter, oGlobal.destructionParticleType, _howMany * _id.image_xscale * _id.image_yscale);
		
	part_emitter_destroy(global.particleSystem, emitter);
	audio_play_sound(snd_wall_destroy, 0, false);
	shakeCamera(18, 2.5, 0.5);


}

function save() {
	var state = ds_list_create();
	
	
	var obj_data = ds_map_create();
	ds_map_add(obj_data, "count", ds_list_size(oGlobal.inventory.inventory));
	ds_list_add(state, obj_data);	
	
	
	
	obj_data = ds_map_create();
	ds_map_add(obj_data, "count", ds_list_size(global.lista));
	ds_list_add(state, obj_data);	
	
	
	with (oEnemyParent) {
		obj_data = ds_map_create();
        
        ds_map_add(obj_data, "object_index", object_index);
        ds_map_add(obj_data, "x", x);
        ds_map_add(obj_data, "y", y)
        ds_map_add(obj_data, "layer", layer);
		ds_map_add(obj_data, "imagex", image_xscale);
        ds_map_add(obj_data, "imagey", image_yscale);
        ds_map_add(obj_data, "health_points", health_points); 
        ds_map_add(obj_data, "isAlive", isAlive);

        ds_list_add(state, obj_data);
		show_debug_message("enemy");
	}
	
	with (oChest) {
		if (!object_is_ancestor(id.object_index, oChest)) {
			obj_data = ds_map_create();
        
	        ds_map_add(obj_data, "object_index", object_index);
	        ds_map_add(obj_data, "x", x);
	        ds_map_add(obj_data, "y", y)
	        ds_map_add(obj_data, "layer", layer);
	        ds_map_add(obj_data, "imagex", image_xscale);
	        ds_map_add(obj_data, "imagey", image_yscale);
	        ds_map_add(obj_data, "contents", contents); 
	        ds_map_add(obj_data, "opened", opened);

	        ds_list_add(state, obj_data);	
			show_debug_message("chest");
		}
	}
	
	with (oBox) {
		if (!object_is_ancestor(id.object_index, oBox)) {
			obj_data = ds_map_create();
        
	        ds_map_add(obj_data, "object_index", object_index);
	        ds_map_add(obj_data, "x", x);
	        ds_map_add(obj_data, "y", y)
	        ds_map_add(obj_data, "layer", layer);
	        ds_map_add(obj_data, "imagex", image_xscale);
	        ds_map_add(obj_data, "imagey", image_yscale);

	        ds_list_add(state, obj_data);	
			show_debug_message("box");
		}
	}
	
	with (oCart) {
		obj_data = ds_map_create();
        
        ds_map_add(obj_data, "object_index", object_index);
        ds_map_add(obj_data, "x", x);
        ds_map_add(obj_data, "y", y - 1); // troche wyzej, zeby na pewno jezdzil na torach
        ds_map_add(obj_data, "layer", layer);
        ds_map_add(obj_data, "imagex", image_xscale);
        ds_map_add(obj_data, "imagey", image_yscale);
		ds_map_add(obj_data, "count", ds_list_size(content)); 

        ds_list_add(state, obj_data);	
		show_debug_message("cart");
	}
	
	with (oItemTemplate) {
		obj_data = ds_map_create();
        
        ds_map_add(obj_data, "object_index", object_index);
        ds_map_add(obj_data, "x", x);
        ds_map_add(obj_data, "y", y)
        ds_map_add(obj_data, "layer", layer);
        ds_map_add(obj_data, "imagex", image_xscale);
        ds_map_add(obj_data, "imagey", image_yscale);
        ds_map_add(obj_data, "item_value", item_value); 
        ds_map_add(obj_data, "in_inventory", in_inventory);

        ds_list_add(state, obj_data);	
		show_debug_message("coins");
	}
	
	with (oDoorButton) {
		obj_data = ds_map_create();
        
        ds_map_add(obj_data, "object_index", object_index);
        ds_map_add(obj_data, "x", x);
        ds_map_add(obj_data, "y", y)
        ds_map_add(obj_data, "layer", layer);
        ds_map_add(obj_data, "imagex", image_xscale);
        ds_map_add(obj_data, "imagey", image_yscale);
        ds_map_add(obj_data, "doorX", target.x); 
        ds_map_add(obj_data, "doorY", target.y);
		ds_map_add(obj_data, "opened", target.opened);
		ds_map_add(obj_data, "clicked", clicked);
		ds_map_add(obj_data, "clickable", clickable);
		ds_map_add(obj_data, "cutscene", cutScene);

        ds_list_add(state, obj_data);
		show_debug_message("doors && buttons");
	}
	
	with (oBreakableWallOrange) {
		obj_data = ds_map_create();
        
        ds_map_add(obj_data, "object_index", object_index);
        ds_map_add(obj_data, "x", x);
        ds_map_add(obj_data, "y", y)
        ds_map_add(obj_data, "layer", layer);
        ds_map_add(obj_data, "imagex", image_xscale);
        ds_map_add(obj_data, "imagey", image_yscale);
		ds_list_add(state, obj_data);
	}
	
	with (oBreakableWallRed) {
		obj_data = ds_map_create();
        
        ds_map_add(obj_data, "object_index", object_index);
        ds_map_add(obj_data, "x", x);
        ds_map_add(obj_data, "y", y)
        ds_map_add(obj_data, "layer", layer);
        ds_map_add(obj_data, "imagex", image_xscale);
        ds_map_add(obj_data, "imagey", image_yscale);
		ds_list_add(state, obj_data);
	}
	
	return state;
}

function load(state) {
	//czyszczenie mapki z obiektów, które zostaną ponownie stworzone z nowymi zmiennymi 
    with (oEnemyParent) {
        instance_destroy();
    }
	with (oChest) {
		if (!object_is_ancestor(id.object_index, oChest))
			instance_destroy();
    }
	with (oItemTemplate) {
        instance_destroy();
    }
	with (oBox) {
		if (!object_is_ancestor(id.object_index, oBox))
			instance_destroy();
	}
	with (oCart) {
		if (!object_is_ancestor(id.object_index, oCart))
			instance_destroy();
	}
	with (oDoor) {
		instance_destroy();	
	}	
	with (oDoorButton) {
		instance_destroy();	
	}
	with (oBreakableWallRed) {
		instance_destroy();	
	}

	with (oBreakableWallOrange) {
		instance_destroy();	
	}

	ds_list_clear(oGlobal.inventory.inventory);
	ds_list_clear(global.lista);
	
	var inv =  ds_map_find_value(ds_list_find_value(state, 0), "count");
	var glob =  ds_map_find_value(ds_list_find_value(state, 1), "count");
	var carts = ds_list_create();
	var counter = 0;

	//index 2, bo pierwsze 2 są zajęte przez listy trzymania itemków
    for (var i = 2; i < ds_list_size(state); i++) {
        var obj_data = ds_list_find_value(state, i);
        
        // Stwórz nową instancję obiektu na właściwej warstwie
        var new_instance = instance_create_layer(
            ds_map_find_value(obj_data, "x"),
            ds_map_find_value(obj_data, "y"),
            ds_map_find_value(obj_data, "layer"),
            ds_map_find_value(obj_data, "object_index")
        );
		
		new_instance.image_xscale = ds_map_find_value(obj_data, "imagex");
		new_instance.image_yscale = ds_map_find_value(obj_data, "imagey");

		if (object_is_ancestor(new_instance.object_index, oEnemyParent)) {
			new_instance.health_points = ds_map_find_value(obj_data, "health_points");
			new_instance.isAlive = ds_map_find_value(obj_data, "isAlive");
		}
		if (new_instance.object_index == oChest) {
			new_instance.contents = ds_map_find_value(obj_data, "contents");	
			new_instance.opened = ds_map_find_value(obj_data, "opened");	
		}
		if (object_is_ancestor(new_instance.object_index, oItemTemplate)) {
			new_instance.item_value = ds_map_find_value(obj_data, "item_value");
			new_instance.in_inventory = ds_map_find_value(obj_data, "in_inventory");
			if (new_instance.in_inventory) {
				if (inv != 0) {
					ds_list_add(oGlobal.inventory.inventory, new_instance);
					inv--;
				} else if (glob != 0) {
					ds_list_add(global.lista, new_instance);
					glob--;
				} else if (ds_list_size(carts) > counter ) {
					
					var needCart = ds_list_find_value(carts, counter);
					while (ds_list_find_value(needCart, 1) == 0 && counter < ds_list_size(carts)) {
						counter++;
						needCart = ds_list_find_value(carts, counter);
					}
					
					if (ds_list_find_value(needCart, 1) != 0) {
						ds_list_add(ds_list_find_value(needCart, 0).content, new_instance);
						ds_list_replace(needCart, 1, ds_list_find_value(needCart, 1) - 1);
					}
				}
			}
		}
		if (new_instance.object_index == oCart) {
			var c = ds_map_find_value(obj_data, "count");
			var cart = ds_list_create();
			ds_list_add(cart, new_instance.id);
			ds_list_add(cart, c);
			ds_list_add(carts, cart);
			
		}
		if (new_instance.object_index == oDoorButton) {
			
			new_instance.target.x = ds_map_find_value(obj_data, "doorX"); 
	        new_instance.target.y = ds_map_find_value(obj_data, "doorY");
			new_instance.doorX = new_instance.target.x;
			new_instance.doorY = new_instance.target.y;
			new_instance.cutScene = ds_map_find_value(obj_data, "cutscene");
			new_instance.target.opened =ds_map_find_value(obj_data, "opened");
			new_instance.clicked = ds_map_find_value(obj_data, "clicked");
			new_instance.clickable = ds_map_find_value(obj_data, "clickable");

			
		}
    }
}

function toGold() {
	var size = ds_list_size(oInventory.inventory);
	for (var i = 0; i < size; i++) {
		oGlobal.gold += ds_list_find_value(oInventory.inventory, i).item_value;
	}
	size = ds_list_size(global.lista);
	//show_debug_message(string(size));
	for (var i = 0; i < size; i++) {
		var item = ds_list_find_value(global.lista, i);
		oGlobal.gold += item.item_value;
	}
}

function controlsSetup() {
    bufferTime = 5;

    jumpKeyBuffered = 0;
    jumpKeyBufferTimer = 0;
}

global.controlsBlocked = false;

function blockControls(block){
	global.controlsBlocked = block;
}
function getControls() {
	if (global.controlsBlocked) return; // Sprawdzenie, czy sterowanie jest zablokowane
	attackKey = keyboard_check(ord("X")) + gamepad_button_check(0,gp_face3);
	attackKey = clamp(attackKey, 0, 1);
	
	dashKey = keyboard_check(vk_shift) + gamepad_button_check(0,gp_face2);
	dashKey = clamp(dashKey, 0, 1);
    //direction
    rightKey = keyboard_check(vk_right) + gamepad_button_check(0,gp_padr);
    rightKey = clamp(rightKey, 0, 1);


    leftKey = keyboard_check(vk_left)  + gamepad_button_check(0,gp_padl);
    leftKey = clamp(leftKey, 0, 1);

	useKey = keyboard_check_pressed(ord("C")) + gamepad_button_check_pressed(0,gp_face4);
	useKey = clamp(useKey,0,1);
	
	closeKey = keyboard_check_pressed(vk_escape) + gamepad_button_check_pressed(0,gp_face2);
	closeKey = clamp(closeKey,0,1);
	
	inventoryKeyPressed = keyboard_check_pressed(vk_tab) + gamepad_button_check_pressed(0,gp_shoulderl);
	inventoryKeyPressed = clamp(inventoryKeyPressed,0,1);

    jumpKeyPressed = keyboard_check_pressed(ord("Z")) + gamepad_button_check_pressed(0,gp_face1);
    jumpKeyPressed = clamp(jumpKeyPressed, 0, 1);
    jumpKey = keyboard_check(ord("Z")) + gamepad_button_check(0,gp_face1);
    jumpKey = clamp(jumpKey, 0, 1);
	
	upKeyPressed = keyboard_check_pressed(vk_up) + gamepad_button_check_pressed(0,gp_padu);
    upKeyPressed = clamp(upKeyPressed, 0, 1);
    upKey = keyboard_check(vk_up) + gamepad_button_check(0,gp_padu);
    upKey = clamp(upKey, 0, 1);

    downKey = keyboard_check(vk_down) + gamepad_button_check(0,gp_padd);
	downKey = clamp(downKey, 0, 1);
	

    //downKey = clamp (downKey, 0, 1);
	    // Obsługa gałki analogowej z deadzone
	    var deadzone = 0.2; // Ustawienie strefy martwej
	    axisX = gamepad_axis_value(0, gp_axislh);
	    axisY = gamepad_axis_value(0, gp_axislv);

	    // Sprawdź, czy wartości osi są poza strefą martwą
	    if (abs(axisX) < deadzone) {
	        axisX = 0;
	    } else {
	        axisX = (axisX - sign(axisX) * deadzone) / (1 - deadzone);
	    }

	    if (abs(axisY) < deadzone) {
	        axisY = 0;
	    } else {
	        axisY = (axisY - sign(axisY) * deadzone) / (1 - deadzone);
	    }
if (object_index != oPlayer) {
    return; // Nie wykonuj reszty skryptu, jeśli obiekt nie jest oPlayer
}

    //Jump key buffering
    if jumpKeyPressed {
        jumpKeyBufferTimer = bufferTime;
    }
    if jumpKeyBufferTimer > 0 {
        jumpKeyBuffered = 1;
        jumpKeyBufferTimer--;
    } else {
        jumpKeyBuffered = 0;
    }


}

function inventoryActiveFunc() {
    if oPlayer.isAlive {
        opened = !opened;

        //creation of buttons
        if opened {
            //chosing is only inventory open or deposit and inventory open
            if !global.openedDep {
                but1 = instance_create_layer(0, 0, "UI", oInvButtonDrop);
            }
            else {
                but1 = instance_create_layer(0, 0, "UI", oInvButtonMove);
                but1.inInventory = true;
                oDeposit.but1Dep = instance_create_layer(0, 0, "UI", oInvButtonMove);
                oDeposit.but1Dep.inInventory = false;

            }
        } else {

            //destruction of buttons after closing inventory
            global.openedDep = false;
            CloseInventory(id);

        }
    }
}

function chestHandling(_text) {
    // Upewnij się, że `textBoxInstance` jest zainicjalizowana, jeśli jeszcze tego nie zrobiono
    if (!variable_instance_exists(id, "textBoxInstance")) {
        textBoxInstance = noone;
    }
    var text;
    if _text == "" {
        text = "open";
    } else {
        text = _text;
    }

    if (oPlayer.chestId == id && oPlayer.isAlive) {
        marked = true;
    } else {
        marked = false;
    }

    var dis = oPlayer.x - x;


    if (place_meeting(x, y, oPlayer) || (oCart == object_index)) {
        openable = true; 

    } else {
        openable = false;
    }

    sprite_index = closedSprite;

    // Tworzenie lub usuwanie `oTextbox`
    if (openable && marked) {
        if (textBoxInstance == noone || !instance_exists(textBoxInstance)) { // Tylko jeśli textbox nie istnieje
            textBoxInstance = createTextbox(x, y - 20, text); // Tworzymy textbox
        } else if instance_exists(textBoxInstance) {
            textBoxInstance.textVal = text;
        }
        sprite_index = markSprite;
    } else {
        if (textBoxInstance != noone && instance_exists(textBoxInstance)) { // Jeśli istnieje textbox
            instance_destroy(textBoxInstance); // Usuwamy go
            textBoxInstance = noone; // Resetujemy wskaźnik
        }
    }
}




function toDown(RootObject) {
    var _pixelCheck = 0.9;

    //Move as close to the wall as possible in 0.5px increments
    while !place_meeting(RootObject.x, RootObject.y + _pixelCheck, oWall) {
        RootObject.y += _pixelCheck;
    }
}

function checkingForSlopes(RootObject) {

    var _subPixel = 0.5;
    var isSlope = false;
    if !place_meeting(RootObject.x + RootObject.xspd, RootObject.y - abs(RootObject.xspd) - 1, oWall) {
        while place_meeting(RootObject.x + RootObject.xspd, RootObject.y, oWall) {
            RootObject.y -= _subPixel
        };
        isSlope = true;
    } else {
        //Walk up to wall precisely
        var _pixelCheck = _subPixel * sign(xspd);

        //Move as close to the wall as possible in 0.5px increments
        while !place_meeting(x + _pixelCheck, y, oWall) {
            x += _pixelCheck;
        }

        //Stop movement to collide
        xspd = 0;
    }

    return isSlope;
}

function checkingForSlopesGoingDown(RootObject) {

    var _subPixel = 0.5;

    if RootObject.yspd >= 0 && !place_meeting(RootObject.x + RootObject.xspd, RootObject.y + 1, oWall) &&
        place_meeting(RootObject.x + RootObject.xspd, RootObject.y + abs(RootObject.xspd) + 1, oWall) {
            while !place_meeting(RootObject.x + RootObject.xspd, RootObject.y + _subPixel, oWall) {
                RootObject.y += _subPixel;
            }
        }
}

function smooth(vel, targetSpeed, _smooth) {

    return (targetSpeed * (1 - _smooth) + vel * _smooth);
}