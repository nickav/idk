restart = false;

// If moving backwards, place the player on the next pad
if (prevTarget == -2 && instance_exists(oTeleportPadNext) && instance_exists(oPlayer)) {
	oPlayer.x = oTeleportPadNext.x + oTeleportPadNext.sprite_width / 2;
	oPlayer.y = oTeleportPadNext.y - oPlayer.sprite_height / 2;
}