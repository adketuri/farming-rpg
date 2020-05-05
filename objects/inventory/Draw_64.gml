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
		switch(ii){
			case selected_slot:
				if (ii != pickup_slot){
					draw_sprite_part_ext(s_inventory_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
					gpu_set_blendmode(bm_add);
					draw_sprite_part_ext(s_inventory_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
					gpu_set_blendmode(bm_normal);
				}
				break;
				
			case pickup_slot:
				//draw_sprite_part_ext(s_inventory_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 0.2);
				break;
				
			default:
				draw_sprite_part_ext(s_inventory_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
		}
	
		// draw item number
		if (ii != pickup_slot){
			var number = inv_grid[# 1, ii];
			draw_text_color(xx + 2 * scale, yy + 0 * scale, string(number), c_black, c_black, c_black, c_black, 1);
			draw_text_color(xx + 1 * scale, yy - 1 * scale, string(number), c, c, c2, c2, 1);
		}
	}
	
	// increment
	ii++;
	ix = ii mod inv_width;
	iy = ii div inv_width;
}

// draw description
if (selected_slot >= 0){
	var iinfo_grid = ds_items_info, description = "",
	iitem = inv_grid[# 0, selected_slot];
	if (iitem > 0){
		description = iinfo_grid[# 0, iitem] + " - " + iinfo_grid[# 1, iitem]
		draw_text_color(desc_x + 2 * scale, desc_y + 0 * scale, description, c_black, c_black, c_black, c_black, 1);
		draw_text_color(desc_x + 1 * scale, desc_y - 1 * scale, description, c, c, c2, c2, 1);
	}
}

// draw selected item
if (pickup_slot != -1){
	// item
	iitem = inv_grid[# 0, pickup_slot];
	sx = (iitem mod inv_columns) * cell_size;
	sy = (iitem div inv_columns) * cell_size;	
	draw_sprite_part_ext(s_inventory_items, 0, sx, sy, cell_size, cell_size, mousex, mousey, scale, scale, c_white, 1);
	// number
	var inum = inv_grid[# 1, pickup_slot];
	draw_text_color(mousex + 4 * scale, mousey + 0 * scale, string(inum), c_black, c_black, c_black, c_black, 1);
	draw_text_color(mousex + 3 * scale, mousey - 1 * scale, string(inum), c, c, c2, c2, 1);
				
}