// Pozycja startowa
x = -960; // Ukryty za lewą krawędzią
y = 200;
visible = false; // Ukryty na starcie
opened = false;
// Parametry siatki
slot_size = 96; // Rozmiar jednego slotu w siatce
max_columns = 3; // Maksymalna liczba kolumn
padding = 32; // Odstęp między slotami

// Przechowywanie informacji o interfejsie
hovered_item = -1; // Indeks aktualnie najechanego przedmiotu
slide_speed = 20; // Prędkość wysuwania

// Wybieranie itemu
selected_item = 0; // Na starcie pierwszy przedmiot
rows = 0; // Liczba wierszy (obliczana dynamicznie)
