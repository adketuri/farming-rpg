/// @description Save crops

if (room == rm_3){
	var inst_num = instance_number(o_crop);
	if (inst_num == 0){ 
		ds_grid_clear(ds_crops_data, -1);
		return; 
	}
	// there is crops, resize the grid to match number of instances
	ds_grid_resize(ds_crops_data, ds_grid_width(ds_crops_data), inst_num);
	
	// loop thru and save our crops
	var gw = ds_grid_width(ds_crops_instances);
	var gh = ds_grid_height(ds_crops_instances);
	var slot = 0;
	
	var xx = 0; 
	repeat(gw){
		var yy = 0;
		repeat(gh){
			// if instance exists, save its data
			var inst = ds_crops_instances[# xx, yy];
			if (inst != 0){
				ds_crops_data[# 0, slot] = xx;
				ds_crops_data[# 1, slot] = yy;
				ds_crops_data[# 2, slot] = inst.crop_type;
				ds_crops_data[# 3, slot] = inst.days_old;
				slot++;
			}
			yy++;
		}
		xx++;
	}
	
	// instances no longer needed, let's destroy it
	ds_grid_destroy(ds_crops_instances);
}