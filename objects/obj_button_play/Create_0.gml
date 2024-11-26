/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

activate_button = function() 
{ // Copied from player code (doorway)
	//move_camera = false;

	instance_create_layer(
	camera_get_view_x(view_camera[0]), //- (camera_get_view_width(view_camera[0])) / 2, 
	camera_get_view_y(view_camera[0]), //- (camera_get_view_height(view_camera[0])) / 2, 
	"FadeoutLayer", obj_fadeout);

	obj_fadeout.alarm[0] = 1
}