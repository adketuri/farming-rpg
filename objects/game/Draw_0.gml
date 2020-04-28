/// @description Draw debug grid

if (!debug) { exit; }

var xx = 0;
var r = room_w div crops.cell_size;
repeat (r) {
	draw_line_color(xx, 0, xx, room_h, c_white, c_white);
	xx += crops.cell_size;
}

var yy = 0;
var r = room_h div crops.cell_size;
repeat (r) {
	draw_line_color(0, yy, room_w, yy, c_white, c_white);
	yy += crops.cell_size;
}