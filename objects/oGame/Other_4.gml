restart = false;

// TODO: hacks
//if (prevRoom > room || hasGun) {
if (prevTarget == -2 && instance_exists(oTeleportPad)) {
	oPlayer.x = oTeleportPad.x + oTeleportPad.sprite_width / 2;
	oPlayer.y = oTeleportPad.y - oPlayer.sprite_height / 2;
	if (instance_exists(oTeleport)) {
		oTeleport.x = oPlayer.x;
		oTeleport.y = oPlayer.y;
	}
	if (instance_exists(oCratePoof)) {
		oCratePoof.x = oPlayer.x;
		oCratePoof.y = oPlayer.y;
	}
}

// ignore restarts
if (prevRoom != room) {
	prevRoom = room;
}