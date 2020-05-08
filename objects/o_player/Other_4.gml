/// @description Build global collision map

mp_grid_destroy(movement_grid);
mp_grid_clear_all(movement_grid);
movement_grid = mp_grid_create(0, 0, room_width div game.cell_size, room_height div game.cell_size, game.cell_size, game.cell_size)
var xx = 0; repeat(room_width div game.cell_size){
	var yy = 0; repeat(room_height div game.cell_size){
		var lay_id = layer_get_id("Collisions");
		var map_id = layer_tilemap_get_id(lay_id);
		var tile = tilemap_get_at_pixel(map_id, xx * game.cell_size, yy * game.cell_size);
		if (tile > 0){
			mp_grid_add_cell(movement_grid, xx, yy);
		}
		yy++;
	}
	xx++;
}