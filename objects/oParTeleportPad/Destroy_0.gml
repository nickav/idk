for (var i = 0; i < round(sprite_width / 16); i ++) {
	instance_create(x + i * 16 + sprite_height / 2, y + sprite_height / 2, oCratePoof);
}