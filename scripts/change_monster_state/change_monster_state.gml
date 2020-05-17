///@description change a monster's state
///@arg current state
///@arg desired state

var current_state = argument0;
var desired_state = argument1;

if (current_state == desired_state){
	return current_state;
}
state_time = 0;
return desired_state;