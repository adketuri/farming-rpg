/// @description Plant a crop

// Take advantage of the fact that seed id - 10 is the crop. :)
var c = inventory.quick_selected_item - 10;
if (c < 0){
	show_debug_message("Crop isn't selected anymore, sorry");
	exit;	
}
show_debug_message("Plant crop at " + string(c));
var inst = instance_create_crop(o_player.plant_target_x, o_player.plant_target_y, c); 
if (inst) {
	remove_item_at_index(inventory.quick_selected_index)
}
