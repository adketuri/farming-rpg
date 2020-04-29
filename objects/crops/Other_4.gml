/// @description Initialize instances

if (room == rm_3 and ds_crops_instances == -1) {
	show_debug_message("crops#Room Start: Created crop instances");
	ds_crops_instances = ds_grid_create(room_width div cell_size, room_height div cell_size);	
}