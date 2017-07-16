draw_set_color(c_white);
for (var i = 0; i < 50; i++) {
	var xx = (i * 131071) mod room_width;
	var yy = ((i + 13) * 131071) mod room_height;
	draw_rectangle(xx, yy, xx + 5, yy + 5, 0);
}