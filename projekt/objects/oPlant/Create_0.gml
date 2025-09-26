var play_sound = false;

/// plant_type_id ustawiasz w edytorze jako int (1, 2, 3…)
switch (plant_type_id) {
    case 1:
        plant_base = "sPlant1"; // nazwa bazowa sprite’ów
        break;
    case 2:
        plant_base = "sPlant2";
        break;
    case 3:
        plant_base = "sPlant3";
        break;
    default:
        plant_base = "sPlant1";
}

// startujemy od neutralnej animacji
sprite_index = asset_get_index(plant_base + "_idle");
image_speed = 0.2; // prędkość animacji

