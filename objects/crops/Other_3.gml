/// @description Clean up
if (ds_exists(ds_crops_types, ds_type_grid)) {
	show_debug_message("crops#Clean Up: Destroy crop types");
	ds_grid_destroy(ds_crops_types);
}