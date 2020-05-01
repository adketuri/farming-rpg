/// @description Insert description here
// You can write your code in this editor


if (room ==	 rm_3){
	if (instance_exists(o_crop)){
		with(o_crop){
			if (growth_stage >= max_growth_stage){
				growth_stage = max_growth_stage;
				fully_grown = true;
				alarm[1] = 1;
			} else {
				days_old++;
				var first_growth = 0;
				if (days_old > 0){
					first_growth = 1;	
				}
				growth_stage = first_growth + (days_old div growth_stage_duration);
			}
		}
	}
} else if (ds_crops_data[# 0, 0] != -1) {
	var h = ds_grid_height(ds_crops_data);
	var yy = 0;
	repeat (h){
		ds_crops_data[# 3, yy] += 1;
		yy++;
	}
}