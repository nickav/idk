/// @description  Variables

// Inherit oParEntity variables
event_inherited();

facing = 1;

// Movement ///////////////////////////////////////////////////////////////////

groundAccel = 1.00;
groundFric  = 2.00;
airAccel    = 0.75;
airFric     = 0.01;
vxMax       = 5.50;
vyMax       = 10.0;
jumpHeight  = 6.00;
jumpDamping = 0.25;
gravNorm    = 0.50;
gravSlide   = 0.25;

clingTime   = 2.0;
kLeftBuf    = 0;
kRightBuf   = 0;

// Misc ///////////////////////////////////////////////////////////////////////

// States
IDLE     = 10;
RUN      = 11;
JUMP     = 12;


// Initialize properties
state  = IDLE;
facing = image_xscale; // Change xscale in editor to adjust initial facing

// For squash + stretch
xscale = 1;
yscale = 1;

///////////////////////////////////////////////////////////////////////////////

attacking = false;

//fallTime = 0;
//fallMax  = 28;
