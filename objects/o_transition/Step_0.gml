if (state == 0) {
	image_alpha += speed
	if (image_alpha >= 1) {state = 1; switched_event()}
} else if (state >= 1) {
	image_alpha -=speed;
	if (image_alpha <= 0) {instance_destroy()}
}