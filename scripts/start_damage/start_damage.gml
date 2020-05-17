///@description start damage
///@arg x
///@arg y
///@arg val

with(damager){
	show_debug_message("Start dmg at " + string(argument0) + " " + string(argument1) + " val is: " + string(argument2));
	pending_x = argument0
	pending_y = argument1
	pending_val = argument2	
}