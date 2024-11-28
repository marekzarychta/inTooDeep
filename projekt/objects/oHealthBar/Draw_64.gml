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

// Rysowanie pionowej kreski w danym X (np. X = 500)
var line_x = global.view_width/2;  // Pozycja X, gdzie chcesz narysować kreskę
var line_start_y = 0;  // Początek kreski w osi Y (na górze ekranu)
var line_end_y = global.view_height;  // Koniec kreski w osi Y (na dole ekranu)
// Rysowanie linii
draw_set_color(c_red);  // Ustaw kolor linii (np. czarny)
draw_line(line_x, line_start_y, line_x, line_end_y);
draw_line(0, global.view_height/2, global.view_width, global.view_height/2);


