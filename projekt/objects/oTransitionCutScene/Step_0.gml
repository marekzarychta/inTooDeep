if (fade_in) {
    _y -= speed;
    if (_y <= 0) {
        fade_in = false;
    }
} else if (fade_out) {
    _y += speed;
    if (_y >= height_rect) {
		setUIvisibility(true);
        instance_destroy(); 
    }
}
