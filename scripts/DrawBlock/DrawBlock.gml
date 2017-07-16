/// @description DrawBlock(instance, x, y, width, height, primary, secondary);
/// @function DrawBlock
/// @param instance
/// @param x
/// @param y
/// @param width
/// @param height
/// @param primary color
/// @param seonary color
var obj = argument0;
var xx = argument1, yy = argument2;
var ww = argument3 - 1, hh = argument4 - 1;
var primary = argument5, secondary = argument6;


var mr = place_meeting(xx + 1, yy, obj);
var ml = place_meeting(xx - 1, yy, obj);
var mt = place_meeting(xx, yy - 1, obj);
var mb = place_meeting(xx, yy + 1, obj);

/* */
// draw fill
draw_set_color(primary);
draw_rectangle(xx + (ml ? 0 : 2), yy + (mt ? 0 : 2), xx + ww - (mr ? 0 : 2), yy + hh - (mb ? 0 : 2), 0);

/* */
// draw bars
draw_set_color(secondary);

// top
if (!mt) draw_rectangle(xx + (ml ? 0 : 1), yy, xx + ww - (mr ? 0 : 1), yy + 1, 0);
// bottom
if (!mb) draw_rectangle(xx + (ml ? 0 : 1), yy + hh - 1, xx + ww - (mr ? 0 : 1), yy + hh, 0);
// right
if (!mr) draw_rectangle(xx + ww - 1, yy + (mt ? 0 : 1), xx + ww, yy + hh - (mb ? 0 : 1), 0);
// left
if (!ml) draw_rectangle(xx, yy + (mt ? 0 : 1), xx + 1, yy + hh - (mb ? 0 : 1), 0);

/* */
// diagonals

// top left
if (mt && ml && !position_meeting(xx - 1, yy - 1, obj)) draw_rectangle(xx, yy, xx + 1, yy + 1, 0);
// top right
if (mt && mr && !position_meeting(xx + ww + 1, yy - 1, obj)) draw_rectangle(xx + ww - 1, yy, xx + ww, yy + 1, 0);
// bottom left
if (ml && mb && !position_meeting(xx - 1, yy + ww + 1, obj)) draw_rectangle(xx, yy + hh - 1, xx + 1, yy + hh, 0);
// bottom right
if (mr && mb && !position_meeting(xx + ww + 1, yy + ww + 1, obj)) draw_rectangle(xx + ww - 1, yy + hh - 1, xx + ww, yy + hh, 0);