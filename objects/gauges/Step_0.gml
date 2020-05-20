/// @description Update selection

if (mouse_wheel_down()){
	selected = (selected + 1) mod slots
} else if (mouse_wheel_up()){
	selected--;
	if (selected < 0){
		selected = slots - 1;	
	}
}
selected_item = inventory.ds_inventory[# 0, selected];