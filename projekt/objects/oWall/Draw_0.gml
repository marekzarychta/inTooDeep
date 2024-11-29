// Ustaw kolor linii
draw_self();
draw_set_color(c_red);

// Rysowanie linii na poziomie gracza
draw_line(0, oWall.bbox_top, room_width, oWall.bbox_top);

// Rysowanie linii na poziomie platformy
var platform = instance_nearest(x, y, oPlayer);
if (platform != noone) {
    draw_set_color(c_blue);
    draw_line(0, platform.y, room_width, platform.y);
}

// Przywróć domyślny kolor rysowania
draw_set_color(c_white);
