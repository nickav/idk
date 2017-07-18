/// @description  Entity Step 2.0

/// EntityStep();

jumped = false;
landed = false;

if (vy < 1 && vy > -1)
    PlatformCheck();
else
    repeat(abs(vy)) {
        if (!PlatformCheck())
            y += sign(vy);
        else
            break;
    }

if (platformTarget) {
    if (!onGround)
        landed = true;
    
    vy = 0;
}

repeat(abs(vx)) {
    if (place_meeting(x + sign(vx), y, oParSolid) && !place_meeting(x + sign(vx), y - 1, oParSolid))
        y -= 1;
         
    if (place_meeting(x + sign(vx), y + 2, oParSolid) && !place_meeting(x + sign(vx), y + 1, oParSolid))
        y += 1;       
          
    if (!place_meeting(x + sign(vx), y, oParSolid))
        x += sign(vx);
    else
        vx = 0;
}

// Play step sound
if (stepCounter mod 10 == 3 && abs(vx) > 1 && onGround) {
	audio_play_sound(sndStep, 0, 0);
}
