restart = false;

// If moving backwards, place the player on the next pad
var player = instance_exists(oPlayer) ? oPlayer : oPlayerSpawner;
if (prevTarget == -2 && instance_exists(oTeleportPadNext) && instance_exists(player)) {
	player.x = oTeleportPadNext.x + oTeleportPadNext.sprite_width / 2;
	player.y = oTeleportPadNext.y - player.sprite_height / 2;
	
	// move instance up a few spaces if we can
	with (player) {
		for (var i = 0; i < 2; i ++) {
			if (!place_meeting(x, y - 16, oParSolid)) y -= 16;
		}
	}
}

// keep track of best room
if (room > furthestRoom) {
	furthestRoom = room;
}

/*if (!instance_exists(oCamera)) {
	instance_create(0, 0, oCamera);
}*/