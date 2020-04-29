///@description instance_create_crop
///@arg x
///@arg y
///@arg crop_type

// get location
var gx = (argument0 div cell_size);
var gy = (argument1 div cell_size);
var xx = gx * cell_size;
var yy = gy * cell_size;
var i_grid = crops.ds_crops_instances;

if (i_grid == undefined){
	show_debug_message("No grid");
	return false;
}
var cell = i_grid[# gx, gy];

// check if valid location
if (cell != 0) {
	show_debug_message("Already planted");
	return false;
}
if (!soil_at(argument0, argument1)){
	show_debug_message("Missing Soil");
	return false;
}

// create instance
var inst = instance_create_layer(xx + cell_size/2, yy + cell_size/2, "Instances", o_crop);
i_grid[# gx, gy] = inst;

// Give crop characteristics 
with (inst) {
	crop_type = argument2;
	growth_stage_duration = crops.ds_crops_types[# 0, crop_type];
}

return inst;