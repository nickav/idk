// draw motion blur trail
var n = 4;
var dx = xprevious - x, dy = yprevious - y;

for (var i = 1; i <= n; i ++) {
	draw_sprite_ext(
		sprite_index,
		0,
		x + dx * (i / n),
		y + dy * (i / n),
		1,
		1,
		0,
		c_white,
		(n - i + 1) / (n + 1)
	);
}

draw_self();