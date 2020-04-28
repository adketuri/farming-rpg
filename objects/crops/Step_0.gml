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