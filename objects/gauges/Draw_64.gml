/// @description Draw our gauges
var c = c_white;
var c2 = c_gray;

// Draw HP bar
gui_x = 5;
gui_y = 15;
draw_sprite_part_ext(sprite, 0, back_x, back_y, back_width, back_height, gui_x, gui_y, 1, 1, c_white, 1);
draw_sprite_part_ext(sprite, 0, hp_x, hp_y, round(gauge_width * o_player.hp / o_player.max_hp), gauge_height, gui_x + 1, gui_y + 1, 1, 1, c_white, 1);

// "HP"
var xx = gui_x;
var yy = gui_y - 6;
draw_set_font(f_nums);
draw_set_halign(fa_left);
draw_text_color(xx + 2, yy + 0, "HP", c_black, c_black, c_black, c_black, 1);
draw_text_color(xx + 1, yy - 1, "HP", c, c, c2, c2, 1);

// Value
var xx = gui_x + gauge_width;
var yy = gui_y - 9;
draw_set_font(f_text);
draw_set_halign(fa_right);
draw_text_color(xx + 2, yy + 0, o_player.hp, c_black, c_black, c_black, c_black, 1);
draw_text_color(xx + 1, yy - 1, o_player.hp, c, c, c2, c2, 1);

// Draw hunger back
gui_y = 30;
draw_sprite_part_ext(sprite, 0, back_x, back_y, back_width, back_height, gui_x, gui_y, 1, 1, c_white, 1);
draw_sprite_part_ext(sprite, 0, hunger_x, hunger_y, round(gauge_width * o_player.satiety / o_player.max_satiety), gauge_height, gui_x + 1, gui_y + 1, 1, 1, c_white, 1);

// "Satiety"
var xx = gui_x;
var yy = gui_y - 6;
draw_set_font(f_nums);
draw_set_halign(fa_left);
draw_text_color(xx + 2, yy + 0, "Satiety", c_black, c_black, c_black, c_black, 1);
draw_text_color(xx + 1, yy - 1, "Satiety", c, c, c2, c2, 1);

// Date
gui_x = 5;
gui_y = 39;
var xx = gui_x;
var yy = gui_y;
draw_text_color(xx + 2, yy + 0, "Day: " + string(daycycle.day), c_black, c_black, c_black, c_black, 1);
draw_text_color(xx + 1, yy - 1, "Day: " + string(daycycle.day), c, c, c2, c2, 1);
//yy += 6;
//draw_text_color(xx + 2, yy + 0, "Week: " + string(daycycle.week), c_black, c_black, c_black, c_black, 1);
//draw_text_color(xx + 1, yy - 1, "Week: " + string(daycycle.week), c, c, c2, c2, 1);

// Draw inventory
var inv_width = 170;
gui_x = gui_width / 2 - inv_width / 2;
gui_y = 5;
draw_sprite_part_ext(s_inventory_ui, 0, 0, 112, inv_width, 18, gui_x, gui_y, 1, 1, c_white, 0.7);

// Draw inventory
var ii = 0;
var inv_grid = inventory.ds_inventory;
xx = gui_x - 13;
yy = gui_y + 1;
repeat(slots){
	xx += 20;
	var iitem = inv_grid[# 0, ii];
	var sx = (iitem mod inventory.inv_columns) * inventory.cell_size;
	var sy = (iitem div inventory.inv_columns) * inventory.cell_size;
	
	draw_sprite_part_ext(s_inventory_items, 0, sx, sy, inventory.cell_size, inventory.cell_size, xx, yy, 1, 1, c_white, 1);
	if (ii == selected){
		gpu_set_blendmode(bm_add);
		draw_sprite_part_ext(s_inventory_items, 0, sx, sy, inventory.cell_size, inventory.cell_size, xx, yy, 1, 1, c_white, 1);
		gpu_set_blendmode(bm_normal);	
	}
	var number = inv_grid[# 1, ii];
	if (number > 0){
		draw_text_color(xx + 2, yy + 0, string(number), c_black, c_black, c_black, c_black, 1);
		draw_text_color(xx + 1, yy - 1, string(number), c, c, c2, c2, 1);
	}
	ii++;
}

// Draw selected box
xx = gui_x + selected * 20 + 5
yy = gui_y - 1
draw_sprite_part_ext(s_inventory_ui, 0, 0, 130, 20, 20, xx, yy, 1, 1, c_white, 1);