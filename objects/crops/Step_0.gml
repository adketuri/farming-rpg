/// @description Check for click, create a crop
if (room != rm_3){
	exit;
}

// Get selected seed, or -1 if invalid
select_crop = -1;
select_crop = gauges.selected_item;
if (select_crop < item.tomato_seed || select_crop > item.corn_seed){
	select_crop = -1;
	exit;
}

mx = mouse_x;
my = mouse_y;
	
if (mouse_wheel_up())	{ select_crop = (select_crop + 1) % sprite_get_number(s_crops_picked); }
if (mouse_wheel_down()) { select_crop = select_crop <= 0 ? (sprite_get_number(s_crops_picked) - 1) : (select_crop - 1); } 
	
if (mouse_check_button_pressed(mb_left)){
	// Take advantage of the fact that seed id - 10 is the crop. :)
	var inst = instance_create_crop(mx, my, select_crop - 10); 
	if (inst) {
		remove_item_at_index(gauges.selected)
	}
}

