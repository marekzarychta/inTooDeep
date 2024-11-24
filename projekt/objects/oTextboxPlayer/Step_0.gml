draw_set_font(Fnt_textbox_player);

textWidth = string_width(textVal);
show_debug_message("text width: "+string(textWidth));
// Jeśli textbox ma podążać za graczem
if (followPlayer) {
    // Aktualizacja pozycji tak, aby był wyśrodkowany


    // Zmniejsz licznik czasu
    followTimer -= 1;

    // Zniszcz textbox, gdy licznik osiągnie 0
    if (followTimer <= 0) {
        instance_destroy();
    }
}