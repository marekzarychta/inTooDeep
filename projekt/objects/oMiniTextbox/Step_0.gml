draw_set_font(Fnt_textbox_player);

textWidth = string_width(textVal);
// Jeśli textbox ma podążać za graczem
if (followPlayer) {
    // Aktualizacja pozycji tak, aby był wyśrodkowany
	alpha += alphaSpeed;
	if (alpha > 1) {
	    alpha = 1;
	    alphaSpeed = -abs(alphaSpeed); // Zmiana kierunku
	} else if (alpha < 0) {
	    alpha = 0;
	    alphaSpeed = abs(alphaSpeed); // Zmiana kierunku
	}

    // Zmniejsz licznik czasu
    followTimer -= 1;

    // Zniszcz textbox, gdy licznik osiągnie 0
    if (followTimer <= 0) {
        instance_destroy();
    }
}
