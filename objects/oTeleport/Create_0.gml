pad = instance_nearest(x, y, oParTeleportPad);
// make sure we intersect with the pad
if (!collision_rectangle(x - sprite_width / 2, 0, x + sprite_width / 2, room_height, pad, 0, 1)) {
	pad = 0;
}