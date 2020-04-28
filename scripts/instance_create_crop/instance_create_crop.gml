///@description instance_create_crop
///@arg x
///@arg y
///@arg crop_type

// create instance
var xx = (argument0 div cell_size) * cell_size + cell_size / 2;
var yy = (argument1 div cell_size) * cell_size + cell_size / 2;
var inst = instance_create_layer(xx, yy, "Instances", o_crop);

// Give crop characteristics 
with (inst) {
	crop_type = argument2;
	growth_stage_duration = crops.ds_crops_types[# 0, crop_type];
}

return inst;