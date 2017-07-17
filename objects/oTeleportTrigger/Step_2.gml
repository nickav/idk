if (image_index == 1) {
	instance_destroy(oPlayer);
	audio_play_sound(sndTeleport, 0, 0);
} else if (image_index > image_number - 1) {
	var inst = instance_nearest(x, y, oTeleportPad);
	var inst2 = instance_nearest(x, y, oTeleportPadPrev);
	
	if (inst && inst2) {
		if (distance_to_object(inst) > distance_to_object(inst2)) {
			inst = inst2;
		}
	}
	if (inst) {
		with (instance_create(0, 0, oFxRoomGoTo)) {
			target = inst.target;
		}
	}
	
	oGame.prevTarget = inst.target;
}

event_inherited();