// Fill

if (active || floor(current_time / blink_speed) mod blink_speed == 0) {
	var col;
	
	switch (index) {
		case 1: col = make_color_rgb(67,225, 168); break;
		default: col = make_color_rgb(243, 42, 147); break;
	}
	
	if (color) col = color;
	
	draw_set_color(col);
	draw_rectangle(x, y, x + sprite_width - 1, y + sprite_height - 1, 0);
}

// Outline
draw_set_color(c_white);
draw_rectangle(x, y, x + sprite_width - 1, y + sprite_height - 1, 1);
draw_rectangle(x + 1, y + 1, x + sprite_width - 1 - 1, y + sprite_height - 1 - 1, 1);

draw_set_color(c_white);