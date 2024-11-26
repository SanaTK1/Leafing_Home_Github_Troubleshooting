/// @description Insert description here
// You can write your code in this editor
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
layer_x("bg_layer_1", _cam_x * 0.25); // Change the background layer name to whatever you use in the room editor
layer_y("bg_layer_1", _cam_y); 


var lay_id = layer_get_id("bg_tiles_stone");
var map_id = layer_tilemap_get_id(lay_id);
tilemap_x(map_id, _cam_x * .25);