/// @description Harvest

// Take advantage of the fact that seed id - 10 is the crop. :)
var c = select_crop - 10;
show_debug_message("Plant crop at " + string(c));
var inst = instance_create_crop(o_player.plant_target_x, o_player.plant_target_y, c); 
if (inst) {
	remove_item_at_index(gauges.selected)
}
