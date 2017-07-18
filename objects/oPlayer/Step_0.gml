/// @description  Movement

// Input //////////////////////////////////////////////////////////////////////

var kLeft, kRight, kUp, kDown, kJump, kJumpRelease, kAction, tempAccel, tempFric;

kLeft        = keyboard_check(vk_left)  || keyboard_check(ord("A")) || gamepad_axis_value(0, gp_axislh) < -0.4;
kRight       = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_axis_value(0, gp_axislh) >  0.4;
kUp          = keyboard_check(vk_up)    || keyboard_check(ord("W")) ||  gamepad_axis_value(0, gp_axislv) < -0.4;
kDown        = keyboard_check(vk_down)  || keyboard_check(ord("S")) || gamepad_axis_value(0, gp_axislv) >  0.4;

kJump        = keyboard_check_pressed(vk_space)  || gamepad_button_check_pressed(0, gp_face1);
kJumpRelease = keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face1);

kAction      = kJump;

// Step counter for walking sound
if (kLeft || kRight) {
	stepCounter += 1;
} else {
	stepCounter = 0;
}

if (instance_exists(oTouchCompatible)) {
    // Disable double-click (increases input accuracy)
    device_mouse_dbclick_enable(false);

    // LOL, magic numbers
    for (var i = 0; i < 8; ++i) {
        if (!kLeft)
            kLeft = device_mouse_check_button(i, mb_left) && device_mouse_x(i) > __view_get( e__VW.XView, 0 ) + 16 && device_mouse_x(i) < __view_get( e__VW.XView, 0 ) + 16 + 64 && device_mouse_y(i) > __view_get( e__VW.YView, 0 ) + 280 && device_mouse_y(i) < __view_get( e__VW.YView, 0 ) + 280 + 64;
        if (!kRight)
			kRight = device_mouse_check_button(i, mb_left) && device_mouse_x(i) > __view_get( e__VW.XView, 0 ) + 16 + 80 && device_mouse_x(i) < __view_get( e__VW.XView, 0 ) + 16 + 64 + 80 && device_mouse_y(i) > __view_get( e__VW.YView, 0 ) + 280 && device_mouse_y(i) < __view_get( e__VW.YView, 0 ) + 280 + 64;

        if (!kJump)
            kJump = device_mouse_check_button_pressed(i, mb_left) && device_mouse_x(i) > __view_get( e__VW.XView, 0 ) + 640 - 64 - 16 && device_mouse_x(i) < __view_get( e__VW.XView, 0 ) + 640 - 16 && device_mouse_y(i) > __view_get( e__VW.YView, 0 ) + 280 && device_mouse_y(i) < __view_get( e__VW.YView, 0 ) + 280 + 64;
        if (!kJumpRelease)
            kJumpRelease = device_mouse_check_button_released(i, mb_left) && device_mouse_x(i) > __view_get( e__VW.XView, 0 ) + 640 - 64 - 16 && device_mouse_x(i) < __view_get( e__VW.XView, 0 ) + 640 - 16 && device_mouse_y(i) > __view_get( e__VW.YView, 0 ) + 280 && device_mouse_y(i) < __view_get( e__VW.YView, 0 ) + 280 + 64;

        kAction = kJump;
    }
}

// Movement ///////////////////////////////////////////////////////////////////

// Apply the correct form of acceleration and friction
if (onGround) {
    tempAccel = groundAccel;
    tempFric  = groundFric;
} else {
    tempAccel = airAccel;
    tempFric  = airFric;
}

// Reset wall cling
if ((!cRight && !cLeft) || onGround) {
    canStick = true;
    sticking = false;
}

// Cling to wall
if (((kRight && cLeft) || (kLeft && cRight)) && canStick && !onGround) {
    alarm[0] = clingTime;
    sticking = true;
    canStick = false;
}

// Handle gravity
if (!onGround) {
    if ((cLeft || cRight) && vy >= 0) {
        // Wall slide
        vy = Approach(vy, vyMax, gravSlide);
    } else {
        // Fall normally
        vy = Approach(vy, vyMax, gravNorm);
    }
}

// Left
if (kLeft && !kRight && !sticking) {
    facing = -1;
    state  = RUN;

    // Apply acceleration left
    if (vx > 0)
        vx = Approach(vx, 0, tempFric);
    vx = Approach(vx, -vxMax, tempAccel);
// Right
} else if (kRight && !kLeft && !sticking) {
    facing = 1;
    state  = RUN;

    // Apply acceleration right
    if (vx < 0)
        vx = Approach(vx, 0, tempFric);
    vx = Approach(vx, vxMax, tempAccel);
}

// Friction
if (!kRight && !kLeft) {
    vx = Approach(vx, 0, tempFric);

    state = IDLE;
}

// Wall jump
if (kJump && cLeft && !onGround) {
    yscale = 1.33;
    xscale = 0.67;

	audio_play_sound(sndJump, 0, 0);
    if (kLeft) {
        vy = -jumpHeight * 1.2;
        vx =  jumpHeight * .66;
    } else {
        vy = -jumpHeight * 1.1;
        vx =  vxMax;
    }
}

if (kJump && cRight && !onGround) {
    yscale = 1.33;
    xscale = 0.67;

	audio_play_sound(sndJump, 0, 0);
    if (kRight) {
        vy = -jumpHeight * 1.2;
        vx = -jumpHeight * .66;
    } else {
        vy = -jumpHeight * 1.1;
        vx = -vxMax;
    }
}

// Jump
if (kJump) {
    if (onGround) {
        // Fall thru platform
        if (kDown) {
            if (place_meeting(x, y + 1, oParJumpThru))
                ++y;
        } else {
            vy = -jumpHeight;
			audio_play_sound(sndJump, 0, 0);

            yscale = 1.33;
            xscale = 0.67;
        }
    }
// Variable jumping
} else if (kJumpRelease) {
    if (vy < 0)
        vy *= jumpDamping;
}

// Jump state
if (!onGround)
    state = JUMP;
// Run particles
else if (random(100) > 85 && abs(vx) > 0.5)
    instance_create(x, y + 8, oParticlePlayer);

// Swap facing during wall slide
if (cRight && !onGround && kRight)
    facing = -1;
else if (cLeft && !onGround && kLeft)
    facing = 1;

// Action
attackIndex = Approach(attackIndex, attackTime, 1);
if (kAction && !attacking) {
    // Jab in place
	attackIndex = 0;
}

/* */
/// Squash + stretch

xscale = Approach(xscale, 1, 0.05);
yscale = Approach(yscale, 1, 0.05);

/* */
/// Hitbox

instance_destroy(oPlayerAtkBox);

// Jab
if (attacking && attackIndex > 1) {
	// Create hit box
    with (instance_create(x, y, oPlayerAtkBox)) {
		image_xscale = other.facing;
        bboxleft  = min(other.x + (5 * other.facing), other.x + (30 * other.facing));
        bboxright = max(other.x + (5 * other.facing), other.x + (30 * other.facing));

        bboxtop    = other.y - 1;
        bboxbottom = other.y + 8;
    }
}

// Shoot
if (oGame.hasGun && attacking && attackIndex mod 2 == 0) {
	// fire bullet
	with (ShootBullet(x, y, oBullet)) {
		direction = other.facing > 0 ? 0 : 180;
		speed += abs(other.vx);
	}
	// knockback
	vx -= facing * 3;
}

vx = clamp(vx, -maxVxMax, maxVxMax);

// Teleport
if (kDown && instance_place(x, y + 1, oParTeleportPad)) {
	if (!instance_exists(oTeleportTrigger)) {
		blink += 2; // double because of minus 1 below
		if (blink > 20) {
			instance_create(x, y, oTeleportTrigger);
		}
	}
}

// Blink
if (blink > 0) {
	blink -= 1;
	image_alpha = floor(blink / 2) mod 2 == 0;
}

/* */
// Die
if (y > room_height) {
	dead = true;
	instance_destroy();
}
