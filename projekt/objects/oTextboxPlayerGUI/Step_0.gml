draw_set_font(Fnt_popup);
x = obj_player.screenpos_x;
y = obj_player.screenpos_y-(38*4);
textWidth = string_width(textVal);
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