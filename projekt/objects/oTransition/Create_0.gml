// Inicjalizacja zmiennych
fade_out = false;      // Czy trwa fade-out?
fade_in = false;       // Czy trwa fade-in? (domyślnie nie)
alpha = 0; // Jeśli fade-in, zaczynamy od pełnej czerni
speed = 0.02;          // Prędkość efektu

nextRoom = true;
setnextroom = false;
setnextroom_value = Menu;


if (instance_exists(oGlobal)) {
	layer = oGlobal.layer;
}
