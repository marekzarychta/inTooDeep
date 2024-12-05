// Draw GUI Event w oHealthBar
draw_sprite(sHealthBar, 0, x, y);  // Rysuj główny sprite na wyliczonych współrzędnych
draw_set_font(Fnt_UI);
draw_text(x - 185, height/2, "Health");  // Rysowanie tekstu "Health" po lewej stronie paska zdrowia

// Rysowanie paska zdrowia
for (var i = 0; i < oPlayer.current_health; i++) {
    var xx =  x + 72+ 3 + i * stretch + i*3;  // Dopasowanie do szerokości
    draw_sprite_stretched(sHealthPoint, 0, xx + 3, y + 24, 60, 18);  // Rysowanie zdrowia
}