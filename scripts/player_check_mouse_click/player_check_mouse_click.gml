if (mouse_check_button_pressed(mb_left)) {
	plant_target_x = -1;
	plant_target_y = -1;
	harvest_target_x = -1;
	harvest_target_y = -1;
	target = -1;
	target_type = -1;
	
	if (instance_exists(o_goal)){
		instance_destroy(o_goal);
	}
	instance_create_layer(mouse_x, mouse_y, "Instances", o_goal);
	begin_movement(o_goal.x, o_goal.y, 100);
	
	if (overlapping){
		target = overlapping;	
		target_type = overlapping_type;
	} else if (soil_at(mouse_x, mouse_y)){
		if (crop_at(mouse_x, mouse_y) == -1 && inventory.quick_selected_item >= item.tomato_seed && inventory.quick_selected_item <= item.corn_seed){
			plant_target_x = mouse_x;
			plant_target_y = mouse_y;
		} else if (crop_at(mouse_x, mouse_y) > 0) {
			harvest_target_x = mouse_x;
			harvest_target_y = mouse_y;	
		}
		
	}
}