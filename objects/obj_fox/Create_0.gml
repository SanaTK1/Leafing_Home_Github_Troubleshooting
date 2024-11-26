/// @description Insert description here
// You can write your code in this editor
var _fg_tilemap = layer_tilemap_get_id("fg_tiles");
var _wood_tilemap = layer_tilemap_get_id("fg_tiles_wood");

terrain_array = [obj_ground, _fg_tilemap, _wood_tilemap]

max_speed = 4
x_speed = 4
x_dir = 1 // 1 = right -1 = left