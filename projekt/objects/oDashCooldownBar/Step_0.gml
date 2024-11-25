if (dashCooldownCurrent > 0) {
    dashCooldownCurrent--;
} else {
    instance_destroy(); // Zniszcz obiekt po zakończeniu cooldownu
}
