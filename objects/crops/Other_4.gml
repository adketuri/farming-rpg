/// @description Initialize instances

show_debug_message(room);
show_debug_message(is_undefined(ds_crops_instances));
if (room == rm_3) {
	show_debug_message("crops#Room Start: Created crop instances");
	ds_crops_instances = ds_grid_create(room_width div cell_size, room_height div cell_size);	
}