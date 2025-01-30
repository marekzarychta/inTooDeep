if (textBoxInstance != noone && instance_exists(textBoxInstance)) { // Jeśli istnieje textbox
	instance_destroy(textBoxInstance); // Usuwamy go
	textBoxInstance = noone; // Resetujemy wskaźnik
}

if (messTextBox != noone && instance_exists(messTextBox)) { // Jeśli istnieje textbox
	instance_destroy(messTextBox); // Usuwamy go
	messTextBox = noone; // Resetujemy wskaźnik
}
		
if (interactionTextBox != noone && instance_exists(interactionTextBox)) { // Jeśli istnieje textbox
	instance_destroy(interactionTextBox); // Usuwamy go
	interactionTextBox = noone; // Resetujemy wskaźnik
}