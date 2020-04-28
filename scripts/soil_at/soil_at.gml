///@description soil_at
///@arg x
///@arg y

// Check for soil
var lay_id = layer_get_id("LowerTiles");
var map_id = layer_tilemap_get_id(lay_id);
var data = tilemap_get_at_pixel(map_id, argument0, argument1);
return data > 300;