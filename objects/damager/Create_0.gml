/// @description Initialize damager

// width: x, y, duration, value
// height: different instances
grid_rows = 20;
ds_damages = ds_grid_create(4, grid_rows);

enum dmg_grid {
	x,
	y,
	duration, 
	value,
}

pending_x =- 1;
pending_y =- 1;
pending_val =- 1;