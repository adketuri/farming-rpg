/// @description Draw inventory

var c = c_white;
var c2 = c_gray;

#region draw quickbar
var inv_width = 170;
var bar_x = gui_width / 2 - inv_width / 2;
var bar_y = 5;
draw_sprite_part_ext(s_inventory_ui, 0, 0, 112, inv_width, 18, bar_x, bar_y, 1, 1, c_white, 0.7);

var ii = 0;
var inv_grid = ds_inventory;
var bx = bar_x - 13;
var by = bar_y + 1;
repeat(quick_slots){
	bx += 20;
	var iitem = inv_grid[# 0, ii];
	var sx = (iitem mod inv_columns) * cell_size;
	var sy = (iitem div inv_columns) * cell_size;
	
	draw_sprite_part_ext(s_inventory_items, 0, sx, sy, cell_size, cell_size, bx, by, 1, 1, c_white, 1);
	if (ii == quick_selected_index){
		gpu_set_blendmode(bm_add);
		draw_sprite_part_ext(s_inventory_items, 0, sx, sy, cell_size, cell_size, bx, by, 1, 1, c_white, 1);
		gpu_set_blendmode(bm_normal);	
	}
	var number = inv_grid[# 1, ii];
	if (number > 0){
		draw_text_color(bx + 2, by + 0, string(number), c_black, c_black, c_black, c_black, 1);
		draw_text_color(bx + 1, by - 1, string(number), c, c, c2, c2, 1);
	}
	ii++;
}

// Draw selected box
bar_x = bar_x + quick_selected_index * 20 + 5
bar_y = bar_y - 1
draw_sprite_part_ext(s_inventory_ui, 0, 0, 130, 20, 20, bar_x, bar_y, 1, 1, c_white, 1);
#endregion

if (!show_inventory) exit;

draw_set_alpha(0.5);
draw_rectangle_color(0, 0, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_sprite_part(s_inventory_ui, 0, 0, 0, inv_ui_w, inv_ui_h, inv_ui_x, inv_ui_y);

draw_set_font(f_text);


// Draw Info
var info_grid = ds_player_info;
draw_set_halign(fa_left)
draw_text_color(info_x + 1 * scale, info_y + 1 * scale, info_grid[# 1, 1], c_black, c_black, c_black, c_black, 1);
draw_text_color(info_x, info_y, info_grid[# 1, 1], c, c, c2, c2, 1);
draw_set_halign(fa_right)
draw_text_color(money_x + 1 * scale, info_y + 1 * scale, string(info_grid[# 1, 0]) + " Flips", c_black, c_black, c_black, c_black, 1);
draw_text_color(money_x, info_y, string(info_grid[# 1, 0]) + " Flips", c, c, c2, c2, 1);

// Draw Inventory
var ii, ix, iy, xx, yy, sx, sy, iitem;
ii = 0; ix = 0; iy = 0; inv_grid = ds_inventory;
draw_set_font(f_nums);
draw_set_halign(fa_left);
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
		description = iinfo_grid[# 0, iitem] + "\n" + iinfo_grid[# 1, iitem]
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