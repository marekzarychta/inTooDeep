// Draw GUI Event w oHealthBar
draw_sprite(sHeart, 0, x,y);
draw_sprite(sHealthBar, 0, x+sprite_get_width(sHeart)+16, y);  // Rysuj główny sprite na wyliczonych współrzędnych
draw_set_font(Fnt_UI);
draw_text(x - 185, height/2, "Health");  // Rysowanie tekstu "Health" po lewej stronie paska zdrowia

// Rysowanie paska zdrowia
for (var i = 0; i < oPlayer.current_health; i++) {
    var xx =  x+sprite_get_width(sHeart) + 40 + i * stretch;  // Dopasowanie do szerokości
    draw_sprite_stretched(sHealthPoint, 0, xx, y + height/6, stretch, height*2/3);  // Rysowanie zdrowia
}
