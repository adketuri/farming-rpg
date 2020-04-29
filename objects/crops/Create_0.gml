/// @description Create crop manager
ds_crops_types = -1;
ds_crops_instances = -1;
ds_crops_data = ds_grid_create(4, 1); // grid_x, grid_y, crop_type, days_old
ds_grid_clear(ds_crops_data, -1);

show_debug_message("Create CropManager")
enum crop {
	tomato, potato, carrot, artichoke, chili, cucumber, corn 	
}

create_crop_type(4, 40, "tomato"); // tomato
create_crop_type(3, 35, "potato"); // potato
create_crop_type(2, 25, "carrot"); // carrot
create_crop_type(4, 45, "artichoke"); // artichoke
create_crop_type(3, 30, "chili"); // chili
create_crop_type(2, 20, "cucumber"); // cucumber
create_crop_type(5, 50, "corn"); // corn

planting = false;
select_crop = 0;

mx = 0;
my = 0;

cell_size = 16;