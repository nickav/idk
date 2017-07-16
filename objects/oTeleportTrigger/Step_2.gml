if (image_index == 1) {
	instance_destroy(oPlayer);
	audio_play_sound(sndTeleport, 0, 0);
} else if (image_index > image_number - 1) {
	var inst = instance_nearest(x, y, oTeleportPad);
	if (inst) {
		with (instance_create(0, 0, oFxRoomGoTo)) {
			target = inst.target;
		}
	}
}

event_inherited();