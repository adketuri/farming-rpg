depth = -1;
scale = 4;
cell_size = 16;
show_inventory = false;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

inv_ui_w = 170;
inv_ui_h = 100;

inv_ui_x = (gui_width / 2) - (inv_ui_w * 0.5 * scale);
inv_ui_y = (gui_height / 2) - (inv_ui_h * 0.5 * scale);

info_x = inv_ui_x + 4 * scale;
info_y = inv_ui_y + 4 * scale;
money_x = inv_ui_x + (inv_ui_w - 4) * scale;

// Player Info
// 0 = Money
// 1 = Name

ds_player_info = ds_grid_create(2, 2);
ds_player_info[# 0, 0] = "Flips";
ds_player_info[# 0, 1] = "Name";

ds_player_info[# 1, 0] = irandom_range(0, 200);
ds_player_info[# 1, 1] = "Amalia";