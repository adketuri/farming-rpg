/// @description Create the item
event_inherited();

cell_size = 16;
item_spr = s_inventory_items;
spr_width = sprite_get_width(item_spr);
spr_height = sprite_get_height(item_spr);

item_num = -1;
x_frame = 0;
y_frame = 0;

x_offset = cell_size/2;
y_offset = cell_size;

var item_dir = irandom_range(0, 360);
var len = 30;
goal_x = x + lengthdir_x(len, item_dir);
goal_y = y + lengthdir_y(len, item_dir);
drop_move = true;

angle = 0;
