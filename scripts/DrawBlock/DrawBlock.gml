/// @description DrawBlock(instance, width, height, primary, secondary, top, left, bottom, right);
/// @function DrawBlock
/// @param instance
/// @param width
/// @param height
/// @param primary color
/// @param seonary color
var obj = argument0;
var ww = argument1 - 1, hh = argument2 - 1;
var primary = argument3, secondary = argument4;


var mr = place_meeting(x + 1, y, obj);
var ml = place_meeting(x - 1, y, obj);
var mt = place_meeting(x, y - 1, obj);
var mb = place_meeting(x, y + 1, obj);

/* */
// draw fill
draw_set_color(primary);
draw_rectangle(x + (ml ? 0 : 2), y + (mt ? 0 : 2), x + ww - (mr ? 0 : 2), y + hh - (mb ? 0 : 2), 0);

/* */
// draw bars
draw_set_color(secondary);

// top
if (!mt) draw_rectangle(x + (ml ? 0 : 1), y, x + ww - (mr ? 0 : 1), y + 1, 0);
// bottom
if (!mb) draw_rectangle(x + (ml ? 0 : 1), y + hh - 1, x + ww - (mr ? 0 : 1), y + hh, 0);
// right
if (!mr) draw_rectangle(x + ww - 1, y + (mt ? 0 : 1), x + ww, y + hh - (mb ? 0 : 1), 0);
// left
if (!ml) draw_rectangle(x, y + (mt ? 0 : 1), x + 1, y + hh - (mb ? 0 : 1), 0);

/* */
// diagonals

// top left
if (mt && ml && !position_meeting(x - 1, y - 1, obj)) draw_rectangle(x, y, x + 1, y + 1, 0);
// top right
if (mt && mr && !position_meeting(x + ww + 1, y - 1, obj)) draw_rectangle(x + ww - 1, y, x + ww, y + 1, 0);
// bottom left
if (ml && mb && !position_meeting(x - 1, y + ww + 1, obj)) draw_rectangle(x, y + hh - 1, x + 1, y + hh, 0);
// bottom right
if (mr && mb && !position_meeting(x + ww + 1, y + ww + 1, obj)) draw_rectangle(x + ww - 1, y + hh - 1, x + ww, y + hh, 0);