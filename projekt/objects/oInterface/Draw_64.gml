if(debug_mode){
// Rysowanie pionowej kreski w danym X (np. X = 500)
var line_x = global.view_width/2;  // Pozycja X, gdzie chcesz narysować kreskę
var line_start_y = 0;  // Początek kreski w osi Y (na górze ekranu)
var line_end_y = global.view_height;  // Koniec kreski w osi Y (na dole ekranu)
// Rysowanie linii
draw_set_color(c_red);  // Ustaw kolor linii (np. czarny)
draw_line(line_x, line_start_y, line_x, line_end_y);
draw_line(0, global.view_height/2, global.view_width, global.view_height/2);
}