/// @description Update depths

// Sort in time descending order
var dgrid = ds_damages;

if (pending_val >= 0){
	dgrid[# dmg_grid.duration, 0] = 3
	dgrid[# dmg_grid.x, 0] = pending_x;
	dgrid[# dmg_grid.y, 0] = pending_y;
	dgrid[# dmg_grid.value, 0] = pending_val;
	pending_val = -1;
}
ds_grid_sort(dgrid, dmg_grid.duration, true);

var yy = 0;
repeat (grid_rows){
	if (dgrid[# dmg_grid.duration, yy] > 0){
		dgrid[# dmg_grid.duration, yy] -= delta_time / 1000000;
		if (dgrid[# dmg_grid.duration, yy] < 0){
			dgrid[# dmg_grid.duration, yy] = 0;	
		}
	}
	yy++;
}

