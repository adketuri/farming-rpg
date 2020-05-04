/// @description Draw inventory

if (!show_inventory) exit;

draw_set_alpha(0.5);
draw_rectangle_color(0, 0, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_sprite_ext(s_inventory_ui, 0, inv_ui_x, inv_ui_y, scale, scale, 0, c_white, 1);

draw_set_font(f_text);
var c = c_white;
var c2 = c_gray;

// Draw Info
var info_grid = ds_player_info;
draw_set_halign(fa_left)
draw_text_color(info_x + 1 * scale, info_y + 1 * scale, info_grid[# 1, 1], c_black, c_black, c_black, c_black, 1);
draw_text_color(info_x, info_y, info_grid[# 1, 1], c, c, c2, c2, 1);
draw_set_halign(fa_right)
draw_text_color(money_x + 1 * scale, info_y + 1 * scale, string(info_grid[# 1, 0]) + " Flips", c_black, c_black, c_black, c_black, 1);
draw_text_color(money_x, info_y, string(info_grid[# 1, 0]) + " Flips", c, c, c2, c2, 1);

// Draw Inventory
var ii, ix, iy, xx, yy, sx, sy, iitem, inv_grid;
ii = 0; ix = 0; iy = 0; inv_grid = ds_inventory;
draw_set_font(f_nums);
draw_set_halign(fa_left)
repeat (inv_slots){
	// x, y location for slot
	xx = slots_x + ((cell_size + x_buffer)*ix*scale);
	yy = slots_y + ((cell_size + y_buffer)*iy*scale);
	
	// item
	iitem = inv_grid[# 0, ii];
	sx = (iitem mod inv_columns) * cell_size;
	sy = (iitem div inv_columns) * cell_size;
	
	if (iitem > 0){
		// draw slot and item
		draw_sprite_part_ext(s_inventory_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
	
		// draw item number
		var number = inv_grid[# 1, ii];
		draw_text_color(xx + 2 * scale, yy + 0 * scale, string(number), c_black, c_black, c_black, c_black, 1);
		draw_text_color(xx + 1 * scale, yy - 1 * scale, string(number), c, c, c2, c2, 1);
	}
	
	
	// increment
	ii++;
	ix = ii mod inv_width;
	iy = ii div inv_width;
}