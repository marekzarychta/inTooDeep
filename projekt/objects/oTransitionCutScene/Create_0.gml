// Inicjalizacja zmiennych
fade_out = false;      // Czy trwa fade-out?
fade_in = true;       // Czy trwa fade-in? (domyślnie nie)
alpha = 0; // Jeśli fade-in, zaczynamy od pełnej czerni
speed = 6;          // Prędkość efektu


height_rect = 200//room_height / 4;
_y = height_rect;

if (instance_exists(oGlobal)) {
	layer = oGlobal.layer;
}