/// @description Check for click, create a crop
if (keyboard_check_pressed(ord("P"))) { planting = !planting; }

if (planting){
	mx = mouse_x;
	my = mouse_y;
	
	if (mouse_wheel_up())	{ select_crop = (select_crop + 1) % sprite_get_number(s_crops_picked); }
	if (mouse_wheel_down()) { select_crop = select_crop <= 0 ? (sprite_get_number(s_crops_picked) - 1) : (select_crop - 1); } 
	
	if (mouse_check_button_pressed(mb_left)){
		instance_create_crop(mx, my, select_crop);
	}
}

if (instance_exists(o_crop) && keyboard_check_pressed(ord("G"))){
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