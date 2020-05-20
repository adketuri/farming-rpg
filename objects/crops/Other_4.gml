/// @description Initialize crop instances

if (room == rm_3) {
	ds_crops_instances = ds_grid_create(room_width div cell_size, room_height div cell_size);
	ds_grid_clear(ds_crops_instances, 0);
	
	// respawn crops
	if (ds_crops_data[# 0, 0] != -1){
		var inst_num = ds_grid_height(ds_crops_data)
		var slot = 0;
		repeat (inst_num) {
			// respawn instance	
			respawn_crop(
				ds_crops_data[# 0, slot],
				ds_crops_data[# 1, slot],
				ds_crops_data[# 2, slot],
				ds_crops_data[# 3, slot]
			);
			slot++;
		}
		
		// set growth stage
		with(o_crop){
			var first_growth = 0;
			if (days_old > 0){
				first_growth = 1;	
			}
			growth_stage = first_growth + (days_old div growth_stage_duration);
			if (growth_stage >= max_growth_stage){
				growth_stage = max_growth_stage;
				fully_grown = true;
				alarm[1] = 1;
			}
		}
	}
}