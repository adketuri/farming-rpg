///@description respawn_crop
///@arg grid_x
///@arg grid_y
///@arg instance_type
///@arg days_old

var xx = argument0 * cell_size;
var yy = argument1 * cell_size;

// Create the instance
var inst = instance_create_layer(xx + (cell_size / 2), yy + (cell_size / 2), "Instances", o_crop);
ds_crops_instances[# argument0, argument1] = inst;
show_debug_message("Respawned a " + ds_crops_types[# 2, argument2]);
show_debug_message("At " + string(argument0) + " " + string(argument1) + " " + string(argument2) + " " + string(argument3));

// give crop characteristics
with (inst) {
	crop_type = argument2;
	days_old = argument3;
	growth_stage_duration = crops.ds_crops_types[# 0, crop_type]
}

return inst;