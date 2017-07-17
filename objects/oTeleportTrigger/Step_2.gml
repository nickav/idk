if (image_index == 1) {
	if (!instance_exists(oPlayer)) {
		instance_destroy();
	} else {
		instance_destroy(oPlayer);
		audio_play_sound(sndTeleport, 0, 0);
	}
} else if (image_index > image_number - 1) {
	if (pad) {
		with (instance_create(0, 0, oFxRoomGoTo)) {
			target = other.pad.target;
		}
		oGame.prevTarget = pad.target;
	}
}

event_inherited();