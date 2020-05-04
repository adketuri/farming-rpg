depth = -1;
scale = 4;
cell_size = 16;
show_inventory = false;

inv_width = 8;
inv_height = 3;
inv_slots = inv_width * inv_height;
inv_columns = sprite_get_width(s_inventory_items / cell_size);
inv_rows = sprite_get_height(s_inventory_items / cell_size);
x_buffer = 4;
y_buffer = 4;

selected_slot = 0;
pickup_slot = -1;
m_slotx = 0;
m_sloty = 0;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

inv_ui_w = 170;
inv_ui_h = 100;

inv_ui_x = (gui_width / 2) - (inv_ui_w * 0.5 * scale);
inv_ui_y = (gui_height / 2) - (inv_ui_h * 0.5 * scale);

info_x = inv_ui_x + 4 * scale;
info_y = inv_ui_y + 4 * scale;
money_x = inv_ui_x + (inv_ui_w - 4) * scale;
slots_x = inv_ui_x + 7*scale;
slots_y = inv_ui_y + 23*scale;

// Player Info
// 0 = Money
// 1 = Name

ds_player_info = ds_grid_create(2, 2);
ds_player_info[# 0, 0] = "Flips";
ds_player_info[# 0, 1] = "Name";

ds_player_info[# 1, 0] = irandom_range(0, 200);
ds_player_info[# 1, 1] = "Amalia";

// Inventory
// 0 = Item
// 1 = Amount

ds_inventory = ds_grid_create(2, inv_slots);

// Items
enum item {
	none		= 0,
	tomato		= 1,
	potato		= 2,
	carrot		= 3,
	artichoke	= 4,
	chili		= 5,
	cucumber	= 6,
	corn		= 7,
	height		= 8,
}

var yy = 0; repeat(inv_slots){
	ds_inventory[# 0, yy] = irandom_range(1, item.height - 1)
	ds_inventory[# 1, yy] = irandom_range(1, 10);
	yy++;
}

