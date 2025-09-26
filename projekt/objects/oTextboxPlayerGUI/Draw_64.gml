draw_set_font(Fnt_popup);

// Rysuj obrys (czarny)
draw_set_color(c_black);
for (var ox = -2; ox <= 2; ox++) {
    for (var oy = -2; oy <= 2; oy++) {
        if (ox != 0 || oy != 0) {
            draw_text(x + ox, y + oy, textVal);
        }
    }
}

// Rysuj właściwy tekst (biały)
draw_set_color(c_white);
draw_text(x, y, textVal);

// Zmień czcionkę na mniejszą, jeśli potrzebujesz dalej rysować coś inną czcionką
draw_set_font(Fnt_small);
