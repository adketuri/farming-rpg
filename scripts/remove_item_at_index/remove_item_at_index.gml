///@description remove an item at some inventory index
///@arg index the index

var quantity = inventory.ds_inventory[# 1, argument0];
if (quantity <= 0){
	show_debug_message("Attempting to remove an item, but it doesn't exist");
	exit;
}

if (quantity == 1){
	inventory.ds_inventory[# 0, argument0] = 0;		
	inventory.ds_inventory[# 1, argument0] = 0;	
} else {
	inventory.ds_inventory[# 1, argument0]--;	
}