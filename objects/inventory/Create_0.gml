depth = -1;
scale = 1;
cell_size = 16;
show_inventory = false;

inv_width = 8;
inv_height = 3;
inv_slots = inv_width * inv_height;
inv_columns = sprite_get_width(s_inventory_items) / cell_size;
inv_rows = sprite_get_height(s_inventory_items) / cell_size;
x_buffer = 4;
y_buffer = 4;

selected_slot = 0;
pickup_slot = -1;
m_slotx = 0;
m_sloty = 0;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

inv_ui_w = 170;
inv_ui_h = 111;

inv_ui_x = (gui_width / 2) - (inv_ui_w * 0.5 * scale);
inv_ui_y = (gui_height / 2) - (inv_ui_h * 0.5 * scale);

info_x = inv_ui_x + 4 * scale;
info_y = inv_ui_y + 4 * scale;

money_x = inv_ui_x + (inv_ui_w - 4) * scale;

slots_x = inv_ui_x + 7*scale;
slots_y = inv_ui_y + 23*scale;

desc_x = inv_ui_x + 3 * scale;
desc_y = inv_ui_y + 88 * scale;

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
	none			= 0,
	tomato			= 1,
	potato			= 2,
	carrot			= 3,
	artichoke		= 4,
	chili			= 5,
	cucumber		= 6,
	corn			= 7,
	tomato_seed		= 11,
	potato_seed		= 12,
	carrot_seed		= 13,
	artichoke_seed	= 14,
	chili_seed		= 15,
	cucumber_seed	= 16,
	corn_seed		= 17,	
	height			= 18,
}

enum item_attribs {
	name,
	description,
}

#region create items info grid
ds_items_info = ds_grid_create(2, item.height);
var z = item_attribs.name, i = 0;
ds_items_info[# z, i++] = "";
ds_items_info[# z, i++] = "Tomato";
ds_items_info[# z, i++] = "Potato";
ds_items_info[# z, i++] = "Carrot";
ds_items_info[# z, i++] = "Artichoke";
ds_items_info[# z, i++] = "Chili";
ds_items_info[# z, i++] = "Cucumber";
ds_items_info[# z, i++] = "Corn";
ds_items_info[# z, i++] = "";
ds_items_info[# z, i++] = "";
ds_items_info[# z, i++] = "";
ds_items_info[# z, i++] = "Tomato Seed";
ds_items_info[# z, i++] = "Potato Seed";
ds_items_info[# z, i++] = "Carrot Seed";
ds_items_info[# z, i++] = "Artichoke Seed";
ds_items_info[# z, i++] = "Chili Seed";
ds_items_info[# z, i++] = "Cucumber Seed";
ds_items_info[# z, i++] = "Corn Seed";
z = item_attribs.description;
i = 0;
ds_items_info[# z, i++] = "";
ds_items_info[# z, i++] = "A juicy tomato";
ds_items_info[# z, i++] = "A hearty potato";
ds_items_info[# z, i++] = "An orange carrot";
ds_items_info[# z, i++] = "A yummy artichoke";
ds_items_info[# z, i++] = "A spicy chili pepper";
ds_items_info[# z, i++] = "A cucumber";
ds_items_info[# z, i++] = "A cob of corn";
ds_items_info[# z, i++] = "";
ds_items_info[# z, i++] = "";
ds_items_info[# z, i++] = "";
ds_items_info[# z, i++] = "Plant to grow tomatoes";
ds_items_info[# z, i++] = "Plant to grow potatoes";
ds_items_info[# z, i++] = "Plant to grow carrots";
ds_items_info[# z, i++] = "Plant to grow artichokes";
ds_items_info[# z, i++] = "Plant to grow chilis";
ds_items_info[# z, i++] = "Plant to grow cucumber";
ds_items_info[# z, i++] = "Plant to grow corn";

#endregion

var yy = 0; repeat(3){
	ds_inventory[# 0, yy] = irandom_range(item.tomato_seed, item.height - 1)
	ds_inventory[# 1, yy] = irandom_range(1, 10);
	yy++;
}

