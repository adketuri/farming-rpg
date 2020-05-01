/// @description Resize grid

var instance_num = instance_number(par_depthobject);
var dgrid = ds_depthgrid;

ds_grid_resize(dgrid, 2, instance_num);

// Add instances to grid
var yy = 0;
with(par_depthobject){
	dgrid[# 0, yy] = id;
	dgrid[# 1, yy] = y;
	yy++;
}

// Sort in ascending order
ds_grid_sort(dgrid, 1, true);

// Loop grid and draw instances in sort order

yy = 0;
repeat(instance_num){
	// get current id
	inst = dgrid[# 0, yy];
	with (inst) {
		event_perform(ev_draw, 0);	
	}
	yy++;
}