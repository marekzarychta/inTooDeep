function createTextbox(x, y, text) {
    show_debug_message("Creating textbox at: " + string(x) + ", " + string(y) + " with text: " + text);
    var textbox = instance_create_layer(x, y, oChest.layer, oTextbox);
    textbox.textVal = text;
    return textbox;
}
