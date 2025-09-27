// Tekst do wyświetlenia

draw_set_font(Fnt_dialogues);
var text = "Visit us on itch.io!";

// Ustawienia marginesu od krawędzi ekranu
var margin = 20;

// Wymiary sprite'a QR
var qr_width = sprite_get_width(sQR)*2;
var qr_height = sprite_get_height(sQR)*2;

// Pozycja tekstu
var text_x = display_get_gui_width() - margin;
var text_y =  margin + qr_height - 48; // 20px odstępu nad QR

// Pozycja QR (wyśrodkowany pod tekstem)
var qr_x = display_get_gui_width() - margin - qr_width;
var qr_y = margin + qr_height;

// Rysowanie tekstu (wyrównanie do prawej)
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text(text_x, text_y, text);

// Rysowanie QR
draw_sprite_stretched(sQR, 0, qr_x, qr_y, qr_width,qr_height);
