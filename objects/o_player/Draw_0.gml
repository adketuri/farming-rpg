/// @description Draw player

if (facing == dir.left) {
	y_frame = 2; 	
} else if (facing == dir.right) {
	y_frame = 1;	
} else if (facing == dir.up) {
	y_frame = 3; 	
} else if (facing == dir.down) {
	y_frame = 0;	
} else {
	x_frame = 1;	
}

if (global.movement_grid != -1) {
	//mp_grid_draw(global.movement_grid);
}

var xx = x - x_offset;
var yy = y - y_offset;
draw_sprite_part(sprite_sheet, 0, floor(x_frame) * frame_w, floor(y_frame) * frame_h, frame_w, frame_h, xx, yy);

if (x_frame <= anim_length ) {
	x_frame += anim_speed / room_speed;
} 
if (x_frame >= anim_length) {
	x_frame = 0;
}

if (game.debug) draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);
