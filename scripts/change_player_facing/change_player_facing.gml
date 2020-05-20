///@description set facing to a cardinal direction
///@arg x
///@arg y

var target_x = argument0;
var target_y = argument1;

if (abs(target_x - x) < abs(target_y - y)){
	// face up or down	
	if (target_y > y){
		facing = dir.down;	
	} else {
		facing = dir.up;
	}
} else {
	// face left or right
	if (target_x > x){
		facing = dir.right;	
	} else {
		facing = dir.left;
	}
}