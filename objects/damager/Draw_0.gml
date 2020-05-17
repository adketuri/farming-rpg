/// @description Draw damages
var dgrid = ds_damages;
draw_set_font(f_text);
draw_set_halign(fa_center)

var yy = 0;
repeat (grid_rows){
	var d_dur = dgrid[# dmg_grid.duration, yy]
	if (d_dur > 0){
		var d_x = dgrid[# dmg_grid.x, yy];
		var d_y = dgrid[# dmg_grid.y, yy] + ease_out((d_dur * 10), 0, 30, 30) - 60;
		var d_val = dgrid[# dmg_grid.value, yy];
		var d_alpha = min(1, d_dur);
		draw_text_color(d_x + 1, d_y + 1, d_val, c_black, c_black, c_black, c_black, d_alpha);
		draw_text_color(d_x, d_y, d_val, c_white, c_white, c_gray, c_gray, d_alpha);
	}
	yy++;
}