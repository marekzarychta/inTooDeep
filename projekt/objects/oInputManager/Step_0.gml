// klawa
if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down) ||
    keyboard_check_pressed(ord("W")) || keyboard_check_pressed(ord("S")) ||
    keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
    
    using_gamepad = false;
}

// kontroler buttony
if (gamepad_button_check_pressed(0, gp_padu) ||
    gamepad_button_check_pressed(0, gp_padd) ||
    gamepad_button_check_pressed(0, gp_face1)) {
    
    using_gamepad = true;
}

// kontroler gałki
var deadzone = 0.2;
var axisY = gamepad_axis_value(0, gp_axislv);

if (abs(axisY) < deadzone) {
    onlyOne = true;
} else if (onlyOne) {
    using_gamepad = true;
    onlyOne = false;
}

if (using_gamepad) {
    sprite_index = sGamepad;
} else {
    sprite_index = sKeyboard;
}