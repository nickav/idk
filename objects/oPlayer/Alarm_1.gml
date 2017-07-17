///@description Teleport in

instance_create(x, y, oCratePoof);
instance_create(oPlayer.x, oPlayer.y, oTeleport);
audio_play_sound(sndTeleportIn, 0, 0);