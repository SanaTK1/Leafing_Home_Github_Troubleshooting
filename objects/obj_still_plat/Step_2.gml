/// @description For player collision
// You can write your code in this editor

var _max_spd = obj_player.y_speed
var _check_spd = max(2, _max_spd);

if place_meeting(x, y - _check_spd,obj_player){
	obj_player.y = y - 18 - 16 // BUGGY
	obj_player.current_state = obj_player.grounded_state
}