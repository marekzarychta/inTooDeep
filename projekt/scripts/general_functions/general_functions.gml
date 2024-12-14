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

function getControls() {
	if(debug_mode && gamepad_is_connected(0)){
		show_debug_message("gamepad connected");
	}
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