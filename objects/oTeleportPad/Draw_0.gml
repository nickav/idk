// Fill

if (active || floor(current_time / blink_speed) mod blink_speed == 0) {
draw_set_color(color ? color : make_color_rgb(243, 42, 147));
draw_rectangle(x, y, x + sprite_width - 1, y + sprite_height - 1, 0);
}

// Outline
draw_set_color(c_white);
draw_rectangle(x, y, x + sprite_width - 1, y + sprite_height - 1, 1);
draw_rectangle(x + 1, y + 1, x + sprite_width - 1 - 1, y + sprite_height - 1 - 1, 1);

draw_set_color(c_white);