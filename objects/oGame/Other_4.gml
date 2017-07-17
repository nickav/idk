restart = false;

// TODO: check target
// If moving backwards, place the player on the next pad
if (prevTarget == -2 && instance_exists(oTeleportPadNext)) {
	oPlayer.x = oTeleportPadNext.x + oTeleportPadNext.sprite_width / 2;
	oPlayer.y = oTeleportPadNext.y - oPlayer.sprite_height / 2;
	if (instance_exists(oTeleport)) {
		oTeleport.x = oPlayer.x;
		oTeleport.y = oPlayer.y;
	}
	if (instance_exists(oCratePoof)) {
		oCratePoof.x = oPlayer.x;
		oCratePoof.y = oPlayer.y;
	}
}