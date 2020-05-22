///@description crop_at gets crops at pixel coordinates. returns -1 for an unoccupied slot, 0 for a partially grown slot, and the item id for a ready to harvest slot
///@arg x 
///@arg y

// Check for crops
var xx = argument0 div 16;
var yy = argument1 div 16;

var cell = crops.ds_crops_instances[# xx, yy];

// check if valid location
if (cell == 0) {
	show_debug_message("Found empty");
	return -1;
}
return 1;