if (image_index == 1) {
	if (instance_exists(oPlayer)) oPlayer.image_alpha = 0;
} else if (image_index > image_number - 1) {
	instance_destroy();
}