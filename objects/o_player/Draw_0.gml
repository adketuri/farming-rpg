/// @description Draw player

var combat = state == player_state.combat || state == player_state.attacking;
if (combat){
	var xx = x - x_offset_combat; 
	var yy = y - y_offset_combat;
	if (facing == dir.down && state == player_state.attacking){
		yy += 10; // oops haha	
	}
	draw_sprite_part(sprite_sheet_combat, 0, floor(x_frame) * frame_w_combat, floor(y_frame) * frame_h_combat, frame_w_combat, frame_h_combat, xx, yy);	
} else {
	var xx = x - x_offset; 
	var yy = y - y_offset;
	draw_sprite_part(sprite_sheet, 0, floor(x_frame) * frame_w, floor(y_frame) * frame_h, frame_w, frame_h, xx, yy);
}

if (game.debug){
	if (movement_grid != -1) {
		mp_grid_draw(movement_grid);
	}
	if (my_path != -1 && path_exists(my_path)){
		draw_path(my_path, x, y, true);	
	}
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);
}